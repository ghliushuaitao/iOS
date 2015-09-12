//
//  AppDelegate.m
//  四个button一个Label
//
//  Created by qianfeng on 15/3/6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    UILabel*lab;
}
@end

@implementation AppDelegate
- (void)dealloc
{
    [self.window release];
    [super dealloc];
}

- (void)creatBtn{
    NSArray*arr=@[@"012.png",@"013.png",@"014.png",@"015.png"];
    lab=[[UILabel alloc]initWithFrame:CGRectMake(0,30, 375,30)];
    lab.backgroundColor=[UIColor purpleColor];
    lab.text=@"我就是我";
    lab.textAlignment=NSTextAlignmentCenter;
    for(int i=0;i<2;i++)
    {
        for(int j=0;j<2;j++)
        {
            UIButton*btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame=CGRectMake(j*100+100, i*100+100, 40, 40);
            btn.tag=(i*2+j);
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",arr[i*2+j]]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",arr[3-i*2-j]]] forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.window addSubview:btn];
        }
    }
    [self.window addSubview:lab];
  
}
- (void)pressBtn:(id)sender
{
    UIButton *tempbtn=(UIButton*)sender;
        if(tempbtn.tag==1)
        {
          lab.text=@"北京";
        }
        if(tempbtn.tag==2)
        {
        lab.text=@"东京";
        }
        if(tempbtn.tag==3)
        {
          lab.text=@"南京";
        }
        if(tempbtn.tag==0)
        {
          lab.text=@"西京";
        }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor = [UIColor greenColor];
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
