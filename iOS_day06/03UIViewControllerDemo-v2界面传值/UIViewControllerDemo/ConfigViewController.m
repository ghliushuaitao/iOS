//
//  ConfigViewController.m
//  UIViewControllerDemo
//
//  Created by mac on 14-8-20.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

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
    
    self.view.backgroundColor = [UIColor blueColor];
    
    //添加一个标签
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    label.text = @"我是配置界面";
    [self.view addSubview:label];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 400, 100, 30);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}
-(void)btnClick:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
