//
//  ViewController.m
//  UIScrollViewBasicUseDemo
//
//  Created by mac on 14-8-28.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIImageView *imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //UIScrollView的基本使用
    //实例: 如何使用滚动实现显示大图片
    
    UIImage *image = [UIImage imageNamed:@"1001.jpg"];
    //  11000x5600
    NSLog(@"%f %f",image.size.width,image.size.height);
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 11000, 5600)];
    imageView.image = image;
    //[self.view addSubview:imageView];
    
    //创建UIScrollView滚动视图
    //注意: 滚动视图其实应该有两个大小, 本身大小, 内容大小
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 570)];
    //再去设置内容的大小
    scrollView.contentSize = CGSizeMake(11000, 5600);
    
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
    
    
    //常用的设置
    //是否显示水平方向滚动提示条
    scrollView.showsHorizontalScrollIndicator = NO;
    //是否显示竖直方向滚动提示条
    scrollView.showsVerticalScrollIndicator = NO;
    //去掉反弹效果
    //scrollView.bounces = NO;
    
    
    //处理滚动视图的事件, 利用代理处理
    //  UIScrollViewDelegate
    scrollView.delegate = self;
    
    //整个拖拽的过程
    //  1.开始拖拽
    //  2.滚动......
    //  3.结束拖拽
    //  4.开始减速
    //  5.滚动......
    //  6.减速结束(滚动完成了)
    
    //实现缩放效果:
    //做两件事情
    //  1.设置最大最小缩放比例
    scrollView.maximumZoomScale = 10;
    scrollView.minimumZoomScale = 0.1;
    // 2.告诉系统要缩放哪个视图
    
    //按住option键和鼠标左键进行缩放
}

//作用: 返回需要缩放的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}












//作用: 当开始拖拽的时候执行这个方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"WillBeginDragging");
}
//作用: 当结束拖拽的时候执行这个方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"DidEndDragging");
}

//作用: 当即将减速的时候执行这个方法
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"WillBeginDecelerating");
}
//作用: 当即将结束减速的时候执行这个方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"DidEndDecelerating");
}



//说明滚动视图的基本原理
//作用: 当滚动的时候执行这个方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //非常的重要属性: scrollView.contentOffset
    //  内容的偏移量(理解为内容的位置)
    //  实际表示: 以内容左上角为原点, 滚动视图左上角的位置
    // scrollView.contentOffset
    NSLog(@"x = %f, y = %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
