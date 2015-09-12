//
//  ViewController.m
//  UITableViewEditDemo
//
//  Created by mac on 14-6-17.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    
    //定义一个数组, 用来记录选择的行
    NSMutableArray *_selectArray;
    
    //定义一个索引数据的数组
    NSMutableArray *_indexArray;
    
    
    //为了实现搜索功能
    UISearchBar *_searchBar; //搜索条
    //为了展示搜索的数据
    UISearchDisplayController *_sdc;
    //定义一个存储搜索结果的数组
    NSMutableArray *_searchResustArray;
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //实现一个简易通讯录
    //<1>创建数据
    _dataArray = [[NSMutableArray alloc] init];
    //NSArray *array1 = @[@"詹桑",@"蕾丝",@"王武"];
    NSMutableArray *array1 = [[NSMutableArray alloc] initWithArray:@[@"詹桑",@"蕾丝",@"王武"]];
    //网友
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithArray:@[@"李磊",@"美美",@"小明"]];
    //同事
    NSMutableArray *array3 = [[NSMutableArray alloc] initWithArray:@[@"媛媛",@"全全",@"玲玲"]];
    //女友
    [_dataArray addObject:array1];
    [_dataArray addObject:array2];
    [_dataArray addObject:array3];
    
    //<2>创建表格式图显示
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //别忘了遵守协议
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    //导航条右侧添加一个按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(switchEdit:)];
    self.navigationItem.rightBarButtonItem = item;
    
    
    _selectArray = [[NSMutableArray alloc] init];
    
    //在索引数组中放上每段的索引标题
    //注意: 数据的个数一般和段数是相同的
    _indexArray = [[NSMutableArray alloc]
initWithObjects:@"网友",@"同事",@"女友",nil];
    
    
    //设置单元格的分割线
    _tableView.separatorColor = [UIColor redColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    //实现搜索功能
    //1.先添加一个搜索条
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    _tableView.tableHeaderView = _searchBar;
    
    //2.再处理搜索事件
    //注意: 搜索条上添加一个取消按钮
    _sdc = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    //为什么?
    //  需求: 需要显示搜索结果
    //  使用搜索控制器中自带的tableView显示
    _sdc.searchResultsDataSource = self;
    //搜索时会依次调用
    //  获取段数,获取行数,获取某行的cell三个方法
    
    _searchResustArray = [[NSMutableArray alloc] init];
    
}

#pragma mark - 设置段头标题和段尾标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _indexArray[section];
}
//设置段尾标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [_indexArray[section]
            stringByAppendingString:@" 结束"];
}

//在段头添加任意一个视图

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    view.backgroundColor = [UIColor yellowColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}



#pragma mark - 索引
//作用: 可以让我们快速的跳转到某个段
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _indexArray;
}



#pragma mark - 表格视图的多行选中,和多行删除
//思路:
//1.编辑风格变为多选风格(空心圆)
//2.记录多选的行
//3.删除多行数据
//注意: 别写成didDeselectRowAtIndexPath
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //参数indexPath传入的选择的行的section和row
    
    [_selectArray addObject:_dataArray[indexPath.section][indexPath.row]];
    
}
//实现反选方法-----删除选择数据中已经选择的数据
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_selectArray removeObject:_dataArray[indexPath.section][indexPath.row]];
}





#pragma mark - 表格视图的行移动
//涉及到数据源中数据的修改
//当单元格移动时执行此方法
//细节: 一旦实现此方法, 编辑状态下单元格右边出现移动的标志
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //做两件事情:
    //1.从源数组中删除数据
    NSMutableArray *srcArray = _dataArray[sourceIndexPath.section];
    NSString *info = srcArray[sourceIndexPath.row];
    [srcArray removeObject:info];
    
    //2.把数据添加到目标数组中
    NSMutableArray *dstArray = _dataArray[destinationIndexPath.section];
    [dstArray insertObject:info atIndex:destinationIndexPath.row];
    [_tableView reloadData];
}



#pragma mark - 表格视图的删除

//这个方法是删除某行或插入一行时执行
//细节: 一旦实现此方法, 向左滑动单元格的时候右边会出现Delete按钮
//参数editingStyle: 表示编辑方式(INSERT,DELETE)
//参数indexPath: 删除或插入的位置
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        //先获取删除数据的子数组
        NSMutableArray *subArray = _dataArray[indexPath.section];
        [subArray removeObjectAtIndex:indexPath.row];
        //任何时候, 一旦修改了数据源中得数据,必须要让表哥视图重新加载数据(否则会出各种问题)
        [_tableView reloadData];
    }
    //如果是插入数据
    if(editingStyle == UITableViewCellEditingStyleInsert)
    {
        //创建插入的数据
        NSString *info = @"今天认识的麦子";
        NSMutableArray *subArray = _dataArray[indexPath.section];
        //subArray addObject:<#(id)#>
        [subArray insertObject:info atIndex:indexPath.row];
        //刷新显示的数据
        [_tableView reloadData];
    }
    
    
}

#pragma mark - 表格视图的插入insert
//思路:
//1. 从普通状态切换到编辑状态
-(void)switchEdit:(UIBarButtonItem *)item
{
    //实现就是编辑状态和正常状态之间的切换
    //切换到编辑状态
    if(_tableView.editing == NO)
    {
        _tableView.editing = YES;
        item.title = @"完成";
    }
    else    //从编辑状态切换到正常状态
    {
        _tableView.editing = NO;
        item.title = @"编辑";
        
        //实现删除操作
        //  把选择的行全部删除
        for (NSString *str in _selectArray) {
            NSLog(@"del str = %@",str);
        }
        
        
        //要删除的数据 _selectArray
        //从哪儿删?  _dataArray(array1,array2,array3);
        for (NSMutableArray *subArray in _dataArray) {
            //把subArray中在_selectArray包含的对象都删掉
            [subArray removeObjectsInArray:_selectArray];
        }
        
        [_tableView reloadData];
        [_selectArray removeAllObjects];
        
    }
}

//控制指定行的编辑风格: 删除或插入
//细节: 编辑方式默认是删除delete
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return UITableViewCellEditingStyleDelete;
    return UITableViewCellEditingStyleInsert;
    
    //设置为多选风格
    //return UITableViewCellEditingStyleDelete|UITableViewCellEditingStyleInsert;
}


#pragma mark - 显示数据

//实现需要实现的方法
//<1>设置段数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //搜索控制器中的tableView获取行数
    if(tableView != _tableView)
    {
        NSLog(@"开始搜索");
        return 1;
    }
    
    
    return _dataArray.count;
}
//<2>设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //搜索控制器中得tableView获取行数
    if(tableView != _tableView)
    {
        //先实现真正的搜索操作,得到搜索结果数组
        [_searchResustArray removeAllObjects];
        for (NSMutableArray *subArray in _dataArray)
        {
            for (NSString *str in subArray) {
                //检测查找数据在str中是否存在
                if([str rangeOfString:_searchBar.text].location != NSNotFound)
                {
                    [_searchResustArray addObject:str];
                }
            }
        }
        
        return _searchResustArray.count;
        
        //返回搜索的结果的行数
    }
    
    
    return [_dataArray[section] count];
}
//<3>设置每行显示的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    //config cell
    //说明: 搜索显示控制器中tableView获取数据
    if(tableView != _tableView)
    {
        NSString *info = _searchResustArray[indexPath.row];
        cell.textLabel.text = info;
        return cell;
    }
    
    
    NSString *info = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = info;
    
    
    return cell;
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
