//
//  ViewController.m
//  UIView
//
//  Created by Yosemite on 15/5/7.
//  Copyright (c) 2015年 blockz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    UIView *view1;
    
    UIView *view4 ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self viewExample1];
    
    [self viewExample2];
    
    [self viewExample3];
    
    [self viewExample4];
    
    [self viewExample5];
    
    [self myButton];
}


-(void)viewExample1{
    
    
    view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    
    
    [view1 setBackgroundColor:[UIColor redColor]];
    
    
    //基本属性
    NSLog(@"view.frame = %.1f %.1f %.1f %.1f",view1.frame.origin.x,view1.frame.origin.y,view1.frame.size.width,view1.frame.size.height);
    
    
    
    // UIView 的 frame 的成员属性是只读的
    // 所以下面的代码是编译不过的
    //     view.frame.origin.x = 100;
    
    // frame 本身是可读可写的，但 frame 的成员是只读的，不能修改
    // 所以，要想改变坐标，就要通过一个中间变量，来赋值给 frame
    CGRect frame = view1.frame;
    
    // 可以用下面这种方式修改
    frame.origin.x = 100;
    view1.frame = frame;
    
    [self.view addSubview:view1];
    
    
}

- (void)viewExample2
{
    // z-order：是先放后放的顺序
    // addSubView：是后放的把先放的挡住
     UIView *view2 = [[UIView alloc]
                         initWithFrame:CGRectMake(110, 40, 100, 100)];
     view2.backgroundColor = [UIColor blueColor];
    // 用 addSubview 添加的子视图
    // 后添加的子视图的 Zorder 比先添加的子视图的 Zorder 大
    // 所以，后添加的会把先添加的挡住（如果二者重叠）
     [self.view addSubview:view2];
}
- (void)viewExample3
{
    // insertSubview：也是添加子视图
    // 添加 view3 并把 view3 放在 view1 的下边
    // 即 view3 的 Zorder 比 view1 的 Zorder 小
     UIView *view3 = [[UIView alloc]
                         initWithFrame:CGRectMake(90, 20, 100, 100)];
     view3.backgroundColor = [UIColor yellowColor];
    // 把 view1 改成类内的全局变量
     [self.view insertSubview:view3 belowSubview:view1];
    // 把 view3 移到最上边
    // 这里的最上边是相对 view3 父视图的其它子视图而言的
     [self.view bringSubviewToFront:view3];
    // 把 view3 移到最下边
    // 这里的最上边是相对 view3 父视图的其它子视图而言的
//     [self.view sendSubviewToBack:view3];
    // insertSubview 和 bringSubview 只是调整现存在的 view
}

- (void)viewExample4
{
     view4= [[UIView alloc]
                         initWithFrame:CGRectMake(20, 150, 150, 150)];
     view4.backgroundColor = [UIColor greenColor];
     view4.tag = 100;
     [self.view addSubview:view4];
    
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 60)];
    la.backgroundColor = [UIColor brownColor];
    
    [view4 addSubview:la];
    // 指定视图 view4 的子视图是否随着 view4 的大小改变而自动改变
     view4.autoresizesSubviews = YES;
}

- (void)viewExample5
{
     UIView *view5 = [[UIView alloc]
                         initWithFrame:CGRectMake(10, 10, 80 , 80)];
     view5.backgroundColor = [UIColor blackColor];
    // 把 view4 改成类内的全局变量
     [view4 addSubview:view5];
    // 指定当 view 的父视图改变大小时子视图的宽和高随着自动改变大小
     view5.autoresizingMask = UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
//    [self.view addSubview:view5];

}
- (void)myButton
{
     UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
     button.frame = CGRectMake(10, 30, 80, 30);
     [button setTitle:@"放大" forState:UIControlStateNormal];
     [button addTarget:self action:@selector(onButtonClick)
         forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:button];
}
- (void)onButtonClick
{
    // 得到 self.view 的 tag 值为 100 的子视图
     UIView *view = [self.view viewWithTag:100];
    
     CGRect frame = view.frame;
     frame.size.width  += 10;
     frame.size.height += 10;
     view.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
