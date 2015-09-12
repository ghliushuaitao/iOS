//
//  AppDelegate.m
//  UIViewDemo
//
//  Created by mac on 14-8-19.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    //UIView视图类的使用
    
    //1.创建显示和基本属性
    
    //啥是UIView, 直观感受就是一个矩形区域
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor redColor];
    [self.window addSubview:view];
    
    
    
    
    //设置透明度
    //0.0 ~ 1.0
    view.alpha = .2;
    
    //改变视图的中心位置
    view.center = CGPointMake(200, 200);
    
    //改变视图的大小,不改变位置,0和0无影响
    view.bounds = CGRectMake(0, 0, 50, 50);
    
    //tag是任何控件都有的属性
    view.tag = 100;
    
    //有些控件,例如图片视图,默认情况只支持用户交互
    //  把按钮加上图片上, 必须把属性打开
    view.userInteractionEnabled = YES;
    
    
    //五彩屏幕
    //[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(createView:) userInfo:nil repeats:YES];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createView:(NSTimer *)timer
{
    //arc4random函数, 产生一个随机数
    //产生100之内的随机数  arc4random()%100
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(arc4random()%320, arc4random()%480, arc4random()%100, arc4random()%100);
    //计算机中任何颜色都是由 红,绿,蓝构成的
    view.backgroundColor = [UIColor colorWithRed:(arc4random()%100)/100.0 green:(arc4random()%100)/100.0 blue:(arc4random()%100)/100.0 alpha:1];
    [self.window addSubview:view];
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
