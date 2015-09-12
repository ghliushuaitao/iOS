//
//  QuickControl.h
//  UINavigationControllerBasicDemo
//
//  Created by mac on 14-8-25.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import <Foundation/Foundation.h>


//为UIButton添加一个快速创建按钮的方法
@interface UIButton (QuickControl)
//快速创建系统按钮的方法
+(id)systemButtonWithFrame:(CGRect)frame
                     title:(NSString *)title
                    target:(id)target
                    action:(SEL)action;
//快速创建图片按钮的方法
+(id)imageButtonWithFrame:(CGRect)frame
                    title:(NSString *)title
                    image:(NSString *)image
          background:(NSString *)background
                   target:(id)target
                   action:(SEL)action;
@end
@interface UIImageView (QuickControl)
//快速创建图片视图的方法
+(id)imageViewWithFrame:(CGRect)frame
              imageFile:(NSString *)imageFile;
@end




