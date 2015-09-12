//
//  ViewController.m
//  UIGestureRecongnizerUseDemo
//
//  Created by mac on 14-8-28.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //演示手势的使用
    //实例: 实现图片查看器
    //  缩放: 捏合手势
    //  旋转: 旋转手势
    //  滑动: 滑动手势
    //  保存图片: 长按手势
    //  拖移: 拖移手势
    //  轻击: 轻击手势
    
    // 11000x5600
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 440, 224)];
    imageView.center = CGPointMake(160, 240);
    imageView.image = [UIImage imageNamed:@"1001.jpg"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    //<1>使用轻击手势
    //[self testTapGestureRecongnizer];
    
    //<2>使用两指捏合手势
    //[self testPinchGestureRecongnizer];
    
    //<3>使用旋转手势
    //[self testRotationGestureRecongnizer];
    
    //<4>滑动手势
    //[self testSwipeGestureRecongnizer];
    
    //<5>拖移手势
    //[self testPanGestureRecongnizer];
    
    //<6>长按手势
    [self testLongPressGestureRecongnizer];
    
}
#pragma mark - 长按手势
-(void)testLongPressGestureRecongnizer
{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(dealLongPress:)];
    [imageView addGestureRecognizer:longPress];
    
}
-(void)dealLongPress:(UILongPressGestureRecognizer *)longPress
{
    //细节: 长按手势默认会执行两次事件处理方法
    if(longPress.state == UIGestureRecognizerStateEnded)
    {
    
        UIAlertView *alertView = [[UIAlertView alloc] init];
        alertView.message = @"你是想保存图片么?";
        [alertView addButtonWithTitle:@"取消"];
        [alertView show];
    }
}

#pragma mark - 拖移手势
-(void)testPanGestureRecongnizer
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dealPan:)];
    [imageView addGestureRecognizer:pan];
}
-(void)dealPan:(UIPanGestureRecognizer *)pan
{
    //获取拖移的位置
    //屏幕上位置
    CGPoint screenPoint = [pan locationInView:self.view];
    CGPoint selfPoint = [pan locationInView:pan.view];
    
    imageView.center = screenPoint;
}




#pragma mark - 滑动手势
-(void)testSwipeGestureRecongnizer
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dealSwipe:)];
    //细节: 默认支持向右拖动
    //设置拖动防线
    swipe.direction = UISwipeGestureRecognizerDirectionDown | UISwipeGestureRecognizerDirectionUp;
    [imageView addGestureRecognizer:swipe];
}
-(void)dealSwipe:(UISwipeGestureRecognizer *)swipe
{
    NSLog(@"dealSwipe");
    
    NSLog(@"%d",swipe.direction);
}


#pragma mark - 旋转手势
-(void)testRotationGestureRecongnizer
{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(dealRotation:)];
    [imageView addGestureRecognizer:rotation];
}
-(void)dealRotation:(UIRotationGestureRecognizer *)rotation
{
    //ratation 表示旋转的角度
    NSLog(@"%f", rotation.rotation);
    imageView.transform = CGAffineTransformMakeRotation(rotation.rotation);
}





#pragma mark - 两指捏合手势
-(void)testPinchGestureRecongnizer
{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(dealPinch:)];
    [imageView addGestureRecognizer:pinch];
}
-(void)dealPinch:(UIPinchGestureRecognizer *)pinch
{
    //获取缩放比例 pinch.scale
    //  设置一个用于缩放的仿射变换的对象
    //  实现了缩放的效果
    imageView.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale);
}


#pragma mark - 轻击手势
-(void)testTapGestureRecongnizer
{
    //创建轻击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap:)];
    [imageView addGestureRecognizer:tap];
}
-(void)dealTap:(UITapGestureRecognizer *)tap
{
    CGPoint point = [tap locationInView:self.view];
    //📍
    UILabel *label = [[UILabel alloc] init];
    label.text = @"📍";
    //窗口自适应文本
    [label sizeToFit];
    label.center = point;
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
