//
//  AddressListViewController.m
//  AddressBook
//
//  Created by LaoWen on 14-12-18.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "AddressListViewController.h"
#import "DetailViewController.h"

@interface AddressListViewController ()

@end

@implementation AddressListViewController
{
    NSMutableArray *_addresses;//存放联系人地址信息。
    UITableView *_tableView;
    NSInteger _currentRow;//当前修改哪行，-1表示添加
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
    [_addresses release];
    [_tableView release];
    [super dealloc];
}

- (void)prepareData
{
    NSUserDefaults *userDefs = [NSUserDefaults standardUserDefaults];
    
    _addresses = [[NSMutableArray alloc]init];
    [_addresses addObjectsFromArray:[userDefs objectForKey:@"addresses"]];
}

- (void)customUI
{
    //创建+按钮
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(onNew)];
    self.navigationItem.rightBarButtonItem = rightButton;
    [rightButton release];
    
    //创建TableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 320, 416) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

//新建联系人
- (void)onNew
{
    _currentRow = -1;
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.delegate = self;
    [self presentViewController:detailVC animated:YES completion:^{}];
    [detailVC release];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _addresses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        [cell autorelease];
    }
    cell.textLabel.text = _addresses[indexPath.row][@"personName"];
    cell.detailTextLabel.text = _addresses[indexPath.row][@"phoneNumber"];
    return cell;
}

//保存
- (void)DetailViewControllerDelegateSave:(DetailViewController *)detailVC
{
    NSDictionary *address = @{@"personName": detailVC.personName, @"phoneNumber": detailVC.phoneNumber};
    
    if (_currentRow == -1) {//新建
        [_addresses addObject:address];
    } else {
//        [_addresses replaceObjectAtIndex:_currentRow withObject:address];
        [_addresses[_currentRow] setObject:detailVC.personName forKey:@"personName"];
        [_addresses[_currentRow] setObject:detailVC.phoneNumber forKey:@"phoneNumber"];
    }

    [_tableView reloadData];
    
    NSUserDefaults *userDefs = [NSUserDefaults standardUserDefaults];
    [userDefs setObject:_addresses forKey:@"addresses"];
    [userDefs synchronize];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _currentRow = indexPath.row;
    
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.delegate = self;
    detailVC.personName = _addresses[indexPath.row][@"personName"];
    detailVC.phoneNumber = _addresses[indexPath.row][@"phoneNumber"];
    [self.navigationController pushViewController:detailVC animated:YES];
    [detailVC release];
}

@end
