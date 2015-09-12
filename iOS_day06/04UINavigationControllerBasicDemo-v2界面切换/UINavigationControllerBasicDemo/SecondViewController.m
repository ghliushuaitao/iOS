//
//  SecondViewController.m
//  UINavigationControllerBasicDemo
//
//  Created by mac on 14-8-25.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "SecondViewController.h"

#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    
    self.title = @"第二个界面";
    
    self.view.backgroundColor = [UIColor greenColor];
    
    //添加一个切换界面的按钮
    UIButton *nextButton = [UIButton systemButtonWithFrame:CGRectMake(100, 100, 100, 30) title:@"下个界面" target:self action:@selector(nextButtonClick)];
    [self.view addSubview:nextButton];
    
    //Second + 返回上个界面
    UIButton *backButton = [UIButton systemButtonWithFrame:CGRectMake(100, 200, 100, 30) title:@"返回上个界面" target:self action:@selector(backButtonClick)];
    [self.view addSubview:backButton];
    
}
-(void)nextButtonClick
{
    ThirdViewController *tvc = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:tvc animated:YES];
}


-(void)backButtonClick
{
    //需求: 手动的返回上一个界面
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
