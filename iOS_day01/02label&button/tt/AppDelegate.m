//
//  AppDelegate.m
//  tt
//
//  Created by Yosemite on 15/5/7.
//  Copyright (c) 2015年 blockz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)count:(UIButton *)sender
{
    NSString *str = [NSString stringWithFormat:@"%ld",
                     (long)sender.tag];
    UILabel *label = [[UILabel alloc]
                      initWithFrame:CGRectMake(100, 350, 100, 30)];
    label.backgroundColor = [UIColor redColor];
    label.text = str;
    [self.window addSubview:label];
}
- (void)multiplication
{
    // 创建 9 * 9 的列表的 Button
     int Y = 30;
     for (int row = 1; row < 10; ++row) {
         int X = 8;
            for (int col = 0; col < row; ++col) {
           UIButton *button = [UIButton
                                   buttonWithType:UIButtonTypeSystem];
               button.frame = CGRectMake(X, Y, 30, 20);
               button.backgroundColor = [UIColor yellowColor];
               NSString *strTitle = [NSString
                                     stringWithFormat:@"%d*%d", col+1, row];
               [button setTitle:strTitle forState:UIControlStateNormal];
              button.tag = row * (col+1);
              [button addTarget:self action:@selector(count:)
               forControlEvents:UIControlEventTouchUpInside];
              [self.window addSubview:button];
               X += 35;
                 }
            Y += 25;
    }
    
//    UILabel *nameLabel= [[UILabel alloc]initWithFrame:CGRectMake(135, 510, 50, 50)];
//    nameLabel.backgroundColor = [UIColor redColor];
//    nameLabel.layer.cornerRadius = 25;
//    nameLabel.clipsToBounds = YES;
//    [nameLabel setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Icon.png"]]];
//    
//    [self.window addSubview:nameLabel];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    self.window.backgroundColor = [UIColor cyanColor];
//    
//    
//    
//    ViewController *vc = [[ViewController alloc]init];
    
//    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    //创建国际象棋
    [self createChess];
    
    
    //创建9*9表计算
//    [self  multiplication];
    
    return YES;
}
-(void)createChess{

    
    for (int i = 0; i < 64; i++) {
        NSInteger row = i/8;
        NSInteger col = i%8;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(col*40+30, row*40+120, 40, 40)];
        
        if (row == 0 || row ==1 || row ==6 || row ==7) {
            
            //显示旗子
            //[view addSubview:[self chessItem:col yPots:row]];
        }
        //显示棋盘
       [view setBackgroundColor:[self getColor:row :col]];
        
        [self.window addSubview:view];
    }

}
//改造成button版本
/*-(UIButton*)chessItem:(NSInteger)x yPots:(NSInteger)y{
 
 
 UIButton *label = [UIButton buttonWithType:UIButtonTypeCustom];
 
 label.frame = CGRectMake(5, 5, 30, 30);
 
 
 [label setTitle:[self getTitle:x yPots:y] forState:UIControlStateNormal];
 
 if (y ==0 || y ==1) {
 [label setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
 [label setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
 
 
 }
 if (y ==6 || y ==7) {
 [label setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
 
 
 }
 
 label.backgroundColor = [UIColor clearColor];
 
 return label;
 }*/

-(UILabel*)chessItem:(NSInteger)x yPots:(NSInteger)y{

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
    
    
    label.text = [self getTitle:x yPots:y];
    
    if (y ==0 || y ==1) {
        
        label.textColor = [UIColor redColor];
        
    }
    if (y ==6 || y ==7) {

        label.textColor = [UIColor greenColor];

    }
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

-(UIColor*)getColor:(NSInteger)x :(NSInteger)y{

    UIColor *color;
    if (x%2 != y%2) {
        color = [UIColor whiteColor];
    }
    else{
        color = [UIColor blackColor];
    }
    return color;
}

-(NSString*)getTitle:(NSInteger)x yPots:(NSInteger)y{


    if (y == 0 || y == 7) {
        
        NSArray *arr = [NSArray arrayWithObjects:@"车", @"马",@"象",@"王",@"后",@"象",@"马",@"车", nil];
        
        
        
        return [arr objectAtIndex:x];
        
    }else if(y == 1 || y ==6){
        
        return @"兵";
    }
    return @"";

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
