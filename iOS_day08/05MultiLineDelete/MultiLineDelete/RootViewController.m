//
//  RootViewController.m
//  MultiLineDelete
//
//  Created by LaoWen on 14-12-18.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    NSMutableArray *_dataSource;
    NSMutableArray *_indexPathsToDelete;//要删除的行的indexPath数组
    UITableView *_tableView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self prepareData];
    [self customUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_tableView release];
    [_dataSource release];
    [_indexPathsToDelete release];
    [super dealloc];
}

//创建用于显示的假数据
- (void)prepareData
{
    _dataSource = [[NSMutableArray alloc]init];
    for (NSInteger i=0; i<20; i++) {
        NSString *data = [NSString stringWithFormat:@"data:%d", i];
        [_dataSource addObject:data];
    }
    
    _indexPathsToDelete = [[NSMutableArray alloc]init];
}

//创建相应控件
- (void)customUI
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, 320, 430) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    UIButton *btnEdit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnEdit setTitle:@"编辑" forState:UIControlStateNormal];
    btnEdit.frame = CGRectMake(0, 20, 80, 30);
    [btnEdit addTarget:self action:@selector(onEdit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnEdit];
    
    
    UIButton *btnDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnDelete setTitle:@"删除" forState:UIControlStateNormal];
    btnDelete.frame = CGRectMake(120, 0, 80, 30);
    [btnDelete addTarget:self action:@selector(onDelete) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:btnDelete];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [view addSubview:btnDelete];
    _tableView.tableHeaderView = view;//设置TableView的头视图
    [view release];
}

- (void)onDelete
{
    if (_indexPathsToDelete.count == 0 || !_tableView.editing) {
        return;
    }
    
    //先对_indexPathsToDelete降序排序，以免删除的时候下标混乱
    for (NSInteger i=0; i<_indexPathsToDelete.count-1; i++) {
        for (NSInteger j=0; j<_indexPathsToDelete.count-i-1; j++) {
            if ([_indexPathsToDelete[j] row] < [_indexPathsToDelete[j+1] row]) {
                [_indexPathsToDelete exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    
    //先从数据源中删除
    for (NSIndexPath *indexPath in _indexPathsToDelete) {
        [_dataSource removeObjectAtIndex:indexPath.row];
    }
    [_indexPathsToDelete removeAllObjects];
    
    [_tableView reloadData];
}

- (void)onEdit:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"编辑"]) {//进入编辑状态
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        [_tableView setEditing:YES animated:YES];
    } else {//退出编辑状态
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
        [_tableView setEditing:NO animated:YES];
    }
    [_indexPathsToDelete removeAllObjects];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [cell autorelease];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_indexPathsToDelete addObject:indexPath];//把要删除的行的indexPath加入数组
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_indexPathsToDelete removeObject:indexPath];//当前行取消选中状态，把当前行的indexPath从数组中删除
}

@end
