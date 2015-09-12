//
//  GameControl.m
//  打地鼠
//
//  Created by Tony's air on 15-3-21.
//  Copyright (c) 2015年 Tony's air. All rights reserved.
//

#import "GameControl.h"
#import <AVFoundation/AVFoundation.h>
//#import <AudioToolbox/AudioToolbox.h>

@implementation GameControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        [self createView];
        
        
        NSString * path = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"mp3" ];
        NSLog(@"%@",path);
        NSURL * url =[[NSURL alloc]initFileURLWithPath:path];
        player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        [player play];
        
    }
    return self;
}
-(void)createView{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    imageView.image = [UIImage imageNamed:@"bg.png"];
    [self addSubview:imageView];
    for (int i =0; i < 9; i ++) {
        UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"Mole01.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"Mole04.png"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake((i%3)*103+30, (i/3)*93+100, 56, 79);
        [self addSubview:button];
        button.tag = 1000+i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.hidden = YES;
        
    }
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//初始化文本标签，用于显示用户的得分
    _label =[[UILabel alloc]initWithFrame:CGRectMake(100, 40, 100, 50)];
    //设置文本标签上文本的对其格式为剧中显示
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"分数:0";
    _label.textColor =[UIColor redColor];
    [self addSubview:_label];

}
-(void)timerAction{
    for (int i = 0; i <  9; i ++) {
        
        UIButton * button = [self viewWithTag:1000+i];
        button.hidden = YES;//让地鼠随机消失！
    }
    int i = arc4random()%9+1000;
    UIButton * button = (UIButton *)[self viewWithTag:i];
    button.hidden = NO;//让地鼠随机出现
}
int s =0;// 分数
-(void)buttonAction:(UIButton *)bt{
    bt.hidden = YES;
    s++;
    NSLog(@"%d",s);
    _label.text = [NSString stringWithFormat:@"得分%d",s];
}

@end
