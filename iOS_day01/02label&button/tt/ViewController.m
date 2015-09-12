//
//  ViewController.m
//  tt
//
//  Created by Yosemite on 15/5/7.
//  Copyright (c) 2015年 blockz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{

    UILabel *_label;
    NSTimer *_timer;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    
    
    [self startButton];
    [self stopButton];
    [self displayNumber];
    [self createTimer];
    
}



- (void)startButton
{
        // 创建开始按钮
    UIButton *btnStart = [UIButton
                          buttonWithType:UIButtonTypeSystem];
    btnStart.frame = CGRectMake(50, 350, 80, 30);
    btnStart.backgroundColor = [UIColor yellowColor];
    [btnStart setTitle:@"开始" forState:UIControlStateNormal];
       // 设置 btnStart 的字体
    // btnStart.font 废弃了不建议使用
    btnStart.titleLabel.font = [UIFont systemFontOfSize:30];
    [btnStart addTarget:self action:@selector(onBtnStartClick:)
       forControlEvents:UIControlEventTouchUpInside];
    btnStart.tag = 101;
    // self.view 表示当前视图控制器所管理的视图
    [self.view addSubview:btnStart];
}
- (void)stopButton
{
    // 创建停止按钮
   UIButton *btnStop = [UIButton
                        buttonWithType:UIButtonTypeSystem];
   btnStop.frame = CGRectMake(200, 350, 80, 30);
   btnStop.backgroundColor = [UIColor yellowColor];
   [btnStop setTitle:@"停止" forState:UIControlStateNormal];
   btnStop.titleLabel.font = [UIFont systemFontOfSize:30];
   [btnStop addTarget:self action:@selector(onBtnStartClick:)
     forControlEvents:UIControlEventTouchUpInside];
   btnStop.tag = 102;
   [self.view addSubview:btnStop];
}


- (void)onBtnStartClick:(UIButton *)sender
{
         if (101 == sender.tag) {
                 [_timer setFireDate:[NSDate distantPast]];
             } else {
            [_timer setFireDate:[NSDate distantFuture]];
        }
}
- (void)displayNumber
{
   //创建 Label
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, 280, 150)];
    _label.backgroundColor = [UIColor grayColor];
    _label.font = [UIFont systemFontOfSize:150];
    _label.text = @"00";
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}

- (void)createTimer
{
    // 创建一个定时器
    // 参数一：定时器的时间间隔，以秒为单位
    // 参数二：某对象指针
    // 参数三：某方法选择器，当到达指定的时间间隔时，
    //会调用参数二指定的对象的参数三指定的方法
    // 参数四：不需要
    // 参数五：YES 表示重复触发，NO 表示只触发一次
    // 定时器创建完以后就开始计时了
     _timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                  target:self
                                                selector:@selector(onTimer)
                                                userInfo:nil
                                                 repeats:YES];
    // 停止定时器
     [_timer setFireDate:[NSDate distantFuture]];
}


- (void)onTimer
{
         int value = arc4random() % 30 ;
         _label.text = [NSString stringWithFormat:@"%d", value];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
