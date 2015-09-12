//
//  RootViewController.m
//  PickerView1
//
//  Created by LaoWen on 14-12-23.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    NSMutableArray *_dataSource;//存放PickerView中显示的数据
    UILabel *_label;//显示演员和剧中人的对应关系
    NSInteger _col0CurrentRow;//第0列当前选中的行
    NSInteger _col1CurrentRow;//第1列当前选中的行
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
    
    _dataSource = [[NSMutableArray alloc]init];
    [_dataSource addObject:@[@"成龙", @"刘德华", @"范冰冰", @"徐峥", @"黄海波", @"黄渤"]];
    [_dataSource addObject:@[@"段玉", @"西门庆", @"大块头", @"李卫", @"猪八戒"]];
    
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectMake(60, 40, 200, 100)];
    [self.view addSubview:picker];
    picker.dataSource = self;
    picker.delegate = self;
    [picker release];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 200, 30)];
    [self.view addSubview:_label];
}

//返回有几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return _dataSource.count;
}

//返回指定列中有几行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_dataSource[component] count];
}

//返回指定行指定列的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _dataSource[component][row];
}

//选中某一行时被调用，参数二和三分别是行和列
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"didSelectRow: col: %d, row: %d", component, row);
#if 1
    if (component == 0) {
        NSString *actor = _dataSource[0][row];
        NSString *people = _dataSource[1][_col1CurrentRow];
        _label.text = [NSString stringWithFormat:@"%@:%@", actor, people];
        _col0CurrentRow = row;
    } else {
        NSString *people = _dataSource[1][row];
        NSString *actor = _dataSource[0][_col0CurrentRow];
        _label.text = [NSString stringWithFormat:@"%@:%@", actor, people];
        _col1CurrentRow = row;
    }
#else
    //selectedRowInComponent用于返回指定列当前哪行被选中。
    NSString *people = _dataSource[1][[pickerView selectedRowInComponent:1]];
    NSString *actor = _dataSource[0][[pickerView selectedRowInComponent:0]];
    _label.text = [NSString stringWithFormat:@"%@:%@", actor, people];

#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_dataSource release];
    [super dealloc];
}

@end
