//
//  AppDelegate.m
//  能走的国籍象棋
//
//  Created by qianfeng on 15/3/6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSString*currentTitle;//点击按钮上的标题
    UIColor*currentColor;//点击按钮标题的颜色
    
}
@end

@implementation AppDelegate

- (void)dealloc
{
    [self.window release];
    [super dealloc];
}
- (void)creatButton
{
     NSArray*arr=@[@"车",@"马",@"象",@"王",@"后",@"象",@"马",@"车"];
    for(int i=0;i<8;i++)
    {
        for(int j=0;j<8;j++)
        {
            UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(40*j, 40*i+20, 40, 40);
           if((i+j)%2==0)
            {
                button.backgroundColor=[UIColor whiteColor];
            }
            else
            {
                button.backgroundColor=[UIColor blackColor];
            }
            if(i==0||i==7)
            {
                [button setTitle:[NSString stringWithFormat:@"%@",arr[j]] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            }
            if(i==1)
            {
                [button setTitle:@"兵" forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            if(i==6)
            {
                [button setTitle:@"兵" forState:UIControlStateNormal];
                [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
            }
            [button addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.window addSubview:button];
            
        }
    }
    
}
- (void)pressBtn:(id)sender
{
    //棋子有两种状态 一个是拿上  一个放下
     static BOOL isGo=YES;//默认初始化状态下所有棋子都是拿上
    UIButton*tempbutton=(UIButton*)sender;
    //获取按钮上的标题 === currentTitle
    NSString*title=[tempbutton currentTitle];
    if(isGo==YES)
    {
      if(title!=nil)//判断点击的按钮上面的标题是否为空
      {
         //两个条件都满足的时候 证明这个棋子可以走
          currentTitle=title;
          currentColor=[tempbutton currentTitleColor];
          [tempbutton setTitle:nil forState:UIControlStateNormal];
          isGo=NO;//此时棋盘上所有位置都能处于落棋状态
      }
    }
    else
    {
        if(tempbutton.currentTitleColor!=currentColor)
        {
        [tempbutton setTitle:currentTitle forState:UIControlStateNormal];
        [tempbutton setTitleColor:currentColor forState:UIControlStateNormal];
        isGo=YES;//整个棋盘上按钮都处于起棋状态
        }
    }
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.backgroundColor=[UIColor greenColor];
    [self creatButton];
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
