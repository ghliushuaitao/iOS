//
//  AppDelegate.m
//  随机数 练习
//
//  Created by qianfeng on 15/3/6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UILabel*label;
}
@end

@implementation AppDelegate
- (void)dealloc
{
    [self.window release];
    [super dealloc];
}
- (void)creatBtn
{
    label=[[UILabel alloc]initWithFrame:CGRectMake(60, 30, 250, 250)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=[NSString stringWithFormat:@"%d",0];
    label.font=[UIFont fontWithName:@"Marker Felt"size:120];
    label.textColor=[UIColor purpleColor];
    label.backgroundColor=[UIColor grayColor];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(140, 330, 100, 100);
    btn.backgroundColor=[UIColor purpleColor];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
     btn.tag=1;
    [self.window addSubview:btn];
    [self.window addSubview:label];
}
- (void)pressBtn:(id)sender
{
    UIButton*tempbtn=(UIButton*)sender;
    //static int num=1;
    if(tempbtn.tag==1)
    {
       // tempbtn.tag=1;
        tempbtn.frame=CGRectMake(140, 330, 100, 100);
      [tempbtn setTitle:@"开始" forState:UIControlStateNormal];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(chengeNumber)userInfo:nil repeats:YES];
        tempbtn.tag=2;
       //num=2;
    }
    else
    {
       // tempbtn.tag=2;
        tempbtn.frame=CGRectMake(140, 330, 100, 100);
        //tempbtn.backgroundColor=[UIColor yellowColor];
        [tempbtn setTitle:@"停止" forState:UIControlStateNormal];
        [tempbtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        label.text=[NSString stringWithFormat:@"%d",50];
        tempbtn.tag=1;
       // num=1;
        
    }
}
- (void)chengeNumber
{
    label.text=[NSString stringWithFormat:@"%.2d",arc4random()%100];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor=[UIColor blackColor];
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
