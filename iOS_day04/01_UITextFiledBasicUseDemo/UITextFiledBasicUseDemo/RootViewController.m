//
//  RootViewController.m
//  UITextFiledBasicUseDemo
//
//  Created by mac on 14-8-21.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
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
    //  使用代理/委托
    
    //对于界面: 知道如何如理输入完成事件
    //          不知道输入框输入完成
    //对于输入框: 自己知道啥时候输入完成
    //          不知道如何处理
    //          RootViewController
    
    
    //解决: 当输入框输入完成后, 输入框通知界面做出需要的操作
    
    //问题1: 输入给我的界面发送什么消息??
    //问题2: 如果没有的界面没有实现消息对应的方法怎么办?
    
    //实例: 如何回收键盘
    //生活: 让中介找到房子之后通知我们,留下联系方式
    //UI: 想要让输入框输入完成之后通知当前界面, 把当前界面的地址传给输入框
    textField.delegate = self;
    
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
