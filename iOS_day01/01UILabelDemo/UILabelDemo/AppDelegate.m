//
//  AppDelegate.m
//  UILabelDemo
//
//  Created by mac on 14-8-18.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //以后代码都暂时写在这儿
    
    //UILabel标签类的使用
    
    //1. 基本使用---创建显示
    
    //创建一个标签对象
    UILabel *label = [[UILabel alloc] init];
    
    //
    
    //设置标签显示的文本
    label.text = @"师姐你好,师姐你好嘛,师姐你好嘛,师姐你好嘛,师姐你好嘛,师姐你好嘛,师姐你好嘛,师姐你好嘛,";
    
    //小重点: 如何设置标签显示的位置
    
    //屏幕的大小:
    //iphone4/4s:   3.5寸屏
    //  640X960屏幕的分辨率Pixel
    //  320X480点Point
    
    //iphone5       4寸屏
    //  640X1136分辨率
    //  320X568个点
    
    //位置设置到坐标上(100,100)位置
    //   CGRect表示一个矩形
    //    用矩形坐上角的点和宽度长度确定矩形
    /*
     struct CGRect {
     CGPoint origin;
     CGSize size;
     };
     typedef struct CGRect CGRect;
     */
    label.frame = CGRectMake(100, 100, 200, 300);
    
    
    //显示一个控件: 添加到window上
    [self.window addSubview:label];

    
    
    
    //各种属性进行设置
    //  1.设置文本颜色 UIColor *
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor yellowColor];
    
    // 2.设置字体
    //label.font = [UIFont systemFontOfSize:24];
    label.font = [UIFont boldSystemFontOfSize:24];
    label.font = [UIFont fontWithName:@"Menlo" size:24];
    //查看所有字体
    NSLog(@"fonts = %@",[UIFont familyNames]);
    
    //3.设置文本的阴影
    label.shadowColor = [UIColor blueColor];
    //阴影位置
    label.shadowOffset = CGSizeMake(2, 2);
    
    //4.设置对齐方式(靠左,居中,靠右)
    label.textAlignment = NSTextAlignmentCenter;
    
    //5.如何显示多行文本
    //细节: 默认显示一行
    //  0表示不限制
    label.numberOfLines = 0;
    
    
    //6.如何让窗口自动适应文本
    
    UILabel *newLabel = [[UILabel alloc] init];
    newLabel.text = @"不以物喜,不以己悲";
    newLabel.frame = CGRectMake(100, 40, 0, 0);
    //文本有多大,窗口有多大
    [newLabel sizeToFit];
    newLabel.backgroundColor = [UIColor greenColor];
    [self.window addSubview:newLabel];
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
