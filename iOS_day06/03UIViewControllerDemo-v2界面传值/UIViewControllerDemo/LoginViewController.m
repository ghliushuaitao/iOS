//
//  LoginViewController.m
//  UIViewControllerDemo
//
//  Created by mac on 14-8-20.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "LoginViewController.h"

#import "MainViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

//界面的初始化方法,用的比较少
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//非常重要
//  当视图控制器中得视图加载完成之后, 就会执行这个方法
//  1.非常重要的属性 self.view, 类似前面 self.window
//  2. 以后界面中添加控件, 在这个方法中添加
//
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //测试
    self.view.backgroundColor = [UIColor redColor];
    //添加一个标签
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    label.text = @"我是第一个界面";
    [self.view addSubview:label];
    
    //添加一个切换到下个界面的按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 30);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"切到主界面" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)btnClick:(UIButton *)button
{
    //用户名
    NSString *username = @"xiaohuahua";
    
    MainViewController *mvc = [[MainViewController alloc] init];
    
    //控制切换的动画风格
    mvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    //注意: 在present之前传值, 否则会变成null
    //当前界面中用户名, 传到mvc主界面中
    //mvc.username = username;
    mvc.username = username;
    
    
    //当前界面切换到下一个界面
    [self presentViewController:mvc animated:YES completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
