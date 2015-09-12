//
//  RootViewController.m
//  UITextFiledBasicUseDemo
//
//  Created by mac on 14-8-21.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "RootViewController.h"


//类扩展 (匿名类别)
//作用: 其中定义一些属性和实例变量
@interface RootViewController () <UITextFieldDelegate>
{
    int val;
}
@end

@implementation RootViewController


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
    
    
    //UITextField (文本区域) 输入框控件的使用
    
    //1.基本使用
    //1.1创建和显示
    //细节1: 默认创建的输入没有边框,设置边框
    //细节2: 虚拟键盘需要我们手动回收
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(100, 100, 200, 30);
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    
    //1.2如何回收键盘???
    textField.delegate = self;
    
    
    //2.UITextField的常用属性
    //2.1 设置字体
    textField.font = [UIFont systemFontOfSize:14];
    //2.2 设置文本颜色
    textField.textColor = [UIColor redColor];
    
    //2.3 添加密码键盘(输入文本编程 * .)
    UITextField *passwordTextFiled = [[UITextField alloc] init];
    passwordTextFiled.frame = CGRectMake(100, 150, 200, 30);
    passwordTextFiled.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextFiled.delegate = self;
    [self.view addSubview:passwordTextFiled];
    //secureTextEntry设置为YES变成了密码输入框
    passwordTextFiled.secureTextEntry = YES;
    
    //2.4 设置密码输入框只能输入数字
    //设置键盘类型
    passwordTextFiled.keyboardType = UIKeyboardTypeNumberPad;
    
    //2.5 设置键盘清除模式(添加清除键)
    passwordTextFiled.clearButtonMode = UITextFieldViewModeAlways;
    
    //2.6 设置空白输入提示
    textField.placeholder = @"请输入用户名";
    passwordTextFiled.placeholder = @"请输入密码";
    
    //2.7 取消自动大写
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //2.8 取消单词的自动修正
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    //2.9 设置文本对齐方式
    textField.textAlignment = NSTextAlignmentRight;
    
    //2.10 设置输入框的背景图片
    //UIImage *
    //细节: 没有边框的情况下背景图片才会显示
    textField.borderStyle = UITextBorderStyleNone;
    textField.background = [UIImage imageNamed:@"back.png"];
    
    //2.11 输入框的左侧添加提示图片
    // UIView *
    //细节: 想要让图片显示,设置显示模式
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    headView.image = [UIImage imageNamed:@"head8_100x100"];
    textField.leftView = headView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
}

//目的: 为了回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"textFieldShouldReturn");
    
    //如何回收键盘?
    //  概念: 第一响应者
    //放弃作为第一响应者
    [textField resignFirstResponder];
    
    return YES; //暂时return
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
