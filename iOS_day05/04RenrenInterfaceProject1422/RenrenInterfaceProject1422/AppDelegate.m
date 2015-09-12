//
//  AppDelegate.m
//  RenrenInterfaceProject1422
//
//  Created by mac on 14-8-19.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    UIView *mainView;
    UIView *photoCategoryView;
    UIView *photoWallView;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //实现具有三个界面的应用
    //  3个界面
    //  主界面 mainView
    //  图片分类 photoCategoryView
    //  图片墙     photoWallView
    
    //知识点: view有层次的
    //  后面加入的view显示在最上面
    
    
    //先创建第一个界面
    [self createMainView];
    
    [self createPhotoCategoryView];
    
    //把一个视图放到前面
    [self.window bringSubviewToFront:mainView];
    
    //把红色的view放到最后面
    //[self.window sendSubviewToBack:mainView];
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createPhotoCategoryView
{
    photoCategoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    photoCategoryView.backgroundColor = [UIColor greenColor];
    [self.window addSubview:photoCategoryView];
}

-(void)createMainView
{
    //(1)创建主界面
    mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    //为了测试
    mainView.backgroundColor = [UIColor redColor];
    [self.window addSubview:mainView];
    
    //(2)添加导航栏
    UIImageView *navView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
    navView.image = [UIImage imageNamed:@"header_bg.png"];
    navView.userInteractionEnabled = YES;
    [mainView addSubview:navView];
    
    //(3)导航栏上添加两个按钮和logo
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(5, 5, 35, 35);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"main_left_nav.png"] forState:UIControlStateNormal];
    [navView addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(270, 5, 45, 35);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"main_right_nav.png"] forState:UIControlStateNormal];
    [navView addSubview:rightButton];
    
    UIImageView *logoView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 35)];
    logoView.image = [UIImage imageNamed:@"logo_title.png"];
    logoView.center = CGPointMake(160, 22);
    [navView addSubview:logoView];
    
    
    //(4)添加一个工具栏
    UIImageView *toolBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20+44, 320, 35)];
    toolBar.image = [UIImage imageNamed:@"rr_pub_bg_1st.png"];
    toolBar.userInteractionEnabled = YES;
    [mainView addSubview:toolBar];
    
    //在工具栏上添加三个按钮
    NSArray *titleArray = @[@"照片",@"状态",@"报道"];
    NSArray *imageArray =@[
        @"rr_pub_takephoto.png",
        @"rr_pub_status.png",
        @"rr_pub_checkin.png"];
    //背景: rr_pub_button_silver.png
    for (int i=0; i<3; i++) {
        double w = 100;
        double h = 30;
        double x = 5 + i*(w+5);
        double y = 2;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, w, h);
        //10表示宽度上离左边和右边多少点不拉伸
        UIImage *image = [[UIImage imageNamed:@"rr_pub_button_silver.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [toolBar addSubview:button];
    }
    
    //(5)添加一张背景图片
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20+44+35, 320, 480-20-44-35)];
    backView.image = [UIImage imageNamed:@"rr_main_background.png"];
    backView.userInteractionEnabled = YES;
    [mainView addSubview:backView];
    
    
    //(6)背景上添加9个按钮
    NSArray *nineTitleArray = @[
        @"个人主页",@"新鲜事",@"好友",
        @"应用",@"位置",@"相册",
        @"搜索",@"聊天",@"站内信"];
    NSArray *nineImageArray = @[
        @"gerenzhuye.png",
        @"xinxianshi.png",
        @"haoyou.png",
        
        @"yingyong.png",
        @"weizhifuwu.png",
        @"xiangce.png",
        
        @"zhaoren.png",
        @"chat",
        @"zhanneixin.png"];
    
    //用一层for循环
    double x=50;
    double y=30;
    double w = 55;
    double h = 56;
    for (int i=0; i<9; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, y, w, h);
        [button setBackgroundImage:[UIImage imageNamed:nineImageArray[i]] forState:UIControlStateNormal];
        [backView addSubview:button];
        
        
        //添加事件处理
        button.tag = 200+i;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //在按钮下方0添加文本
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x-5, y+45, w+10, h)];
        label.text = nineTitleArray[i];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        [backView addSubview:label];
        
        
 
        (i%3 != 2)?(x+=85):(x=50,y+=85);
    }
    
    //(7)在最下面添加一个图片
    UIImageView *notifyView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 480-44, 320, 44)];
    notifyView.image = [UIImage imageNamed:@"rr_homepage_bg_notify.png"];
    [mainView addSubview:notifyView];
    
    
    //图标: Icon.png
    //Bundle display name: 显示名字
}

-(void)btnClick:(UIButton *)button
{
    //如果点击了相册按钮
    if(button.tag == 205)
    {
        //切换到相册列表界面
        [self.window bringSubviewToFront:photoCategoryView];
    }
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
