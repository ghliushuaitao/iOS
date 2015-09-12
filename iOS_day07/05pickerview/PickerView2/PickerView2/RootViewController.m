//
//  RootViewController.m
//  PickerView2
//
//  Created by LaoWen on 14-12-23.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    UITextField *_text;
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
    _text = [[UITextField alloc]initWithFrame:CGRectMake(50, 60, 100, 30)];
    _text.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_text];
    
    UIPickerView *picker = [[UIPickerView alloc]init];
    picker.dataSource = self;
    picker.delegate = self;
    
    _text.inputView = picker;//把pickerView做为文本框的输入视图，当文本框成为第一响应者时就会弹出pickerView(取代了键盘)
    [picker release];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"Row:%d", row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //把pickerView选中的内容显示到文本框中
    _text.text = [NSString stringWithFormat:@"Row:%d", row];
}

- (void)dealloc
{
    [_text release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
