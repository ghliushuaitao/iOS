//
//  ViewController.m
//  火
//
//  Created by Yosemite on 15-3-24.
//  Copyright (c) 2015年 blockz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView*imv;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor blackColor]];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40, 40, 40, 40) ;
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setTitle:@"灭" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(mie) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: btn];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(240, 40, 40, 40) ;
    [btn2 setBackgroundColor:[UIColor clearColor]];
    [btn2 setTitle:@"着" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview: btn2];
    
    
}
-(void)mie{
//    [self.view removeFromSuperview];
    [imv stopAnimating];
}
-(void)show{

    //加入背景图片
    
//    //初始化一个图片作为对象
//    UIImage*img = [UIImage imageNamed:@"campFire.png"];
//    //初始化一个颜色的对象，把一张图片设为一个颜色
//    UIColor *co = [UIColor colorWithPatternImage:img];
//    //把这个颜色作为一个背景 设置到当前的页面
//    [self.view setBackgroundColor:co];
//        UIImageView*imv;

    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for (int i = 1; i<=17; i++) {
        
        NSString *str = [NSString stringWithFormat:@"campFire%02d.gif",i];
        UIImage*image = [UIImage imageNamed:str];
        
        [arr addObject:image];
    }
    imv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 320, 440)];
    
    [self.view addSubview:imv];
    
    [imv  setAnimationImages:arr];
    [imv setAnimationRepeatCount:0];
    [imv setAnimationDuration:1];
    [imv startAnimating];
    NSLog(@"arr = %@",arr);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
