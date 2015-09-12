//
//  AppDelegate.m
//  按钮的触发事件
//
//  Created by qianfeng on 15/3/6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (void)dealloc{
    [self.window release];
    [super dealloc];
}
- (void)creatBtn{
    UIButton*btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"010.png"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"011.png"] forState:UIControlStateHighlighted];
     btn1.frame=CGRectMake(20, 30, 100, 100);
    //点击按钮触发某个事件  中间借助addTarget方法进行关联
    [btn1 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    /*
     1.第一个参数 添加的值对象指针 action后面的方法在哪个类中实现 此处就添加那个类的对象指针（一般的时候此处添加都是self）
     2.第二个参数 按钮的触发事件 方法的名称
     3.第三个参数 触发这个方法的手势／事件（以点击触发还是其他形式触发）
     */
    UIButton*btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setImage:[UIImage imageNamed:@"012.png"] forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"013.png"] forState:UIControlStateHighlighted];
     btn2.frame=CGRectMake(20, 90, 100, 100);
    [btn2 addTarget:self action:@selector(pressBtn:)forControlEvents:UIControlEventTouchUpInside];
    //tag 所有控件都具有的方法  设置控件的唯一标示 所有控件的tag值系统默认为0 所以控件的tag值可以设置除了0以外的所有正整数
    btn1.tag = 1;
    btn2.tag = 2;//一定要确保控件的tag的值时唯一的  不能喝其他控件的tag值重复
    [self.window addSubview:btn2];
    [self.window addSubview:btn1];
    
}
- (void)pressBtn:(id)sender
{
    UIButton*tempbtn=(UIButton*)sender;
    if(tempbtn.tag==1)
    {
        self.window.backgroundColor=[UIColor purpleColor];
    }
    else
    {
        static int count=10;
        count++;
        self.window.backgroundColor=[UIColor colorWithRed:count*10%255/255.0 green:count*20%255/255.0 blue:count*27%255/255.0 alpha:1];
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self creatBtn];
    
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
