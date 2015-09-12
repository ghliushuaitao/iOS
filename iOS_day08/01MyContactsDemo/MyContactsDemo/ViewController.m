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
    }
    
    //config cell
    NSString *str = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = str;
    
    return cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
