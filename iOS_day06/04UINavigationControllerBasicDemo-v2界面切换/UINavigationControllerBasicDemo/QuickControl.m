//
//  QuickControl.m
//  UINavigationControllerBasicDemo
//
//  Created by mac on 14-8-25.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "QuickControl.h"

@implementation UIButton (QuickControl)

+(id)systemButtonWithFrame:(CGRect)frame
                     title:(NSString *)title
                    target:(id)target
                    action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//快速创建图片按钮的方法
+(id)imageButtonWithFrame:(CGRect)frame
                    title:(NSString *)title
                    image:(NSString *)image
               background:(NSString *)background
                   target:(id)target
                   action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:[UIImage imageNamed:background] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    return button;
}

@end

//类别的实现
@implementation UIImageView (QuickControl)

+(id)imageViewWithFrame:(CGRect)frame
              imageFile:(NSString *)imageFile
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageFile];
    return imageView;
}

@end



