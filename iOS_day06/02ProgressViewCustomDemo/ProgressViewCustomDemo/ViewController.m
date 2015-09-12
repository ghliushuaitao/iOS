//
//  ViewController.m
//  ProgressViewCustomDemo
//
//  Created by mac on 14-8-27.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

#import "CustomProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //如何定制一个进度条
    //功能: 和系统的尽可能相似
    //实现:
    //      就是一个view上加了两张图片
    //      其中最上面的图片宽度可变
    
    
    //UIProgressView *
    CustomProgressView *cpv = [[CustomProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    cpv.trackImage = [UIImage imageNamed:@"track.png"];
    cpv.progressImage = [UIImage imageNamed:@"progress.png"];
    cpv.progress = 1.0;
    [cpv setProgress:0.1 animated:YES];

    [self.view addSubview:cpv];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
