//
//  CustomProgressView.h
//  ProgressViewCustomDemo
//
//  Created by mac on 14-8-27.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomProgressView : UIView
{
    UIImageView *_trackImageView;
    UIImageView *_progressImageView;
}
//instancetype 理解为等同于id
//-(instancetype)init;

//设置进度
@property(nonatomic) float progress;
//设置前景图
@property(nonatomic, retain) UIImage* progressImage;
//设置背景图
@property(nonatomic, retain) UIImage* trackImage;
//带动画的设置进度
- (void)setProgress:(float)progress animated:(BOOL)animated;
@end



