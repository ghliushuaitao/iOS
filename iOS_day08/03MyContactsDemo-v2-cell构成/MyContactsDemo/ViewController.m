//
//  ViewController.m
//  MyContactsDemo
//
//  Created by mac on 14-8-29.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    _dataArray = [[NSMutableArray alloc] init];
    //添加联系人信息
    //分组数据---创建几组数据
    //
    for (int i=0; i<10; i++) {
        
        //创建一组数据
        NSMutableArray *subArray = [[NSMutableArray alloc] init];
        for (int j=0; j<20; j++) {
            NSString *str = [NSString stringWithFormat:@"第%d组,第%d行数据",i,j];
            [subArray addObject:str];
        }
        //把这组数据添加到_dataArray中
        [_dataArray addObject:subArray];
    }
    //数据结构: _dataArray中有10个子数组,每个数组有20个字符串
    
    
    //如何显示这些数据--使用表格视图显示
    //表格风格: 可以选Plain,也可以选Grouped
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //注意: ****为必须实现方法
    //  1.返回组数
    //  2.返回每组的行数  ****
    //  3.返回每行中显示数据(cell) ****
    
    
    //viewDidLoad的最后
    //表格视图添加一个头部视图
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    headView.image = [UIImage imageNamed:@"fenjing.jpg"];
    _tableView.tableHeaderView = headView;
    
}

//返回组数, 告诉tableView要显示多少组
//细节: 要是这个方法不写, 默认是一组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}
//作用: 返回行数
//  参数section: 表示到底要返回哪一组的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //先根据section获取到子数组
    NSArray *subArray = _dataArray[section];
    return subArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
        //单元格设置背景
        UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        backView.image = [[UIImage imageNamed:@"table_cell_bg.png"] stretchableImageWithLeftCapWidth:8 topCapHeight:0];
        cell.backgroundView = backView;
        
        //cell关于定制有一个特别重要的属性
        //  以后cell添加自己的控件, 都加在contentView上
        //cell.contentView
        //注意: 这句代码不要写在if外面
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 100, 30)];
        label.tag = 100;
        //给label设置值放在外面
        [cell.contentView addSubview:label];
    }
    
    //config cell
    NSString *str = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = str;
    
    //cell的构成和cell的基本定制
    //  Subtitle风格的cell默认情况下有4个控件
    //
    cell.textLabel.text = @"小美";
    NSString *file = [NSString stringWithFormat:@"head%d.jpg",indexPath.row%2+1];
    cell.imageView.image = [UIImage imageNamed:file];
    cell.detailTextLabel.text = @"相约黄昏后";
    //风格公有4种: 箭头, i和箭头, 对号, i
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // UIView *accessoryView;
    //cell.accessoryView =
    
    //系统默认的控件限制: 不能修改大小和位置
    //cell.imageView.bounds = CGRectMake(0, 0, 300, 3000);
    //cell.textLabel.textColor = [UIColor redColor];
    
    //给cell添加的label设置值
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = [NSString stringWithFormat:@"info %d",indexPath.row];
    
    
    return cell;
}

//如何修改单元格的高度
//细节: cell默认的高度是44
//  44是iOS界面设计中最小(适宜)触控面积
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

//处理某行的点击事件
//注意: 千万不要写成didDeSelect, didDeSelect表示取消选择
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.message = [NSString stringWithFormat:@"您点击了%d组%d行",indexPath.section,indexPath.row];
    [alertView addButtonWithTitle:@"取消"];
    [alertView show];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
