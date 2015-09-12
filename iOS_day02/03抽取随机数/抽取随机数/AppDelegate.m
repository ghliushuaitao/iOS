//
//  AppDelegate.m
//  抽取随机数
//
//  Created by qianfeng on 15/3/7.
//  Copyright (c) 2015年 heng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSTimer *timer;//计时器对象指针
}


@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor lightGrayColor];
    
    [self createLabel];
    [self createButton];
    
    
    
    [self.window makeKeyAndVisible];
    [self.window release];
    return YES;
}
-(void)createLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(90, 80, 200, 200)];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"0";
    label.textAlignment = NSTextAlignmentCenter;
    label.tag = 100;
    label.font = [UIFont systemFontOfSize:70];
    [self.window addSubview:label];
    [label release];
}

-(void)createButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(110, 450, 150, 80);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 70;//设置按钮圆角 35圆角半径  值越大圆角半径越大
    button.clipsToBounds = YES;//是否设置圆角
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
}
-(void)buttonClick:(id)sender
{
    //1>获取按钮及标签视图对象
    UILabel *label = (UILabel *)[self.window viewWithTag:100];
    UIButton * tempButton=(UIButton *)sender;
    static BOOL isStart = YES;//标识按钮的状态
    if (isStart) {
        [tempButton setTitle:@"停止" forState:UIControlStateNormal];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(arcNumber) userInfo:nil repeats:YES];
        isStart = NO;
    } else {
        [tempButton setTitle:@"开始" forState:UIControlStateNormal];
        //想内定就在此添加label的text
        label.text = @"20";
        //关闭计时器
        [timer invalidate];
        isStart = YES;
    }
}
//抽取随机数

-(void)arcNumber
{
    UILabel *label = (UILabel *)[self.window viewWithTag:100];
    label.text = [NSString stringWithFormat:@"%i",arc4random()%100 + 1];
}

-(void)dealloc{
    [self.window release];
    [super dealloc];
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
