//
//  ThirdViewController.m
//  UINavigationControllerBasicDemo
//
//  Created by mac on 14-8-25.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

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
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    //Third + 返回第一个界面(注销) 小说: 诛仙
    UIButton *backButton = [UIButton systemButtonWithFrame:CGRectMake(100, 200, 200, 30) title:@"返回第一个界面" target:self action:@selector(backButtonClick)];
    [self.view addSubview:backButton];
}
-(void)backButtonClick
{
    //从当前界面直接跳转到根视图控制器
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    //如何从当前界面切换到前面的任意界面
    //第一个参数: 传入要切换的视图控制器
    //数组为导航控制器管理的所有界面
    NSArray *array = self.navigationController.viewControllers;
    [self.navigationController popToViewController:array[1] animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
