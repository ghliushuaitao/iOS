//
//  ViewController.m
//  computer
//
//  Created by Yosemite on 15-3-25.
//  Copyright (c) 2015年 blockz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITextField *text;
    UIButton*btn[16];

    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置背景颜色
//    UIImage * img = [UIImage imageNamed:@"798.png"];
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:img]];
    //初始化输入框
    text = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 280, 50)];
    //输入框的对齐方式
    text.textAlignment = 2;
    //给输入框设置背景颜色
    [text setBackgroundColor:[UIColor grayColor]];
    
    text.userInteractionEnabled = NO;
    //把输入框加入到主视图上
    [self.view addSubview:text];
    
    NSArray * arr = [[NSArray alloc]initWithObjects:@"CL",@"+",@"-",@"X",@"=",@"/",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",nil];
    
    static int c = 0;
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<4; j++) {
            btn[c] = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn[c] setFrame:CGRectMake(3+72*i, 100+90*j, 100 , 115)];
            NSString *str = [NSString stringWithFormat:@"%@",[arr objectAtIndex:c]];
            [btn[c] setTitle:str forState:UIControlStateNormal];
            [btn[c] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn[c].tag = c;
            [btn[c] addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.view addSubview:btn[c]];
            c++;
        }
    }
}

-(void)getbg{
    
    
    for (int i  =0; i<17; i++) {

        [btn[i] removeFromSuperview];
    }

    
}
-(void)click :(UIButton*)sender{

//    int relt = [self judge:sender.titleLabel.text];
//    if (relt == 0) {
//        text.text = @"";
//        return;
//    }
    if ([sender.titleLabel.text  isEqualToString: @"CL"]) {
        text.text = @"";
        return;
    }
    //判断当前点击的是否是=按键
    if ([sender.titleLabel.text isEqualToString:@"="]) {
        //判断之前输入的字符串中是否包含+号
        if ([text.text rangeOfString:@"+"].location != NSNotFound) {
            
            NSArray *arr = [text.text componentsSeparatedByString:@"+"];
            
            NSLog(@"%@ %@",[arr objectAtIndex:0],[arr objectAtIndex:1]);

            
            double a = [NSString stringWithFormat:@"%@",[arr objectAtIndex:0]].doubleValue;
            double b = [NSString stringWithFormat:@"%@",[arr objectAtIndex:1]].doubleValue;
            a = a+b;
            text.text = [NSString stringWithFormat:@"%.2f",a];
            return;
        }
        if ([text.text rangeOfString:@"-"].location != NSNotFound) {
            
            NSArray *arr = [text.text componentsSeparatedByString:@"-"];
            
            double a = [NSString stringWithFormat:@"%@",[arr objectAtIndex:0]].doubleValue;
            double b = [NSString stringWithFormat:@"%@",[arr objectAtIndex:1]].doubleValue;
            a = a-b;
            text.text = [NSString stringWithFormat:@"%.2f",a];
            return;
        }
        if ([text.text rangeOfString:@"X"].location != NSNotFound) {
            
            NSArray *arr = [text.text componentsSeparatedByString:@"X"];
            
            double a = [NSString stringWithFormat:@"%@",[arr objectAtIndex:0]].doubleValue;
            double b = [NSString stringWithFormat:@"%@",[arr objectAtIndex:1]].doubleValue;
            a = a*b;
            text.text = [NSString stringWithFormat:@"%.2f",a];
            return;
        }
        if ([text.text rangeOfString:@"/"].location != NSNotFound) {
            
            NSArray *arr = [text.text componentsSeparatedByString:@"/"];
            
            double a = [NSString stringWithFormat:@"%@",[arr objectAtIndex:0]].doubleValue;
            double b = [NSString stringWithFormat:@"%@",[arr objectAtIndex:1]].doubleValue;
            a = a/b;
            text.text = [NSString stringWithFormat:@"%.2f",a];
            return;
        }
        
    }
    
    //拼接字符串
    text.text = [NSString stringWithFormat:@"%@%@",text.text , sender.titleLabel.text];
    
}

-(int)judge :(NSString*)sender{

    if ([text.text rangeOfString:@"+"].location != NSNotFound) {
        
        if ([sender rangeOfString:@"+"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"-"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"X"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"/"].location != NSNotFound) {
            return 0;
            
        }
        
    }

    if ([text.text rangeOfString:@"-"].location != NSNotFound) {
        
        if ([sender rangeOfString:@"+"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"-"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"X"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"/"].location != NSNotFound) {
            return 0;
            
        }
        
    }
    if ([text.text rangeOfString:@"X"].location != NSNotFound) {
        
        if ([sender rangeOfString:@"+"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"-"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"X"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"/"].location != NSNotFound) {
            return 0;
            
        }
        
    }
    if ([text.text rangeOfString:@"/"].location != NSNotFound) {
        
        if ([sender rangeOfString:@"+"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"-"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"X"].location != NSNotFound) {
            return 0;
            
        }
        if ([sender rangeOfString:@"/"].location != NSNotFound) {
            return 0;
            
        }
        
    }
    return 1;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
