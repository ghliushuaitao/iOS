//
//  ViewController.m
//  UITableViewUseDemo
//
//  Created by mac on 14-8-29.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    //存储联系人信息的数组
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //需求: 想要显示大量的数据
    //      10行,100行,1000行
    
    //解决: 使用UITableView表格视图实现
    
    //实例: 实现一个通讯录
    
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"春哥",
                  @"凤姐",
                  @"玫瑰姐姐",
                  @"格里高利",
                  @"凯瑟琳",
                  @"明日香",
                  @"凌波丽",
                  @"EXO_SB",
                  @"梦蝶",
                  @"小娜娜",
                  @"花儿",
                  @"李雷",
                  @"春哥",
                  @"凤姐",
                  @"玫瑰姐姐",
                  @"格里高利",
                  @"凯瑟琳",
                  @"明日香",
                  @"凌波丽",
                  @"EXO_SB",
                  @"梦蝶",
                  @"小娜娜",
                  @"花儿",
                  @"李雷",nil];
    for (int i=0; i<1000; i++) {
        [_dataArray addObject:[NSString stringWithFormat:@"数据 %d",i]];
    }
    
    //UITableView的使用
    //创建UITableView
    //关于风格: 有两种风格Plain简单,常用显示大量信息
    //  Grouped分组风格, 常用与配置界面, 联系人界面
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //注意: 表格视图需要设置两个代理
    //控制表格视图的外观, 处理表格视图的事件
    //遵守: UITableViewDelegate
    _tableView.delegate = self;
    
    //设置数据源代理
    //理解: 普通控件把数据直接送给它
    //  表格视图准备好数据, 让表格视图显示自己拿想要显示的数据
    //遵守: UITableViewDataSource
    //  必须实现协议中两个必须实现的方法
    _tableView.dataSource = self;
    //_tableView.dataArray = ????
    
    
    [self.view addSubview:_tableView];
}

//作用: 告诉tableView 应该显示多少行数据
//  这个方法在tableView开始显示数据的时候调用, 返回数据源中数据的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection");
    
    return _dataArray.count;
}

//作用: 告诉tableView每行应该显示什么数据???
//  这个方法在tableView显示每一行数据的时候调用, 这个方法中返回设置好数据的单元格cell
//  注意: 只有在显示某行的才会调用这个方法
//  UITableViewCell表示单元格的类
//简单版本-非专业版本
//问题:  每次显示数据都会创建cell,最后创建很多没有用的cell
/*
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static int count = 0;
    count++;
    NSLog(@"count = %d",count);
    
    //NSLog(@"row = %d",indexPath.row);
    
    
    //需要做两件事情, 创建单元格, 单元格上添加数据,返回
    //创建单元格
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    //indexPath参数传入要显示的行的路径
    //有两个值 section表示要显示哪一段
    //      row表示显示哪一行
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}
*/

//作用: 告诉tableView每行应该显示什么数据???
//  这个方法在tableView显示每一行数据的时候调用, 这个方法中返回设置好数据的单元格cell
//  注意: 只有在显示某行的才会调用这个方法
//实现正常版本/专业版本
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //使用cell复用的形式实现代码
    //名字: cell复用
    
    //复用的例子: 生活中的cell复用
    //  一品三笑吃饭
    
    //分析:
    //  如果没有碗, 老板去买新的碗
    //  如果有洗干净的碗, 取出碗, 放上菜给你呈上来
    
    //定义一个cell的id
    //  以后为了可以在一个tableView显示不同的单元格
    //  相同的单元格设置cell, 为了复用
    static NSString *cellID = @"cell";
    
    //从tableView中拿出一个能否复用的cell
    //理解:  相当于从后厨拿到一个洗干净的碗
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    //如果拿不到可用cell
    //理解:  新餐馆开张没有碗,需要买碗
    static int count=0;
    if(cell == nil)
    {
        //创建一个cell
        //参数Style: 表示cell的风格
        //   风格公有4种
        //常用: UITableViewCellStyleSubtitle
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
        count++;
    }
    NSLog(@"count = %d",count);
    
    //配置cell, 在cell上添加数据
    cell.textLabel.text = _dataArray[indexPath.row];
    
    //cell复用引起的问题
    //注意: 以后使用cell复用的时候一定要注意洗盘子的问题
    //          清理以前cell中得数据
    //出现问题: 一般情况下cell上控件数量不一样的时候
    //              或者风格不一样的时候
    cell.textLabel.textColor = [UIColor blackColor];
    
    if(indexPath.row == 5)
    {
        cell.textLabel.textColor = [UIColor redColor];
    }
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
