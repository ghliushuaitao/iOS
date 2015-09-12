//
//  RootViewController.m
//  Search
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
    UITableView *_tableView;
    UISearchBar *_searchBar;//搜索框
    NSMutableArray *_searchResults;//搜索结果
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
    [_searchResults release];
    [_searchBar release];
    [super dealloc];
}

- (void)prepareData
{
    //创建一个10个分区、每个分区5行的假数据
    _dataSource = [[NSMutableArray alloc]init];
    for (NSInteger i=0; i<10; i++) {//分区
        NSMutableArray *section = [[NSMutableArray alloc]init];
        for (NSInteger j=0; j<5; j++) {//行
            NSString *name = [NSString stringWithFormat:@"%c:%d", i+'A', j];
            [section addObject:name];
        }
        [_dataSource addObject:section];
        [section release];
    }
    
    _searchResults = [[NSMutableArray alloc]init];//创建用于保存搜索结果的数组
}

- (void)customUI
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 460) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    //创建搜索框
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    _searchBar.delegate = self;
    _tableView.tableHeaderView = _searchBar;
    
    //UISearchDisplayController与搜索框关联后当在搜索框中输入内容时，会弹出一个UISearchDisplayController自己创建的TableView把我们原来的TableView覆盖。UISearchDisplayController的searchResultsDataSource searchResultsDelegate分别是其创建的那个Tableview的dataSource和delegate属性
    //这里我们把自己创建的TableView(_tableView)和UISearchDisplayController创建的TableView的代理都设成了self，所以在相应的事件处理函数里需要判断触发事件的到底是哪个TableView.
    UISearchDisplayController *searchDisplayController = [[UISearchDisplayController alloc]initWithSearchBar:_searchBar contentsController:self];
    searchDisplayController.searchResultsDataSource = self;
    searchDisplayController.searchResultsDelegate = self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView != _tableView) {//SearchDisplayController创建的TableView触发了事件
        [_searchResults removeAllObjects];//因为每当搜索框中的内容变化时都华触发numberOfSectionsInTableView，所以搜索之前要先把原来的搜索结果清掉。
        
        //开始真正的搜索
        for (NSArray *section in _dataSource) {//遍历分区
            for (NSString *name in section) {//遍历行
                if ([name rangeOfString:_searchBar.text].location != NSNotFound) {//如果当前行包含搜索框中输入的内容，则当前行符合条件，将当前行内容加到到搜索结果中。
                    [_searchResults addObject:name];
                }
            }
        }
        return 1;
    }
    
    //我自己创建的TableView触发了事件。
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView != _tableView) {//SearchDisplayController创建的TableView触发了事件

        return _searchResults.count;
    }
    
    //我自己创建的TableView触发了事件。
    return [_dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath");
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [cell autorelease];
    }
    if (tableView == _tableView) {//我自己创建的TableView触发了事件。
        cell.textLabel.text = _dataSource[indexPath.section][indexPath.row];
    } else {//SearchDisplayController触发了事件。
        cell.textLabel.text = _searchResults[indexPath.row];
    }

    return cell;
}

//乌鸦脱胎变彩凤
//睡倒巫山梦不圆
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView != _tableView) {//SearchDisplayController创建的TableView触发了事件
        return @"搜索结果";
    }
    
    //我自己创建的TableView触发了事件。
    return [NSString stringWithFormat:@"分区%c", section+'A'];
}

//定制搜索框的取消按钮，纯粹是摸索出来的仅供参考。
- (void)customSearchBar
{
    for (UIView *view in [_searchBar.subviews[0] subviews]) {
        if ([view isKindOfClass:UIButton.class]) {
            UIButton *button = (UIButton *)view;
            [button setTitle:@"取消" forState:UIControlStateNormal];
        }
    }
}

//UISearchBarDelegate协议中定义的方法，当开始编辑时（搜索框成为第一响应者时）被调用。
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    [self customSearchBar];
}

@end
