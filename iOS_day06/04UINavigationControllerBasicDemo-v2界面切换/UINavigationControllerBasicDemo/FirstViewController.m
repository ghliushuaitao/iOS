//
//  FirstViewController.m
//  UINavigationControllerBasicDemo
//
//  Created by mac on 14-8-25.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "FirstViewController.h"

#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    //3.导航条上控件的设置
    //  3.1 设置文本标题
    self.title = @"主界面";
    
    
    //导航控制器在显示一个界面的时候
    //  会从界面的navigationItem拿到数据显示到导航条上
    self.navigationItem.title = @"Main";
    //self.navigationItem.prompt = @"我是副标题";
    //3.2 设置图片标题
    //注意: UIView * 意味着添加任何控件
    //注意: 一旦设置图片标题, 文本标题就不会显示了
    UIImageView *logoView = [UIImageView imageViewWithFrame:CGRectMake(0, 0, 60, 35) imageFile:@"logo_title.png"];
    self.navigationItem.titleView = logoView;
    
    //3.3 导航栏左侧添加按钮
    //  UIBarButtonItem * 意味着不能直接传UIButton按钮
    UIBarButtonItem *titleItem = [[UIBarButtonItem alloc] initWithTitle:@"类别" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick:)];
    //创建系统样式的BarItem
    UIBarButtonItem *systemItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(leftItemClick:)];
    //创建自定义的BarItem
    //创建一个图片按钮
    UIButton *imageButton = [UIButton imageButtonWithFrame:CGRectMake(0, 0, 35, 35) title:nil image:nil background:@"main_left_nav.png" target:self action:@selector(leftBtnClick:)];
    UIBarButtonItem *customItem = [[UIBarButtonItem alloc] initWithCustomView:imageButton];
    self.navigationItem.leftBarButtonItem = customItem;
    
    //3.4 导航条右侧添加一个按钮
    UIButton *rightImageButton = [UIButton imageButtonWithFrame:CGRectMake(0, 0, 45, 35) title:nil image:nil background:@"main_right_nav.png" target:self action:@selector(rightBtnClick:)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightImageButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //3.5 如何设置这个界面的返回Item
    //细节: 本界面上设置, 下个界面上显示
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    
    //4. 导航条的设置
    //4.1 设置导航条的风格
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //4.2 设置导航条的色调 理解为"混合色"
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    //4.3 设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    //状态栏: 20点, 导航栏: 44个点
    //ios7特别注意
    //  图片大小最好是320x44, 这样正好覆盖了导航条, 或者320x64, 这样覆盖状态栏和导航条, 其他有可能平铺
    //4.4 隐藏导航条
    //注意: 以后导航条的显示和隐藏放在viewWillAppear中
    //self.navigationController.navigationBar.hidden = YES;
    
    //5. 工具栏的使用
    //显示工具栏
    self.navigationController.toolbarHidden = NO;
    //添加控件需要设置toolbarItems
    // NSArray *类型
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toolBarItemClick:)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(toolBarItemClick:)];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(toolBarItemClick:)];
    //分开按钮创建特殊的UIBarButtonItem
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    self.toolbarItems = @[item1,spaceItem,item2,spaceItem,item3];
    
    
    //添加一个切换界面的按钮
    UIButton *nextButton = [UIButton systemButtonWithFrame:CGRectMake(100, 100, 100, 30) title:@"下个界面" target:self action:@selector(nextButtonClick)];
    
    //[nextButton setBackgroundImage:<#(UIImage *)#> forState:UIControlStateSelected];
    //nextButton.selected = YES;
    
    [self.view addSubview:nextButton];

}
-(void)toolBarItemClick:(UIBarButtonItem *)item
{
    
}

-(void)rightBtnClick:(UIButton *)button
{
    
}

-(void)leftBtnClick:(UIButton *)button
{
    
}

-(void)leftItemClick:(UIBarButtonItem *)item
{
    
}

-(void)nextButtonClick
{
    SecondViewController *svc = [[SecondViewController alloc] init];
    
    //如何利用导航控制器切换
    
    //切换之前添加动画效果
    //后面知识: Core Animation 核心动画
    //不要写成: CATransaction
    //创建CATransition动画对象
    CATransition *animation = [CATransition animation];
    //设置动画的类型:
    animation.type = @"moveIn";
    //设置动画的方向
    animation.subtype = kCATransitionFromBottom;
    //设置动画的持续时间
    animation.duration = 1.5;
    //设置动画速率(可变的)
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //动画添加到切换的过程中
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
    
    //拿到导航控制器的指针
    //  这是属性表示视图控制器是那个导航控制器管理的
    [self.navigationController pushViewController:svc animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
