//
//  AppDelegate.m
//  今天所有方法
//
//  Created by qianfeng on 15/3/8.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
/*
 1--下面四种样式 是系统提供的按钮的按钮样式 不需要设置标题和图片
 UIButtonTypeDetailDisclosure,
 UIButtonTypeInfoLight,
 UIButtonTypeInfoDark,
 UIButtonTypeContactAdd,
 2--设置按钮高亮状态的的背景图片－－这种情况图片失真--但是如果按钮添加文字 文字会悬浮在图片之上
   [btn setBackgroundImage:[UIImage imageNamed:@"012.png"]forState:UIControlStateHighlighted];
 3--为按钮添加图片－－不会失真setImage
   [btn2 setImage:[UIImage imageNamed:@"012.png"] forState:UIControlStateHighlighted];
 4-－把图片的尺寸作为按钮的宽和高 就不会失真  结合setBackgroundImage；这样不会失真，文字也能在图片之上
    UIImage * image1 = [UIImage imageNamed:@"014.png"];
    CGSize size_image = image1.size;
    btn3.frame = CGRectMake(150, 300, size_image.width, size_image.height);
 5-－CGPoint point = label.frame.origin;
     CGSize size = label.frame.size;--可以获取所有控件的坐标和尺寸
 6-－label.font = [UIFont systemFontOfSize:36];获取系统字体的尺寸,UIButton同样也可以使用这种方法btn.font=[UIFont sya....]
 7-－UILabel * label = (UILabel *)[self.window viewWithTag:100];  viewWithtag 由当前父视图调用--父视图可不仅仅是self.window注意理解
 8-－currentColor1 = [tempBtn currentTitleColor];currentTitleColor-－－获取按钮标题的颜色  用UIColor接受
     NSString * title = [tempBtn currentTitle];currentTitle－－－获取按钮的标题－－用NSString接受
 9--btn.layer.cornerRadius=30.3;设置按钮的圆角模式
    btn.clipsToBounds=YES;

 
 */
 
 
 
 
 
 
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc
{
    [self.window release];
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    label.backgroundColor=[UIColor purpleColor];
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(50, 150, 100, 100)];
    view.backgroundColor=[UIColor grayColor];
    [view addSubview:label];
    label.tag=199;
    UILabel*l=[view viewWithTag:199];
    [self.window addSubview:view];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame=CGRectMake(50, 60, 60, 60);
    //[btn setTitle:@"**" forState:UIControlStateNormal];
    btn.backgroundColor=[UIColor brownColor];
   // btn.font=[UIFont systemFontOfSize:50];
    [view addSubview:btn];
    
    [label release];
    [view release];
    [self.window makeKeyAndVisible];
    [self.window release];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
