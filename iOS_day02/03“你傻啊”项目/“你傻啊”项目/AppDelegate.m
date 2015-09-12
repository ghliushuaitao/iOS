//
//  AppDelegate.m
//  “你傻啊”项目
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
- (void)creatLabel{
    
    UILabel*label=[[UILabel alloc]init];
    label.frame=CGRectMake(100, 100, 40, 40);
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor purpleColor];
    label.backgroundColor=[UIColor brownColor];
    label.text=@"0";
    label.tag=100;
    [self.window addSubview:label];
    [label release];
}
- (void)creatButton{
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(200, 230, 100, 100);
    [btn setImage:[UIImage imageNamed:@"012.png"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"013.png"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(pressbtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:btn];
}
- (void)pressbtn:(id)sender
{
    //viewWithTag:方法由当前的父视图的对象指针调用
    UILabel*label=(UILabel*)[self.window viewWithTag:100];
    static int number=0;
    number++;
    if(number<10)
    {
        label.text=[NSString stringWithFormat:@"%d",number];
    }
    else if(number==10)
    {
        CGPoint point=label.frame.origin;
        CGSize size=label.frame.size;
        label.frame=CGRectMake(point.x-50, point.y-50, size.width+100, size.height+100);
        label.text=@"你傻啊";
        label.font=[UIFont systemFontOfSize:36];
    }
//    UIButton*tempbtn=(UIButton*)sender;
//    static int count1=1;
//    count1++;
//    if(count1>0&&count1<=10)
//    {
//        [tempbtn setImage:[UIImage imageNamed:@"012.png"] forState:UIControlStateNormal];
//        [tempbtn setImage:[UIImage imageNamed:@"013.png"] forState:UIControlStateHighlighted];
//    }
//    else
//    {
//    
//    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self creatButton];
    [self creatLabel];
    [self.window makeKeyAndVisible];
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
