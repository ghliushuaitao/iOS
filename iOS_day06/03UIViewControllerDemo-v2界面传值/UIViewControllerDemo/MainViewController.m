//
//  MainViewController.m
//  UIViewControllerDemo
//
//  Created by mac on 14-8-20.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "MainViewController.h"

#import "ConfigViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    self.view.backgroundColor = [UIColor greenColor];
    
    //添加一个标签
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    label.text = @"我是主界面";
    [self.view addSubview:label];
    
    //再添加一个Label用于显示传过来的用户名
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
    nameLabel.text = [NSString stringWithFormat:@"用户名是:%@",self.username];
    [self.view addSubview:nameLabel];
    
    
    
    //添加一个退出按钮
    //添加一个切换到下个界面的按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 400, 100, 30);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
  
    
    UIButton *configButton = [UIButton buttonWithType:UIButtonTypeSystem];
    configButton.frame = CGRectMake(100, 200, 100, 30);
    configButton.backgroundColor = [UIColor grayColor];
    [configButton setTitle:@"打开配置" forState:UIControlStateNormal];
    [configButton addTarget:self action:@selector(configBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:configButton];
    
}

-(void)configBtnClick:(UIButton *)button
{
    //切换到配置界面
    ConfigViewController *cvc = [[ConfigViewController alloc] init];
    [self presentViewController:cvc animated:YES completion:nil];
}

-(void)btnClick:(UIButton *)button
{
    //返回登陆界面
    //注意:  最好不要alloc+present
    // dismiss释放
    // 效果: 释放当前界面, 显示present之前的界面
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
