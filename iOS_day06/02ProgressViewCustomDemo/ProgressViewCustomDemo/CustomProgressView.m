//
//  CustomProgressView.m
//  ProgressViewCustomDemo
//
//  Created by mac on 14-8-27.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "CustomProgressView.h"

@implementation CustomProgressView

//重写这个方法
//为啥: 保存图片同时显示到_trackImageView
-(void)setTrackImage:(UIImage *)trackImage
{
    _trackImage = trackImage;
    _trackImageView.image = trackImage;
}
-(void)setProgressImage:(UIImage *)progressImage
{
    _progressImage = progressImage;
    _progressImageView.image = progressImage;
}
-(void)setProgress:(float)progress
{
    if(progress<0 || progress >1.0)
    {
        return;
    }
    
    _progress = progress;
    
    //设置前景图的宽度
    _progressImageView.frame = CGRectMake(0, 0, self.frame.size.width * progress, self.frame.size.height);
}

-(void)setProgress:(float)progress animated:(BOOL)animated
{
    if(animated)
    {
        [UIView beginAnimations:@"" context:nil];
        [UIView setAnimationDuration:1.0];
        self.progress = progress;
        [UIView commitAnimations];
    }
    else
    {
        self.progress = progress;
    }
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _trackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_trackImageView];
        
        _progressImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_progressImageView];
        //以后可以把图片放在两个UIImageView对象
        //为了测试
        //self.backgroundColor = [UIColor grayColor];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
