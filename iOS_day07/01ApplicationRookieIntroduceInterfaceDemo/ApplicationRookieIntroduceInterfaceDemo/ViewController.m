//
//  ViewController.m
//  ApplicationRookieIntroduceInterfaceDemo
//
//  Created by mac on 14-8-28.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //使用滚动视图显示新手引导界面
    //  分析: 4张图片,背景图都是一样
    
    //创建滚动视图
    scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    //宽度是窗口的4倍,高度和窗口一样
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, self.view.frame.size.height);
    
    //设置scrollView的分页滚动
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i=1; i<=4; i++) {
        
        //每次添加背景图和前景图
        double w = self.view.frame.size.width;
        double h = self.view.frame.size.height;
        double x = (i-1) * w;
        double y = 0;
        
        //先创建背景图
        UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        backView.image = [UIImage imageNamed:@"guide_bg.png"];
        [scrollView addSubview:backView];
        
        //添加前景图
        UIImageView *frontView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        frontView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideView_%d.png",i]];
        [scrollView addSubview:frontView];
    }
    
    [self.view addSubview:scrollView];
    
    //开启音乐之旅添加一个按钮
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startButton.frame = CGRectMake(self.view.frame.size.width * 3 + 100, 360, 200, 50);
    [startButton addTarget:self action:@selector(dealStart) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:startButton];
    scrollView.delegate = self;
    
    
    
    //滚动视图添加UIPageControl 页面控制控件
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 450, 100, 30)];
    //页数
    pageControl.numberOfPages = 4;
    [self.view addSubview:pageControl];
    [pageControl addTarget:self action:@selector(dealPageControl:) forControlEvents:UIControlEventValueChanged];

}
-(void)dealPageControl:(UIPageControl *)pc
{
    //根据第几页换算出scrollView中x的坐标
    double x = 320 * pc.currentPage;
    //[scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    scrollView.contentOffset = CGPointMake(x, 0);
}


-(void)scrollViewDidScroll:(UIScrollView *)pScrollView
{
    float index = scrollView.contentOffset.x / 320.0;
    pageControl.currentPage = index;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
