//
//  DetailViewController.m
//  AddressBook
//
//  Created by LaoWen on 14-12-18.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    UITextField *_textPersonName;
    UITextField *_textPhoneNumber;
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
    [self customUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customUI
{
    _textPersonName = [[UITextField alloc]initWithFrame:CGRectMake(60, 70, 200, 30)];
    _textPersonName.borderStyle = UITextBorderStyleLine;
    _textPersonName.placeholder = @"姓名";
    [self.view addSubview:_textPersonName];
   
    _textPhoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(60, 130, 200, 30)];
    _textPhoneNumber.borderStyle = UITextBorderStyleLine;
    _textPhoneNumber.placeholder = @"电话";
    [self.view addSubview:_textPhoneNumber];
    
    UIButton *btnSave = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnSave.frame = CGRectMake(60, 180, 200, 30);
    [btnSave setTitle:@"保存" forState:UIControlStateNormal];
    [btnSave addTarget:self action:@selector(onSave) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
    
    //新建联系人时详情页面是用presentViewController方法展现出来的，所以详细页面不在导航控制器里，所以self.navigationController为nil
    //修改联系人时详情页面是用pushViewController方法展现出来的，所以详细页面在导航控制里，所以self.navigationController不为nil
    if (self.navigationController != nil) {
        _textPersonName.text = self.personName;
        _textPhoneNumber.text = self.phoneNumber;
    }
}

- (void)onSave
{
    self.personName = _textPersonName.text;
    self.phoneNumber = _textPhoneNumber.text;
    if (self.delegate) {
        [self.delegate DetailViewControllerDelegateSave:self];
    }
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:^{}];
    }
}

- (void)dealloc
{
    [_textPhoneNumber release];
    [_textPersonName release];
    [_personName release];
    [_phoneNumber release];
    [super dealloc];
}

@end
