//
//  AppDelegate.m
//  UIViewDemo-v2
//
//  Created by mac on 14-8-20.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //2. UIView的相互嵌套
    //能干什么: 组合出系统没有的控件
    
    //实例: 图片列表界面需要按钮
    //  左边一个图片, 右边两个label
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 20, 320, 100);
    button.backgroundColor = [UIColor grayColor];
    [self.window addSubview:button];
    UIImage *image = [[UIImage imageNamed:@"table_cell_bg.png"] stretchableImageWithLeftCapWidth:8 topCapHeight:0];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    //按钮的左边加上图片 defaultHead.png
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    headView.image = [UIImage imageNamed:@"defaultHead.png"];
    [button addSubview:headView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 200, 30)];
    nameLabel.text = @"美女";
    [button addSubview:nameLabel];
    
    
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 65, 200, 30)];
    detailLabel.text = @"12-11 6:09 (12张)";
    detailLabel.font = [UIFont systemFontOfSize:14];
    [button addSubview:detailLabel];
    
    //总结
    //(1). 几乎所有控件都是UIView的子类或间接子类, UIView有个方法是addSubview, 意味"理论上"任何控件都可以相互组合
    //(2) 组合 现在注意坐标是相对坐标
    //    按钮直接加上图片上, 需要开启图片的用户交互
    
    
    //3. UIView层次感
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.window addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(150, 250, 100, 100)];
    view2.backgroundColor = [UIColor greenColor];
    [self.window addSubview:view2];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
    view3.backgroundColor = [UIColor blueColor];
    [self.window addSubview:view3];
    
    //后面加入的view在最上层
    //(1)某个view放在上面
    [self.window bringSubviewToFront:view1];
    //(2)某个view放在下面
    [self.window sendSubviewToBack:view1];
    //(3)知道一个视图的父视图
    UIView *sview = view1.superview;
    NSLog(@"w=%f h=%f",sview.frame.size.width,
          sview.frame.size.height);
    //(4)一个视图中有多少子视图
    NSArray *array = self.window.subviews;
    NSLog(@"array = %@",array);
    
    //(5)让一个视图消失
    //view1.hidden = YES;
    //view1.alpha = 0;
    //彻底从父视图消息
    //[view1 removeFromSuperview];
    
    //(6)插入视图
    //添加的黄色的视图
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(50, 150, 100, 100)];
    view4.backgroundColor = [UIColor yellowColor];
    [self.window insertSubview:view4 belowSubview:view1];
    
    //(7)交换两个视图的层次
    [self.window exchangeSubviewAtIndex:3 withSubviewAtIndex:4];
    
    
    
    
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
