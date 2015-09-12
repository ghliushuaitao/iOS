//
//  QFAppDelegate.m
//  打地鼠
//
//  Created by Tony's air on 15-3-21.
//  Copyright (c) 2015年 Tony's air. All rights reserved.
//

#import "QFAppDelegate.h"
#import "GameControl.h"

@implementation QFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    _bgImageView.image = [UIImage imageNamed:@"Default.png"];
    
//    将图片的用户交互打开
    _bgImageView.userInteractionEnabled = YES;
//    self.window.subviews
    
    [self.window addSubview:_bgImageView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"开始游戏" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 300, 320, 60);
    [_bgImageView addSubview:button];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
    
}
-(void)buttonAction{
//    [_bgImageView  removeFromSuperview];
    
    _bgImageView.hidden = YES;
    GameControl * gameControl = [[GameControl alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.window addSubview:gameControl];
    
    
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
