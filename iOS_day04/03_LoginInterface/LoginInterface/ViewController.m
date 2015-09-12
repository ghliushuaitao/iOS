//
//  ViewController.m
//  LoginInterface
//
//  Created by mac on 14-8-21.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "ViewController.h"

#import "MainViewController.h"

@interface ViewController ()<UITextFieldDelegate>
{
    UITextField *usernameTextField;
    UITextField *passwordTextField;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //干两件事情
    //1. 实现一个登陆界面
    //添加背景图片
    UIImageView *backView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backView.image = [UIImage imageNamed:@"back2.jpg"];
    [self.view addSubview:backView];
    // (0,0,320,480) 4寸屏 568
    
    
    //添加一个logo
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 35)];
    logoView.center = CGPointMake(160, 60);
    logoView.image = [UIImage imageNamed:@"logo_title.png"];
    [self.view addSubview:logoView];
    
    //添加用户名和密码标签
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 80, 30)];
    nameLabel.text = @"用户名:";
    [self.view addSubview:nameLabel];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 150, 80, 30)];
    passwordLabel.text = @"密码:";
    [self.view addSubview:passwordLabel];
    
    
    
    
    //添加两个输入框
    //注意: 输入框中文本会在其他方法中使用
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    usernameTextField.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    usernameTextField.delegate = self;
    usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:usernameTextField];
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    passwordTextField.delegate = self;
    passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:passwordTextField];
    
    UIButton *button  =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 300, 80, 30);
    UIImage *image = [[UIImage imageNamed:@"rr_pub_button_silver"] stretchableImageWithLeftCapWidth:8 topCapHeight:8];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    button.tag = 100;
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *registerButton  =[UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(200, 300, 80, 30);
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [registerButton setBackgroundImage:image forState:UIControlStateNormal];
    registerButton.tag = 101;
    [registerButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    
    //2. 输入框在项目中得一些用法
    
}

-(void)btnClick:(UIButton *)button
{
    //注意: 以后项目中用户名和密码一般发送到服务器验证
    NSString *saveUsername = @"admin";
    NSString *savePassword = @"123456";
    
    //登录
    if(button.tag == 100)
    {
        //登录成功的条件: 用户名正确并且密码也正确
        if([usernameTextField.text isEqualToString:saveUsername]
           && [passwordTextField.text isEqualToString:savePassword])
        {
            //登录成功了, 切换到下个界面
            NSLog(@"login success!");
            
            MainViewController *mvc = [[MainViewController alloc] init];
            [self presentViewController:mvc animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] init];
            alertView.message = @"登录失败,请检查用户名和密码";
            [alertView addButtonWithTitle:@"取消"];
            [alertView show];
        }
        
    }
    
    //注册
    else if(button.tag == 101)
    {
        
    }
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
