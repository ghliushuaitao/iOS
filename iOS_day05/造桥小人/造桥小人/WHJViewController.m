//
//  WHJViewController.m
//  造桥小人
//
//  Created by 王金红 on 15/8/14.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "WHJViewController.h"

@interface WHJViewController ()

@property(nonatomic,strong)NSTimer *timer;

@property(nonatomic,strong)UILabel *lable;//关卡记录lable

@property(nonatomic,assign)NSInteger count;//关卡计数

@property(nonatomic,strong)UIImageView *person;//人

@property(nonatomic,strong)UIView *bridge;//桥

@property(nonatomic,strong)UIView *land1;//陆地1号

@property(nonatomic,strong)UIView *land2;//陆地2号

@property(nonatomic,strong)NSArray *runImages;//跑动动画数组

@property(nonatomic,strong)NSArray *stayImages;//待机动画数组


@end

@implementation WHJViewController

//加载跑动图片数组
-(NSArray *)runImages
{
    if(_runImages==nil)
    {
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        UIImage *runImage = [UIImage imageNamed:@"run.png"];
        
        CGFloat imageWidth = runImage.size.width/8;
        
        CGFloat imageHeight = runImage.size.height;
        
        for(int i=0;i<8;i++)
        {
            CGImageRef newImage = CGImageCreateWithImageInRect([runImage CGImage], CGRectMake(i*imageWidth, 0, imageWidth, imageHeight));
            
            [mutableArray addObject:[UIImage imageWithCGImage:newImage]];
        }
        _runImages = mutableArray;
    }
    return _runImages;
}

-(NSArray *)stayImages
{
    if(_stayImages==nil)
    {
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        UIImage *stayImage = [UIImage imageNamed:@"stay.png"];
        
        CGFloat imageWidth = stayImage.size.width/2;
        
        CGFloat imageHeight = stayImage.size.height;
        
        for(int i=0;i<2;i++)
        {
            CGImageRef newImage = CGImageCreateWithImageInRect([stayImage CGImage], CGRectMake(i*imageWidth, 0, imageWidth, imageHeight));
            
            [mutableArray addObject:[UIImage imageWithCGImage:newImage]];
        }
        _stayImages = mutableArray;
    }
    return _stayImages;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createLandsAndPerson];
}

-(void)createLandsAndPerson
{
    //创建关卡记录lable
    self.lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    self.lable.center = CGPointMake(self.view.center.x, 100);
    
    self.lable.textAlignment = NSTextAlignmentCenter;
    
    self.lable.text = @"第1关";
    
    [self.view addSubview:self.lable];
    
    //初始化关卡计数
    self.count = 1;
    
    //创建小人
    self.person = [[UIImageView alloc]init];
    
    self.person.frame = CGRectMake(30, 360, 20, 40);
    
    [self.view addSubview:self.person];
    
    //开始待机动画
    self.person.animationImages = self.stayImages;
    
    [self.person startAnimating];
    
    //创建两块陆地
    self.land1 = [[UIView alloc]init];
    
    self.land1.backgroundColor = [UIColor blackColor];
    
    self.land1.frame = CGRectMake(10, 400, 45, 30);
    
    [self.view addSubview:self.land1];
    
    self.land2 = [[UIView alloc]init];
    
    self.land2.backgroundColor = [UIColor blackColor];
    
    self.land2.frame = CGRectMake(200, 400, 50, 30);
    
    
    [self.view addSubview:self.land2];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //创建桥，并开始让桥变长
    [self startBuild];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //停止让桥变长，并把桥放倒
    [self stopBuildAndPushDown];
}

#pragma mark - 创建桥，并开始让桥变长
-(void)startBuild
{
    self.bridge = [[UIView alloc]init];
    
    self.bridge.backgroundColor = [UIColor blackColor];
    
    self.bridge.frame = CGRectMake(self.land1.frame.origin.x+self.land1.frame.size.width-5, 400, 5, 0);
    
    [self.view addSubview:self.bridge];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(build) userInfo:nil repeats:YES];
}

#pragma mark - 停止让桥变长，并把桥放倒，取消点击响应
-(void)stopBuildAndPushDown
{
    //暂时取消点击响应,否则人物跑动中点击屏幕会出现bug
    self.view.userInteractionEnabled = NO;
    
    [self.timer invalidate];
    
    CGRect frame = self.bridge.frame;
    
    frame.origin.x += frame.size.height*0.5;
    
    frame.origin.y += frame.size.height*0.5+2.5;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.bridge.frame = frame;
        
        self.bridge.transform = CGAffineTransformMakeRotation(M_PI/2);
    }];
    //桥倒下后让人物移动
    [self performSelector:@selector(personMove) withObject:nil afterDelay:0.5];
}

#pragma mark - 让桥变长
-(void)build
{
    CGRect frame = self.bridge.frame;
    
    frame.origin.y -= 2;
    
    frame.size.height += 2;
    
    self.bridge.frame = frame;
}

#pragma mark - 判断桥长度并人物移动
#warning 旋转90度后bridge的width与heigh会互换
-(void)personMove
{
    //计算两陆地间的距离
    CGFloat farToTarget = self.land2.frame.origin.x-self.land1.frame.origin.x-self.land1.frame.size.width;
    
    //计算动画时间
    CGFloat animationTime = self.bridge.frame.size.width*0.01;
    
    //用于存放人的新的frame
    CGRect frame = self.person.frame;
    
    //如果桥长大于距离且并不超出目的地，人走到目的地边上
    if((self.bridge.frame.size.width >= farToTarget) && (self.bridge.frame.size.width <= (farToTarget+self.land2.frame.size.width)))
    {
        //旋转90度后bridge的width与heigh会互换
        frame.origin.x = self.land2.frame.origin.x+self.land2.frame.size.width-self.person.frame.size.width-5;
        
        [UIView animateWithDuration:animationTime animations:^{
            
            self.person.frame = frame;
        }];
        
        //走完,场景后移
        [self performSelector:@selector(subviewsMoveBack) withObject:nil afterDelay:animationTime];
    }
    
    //如果桥长不足或超出，人走出桥
    else
    {
        frame.origin.x = self.bridge.frame.origin.x+self.bridge.frame.size.width;
        
        [UIView animateWithDuration:animationTime animations:^{
            
            self.person.frame = frame;
        }];
        
        //人掉下去
        [self performSelector:@selector(personDead) withObject:nil afterDelay:animationTime];
    }
    //开始跑动动画
    self.person.animationImages = self.runImages;
    
    [self.person startAnimating];
}

#pragma mark - 场景后移并交换land1与land2指针，重置land2位置，关卡计数加一
-(void)subviewsMoveBack
{
    //关卡计数加1
    self.lable.text = [NSString stringWithFormat:@"第%lu关",++self.count];
    //切换至待机动画
    self.person.animationImages = self.stayImages;
    
    [self.person startAnimating];
    
    //场景后移的长度等于land2的x值
    CGFloat moveLone = self.land2.frame.origin.x;
    
    //执行场景后移
    for(UIView *tmp in self.view.subviews)
    {
        CGRect frame = tmp.frame;
        
        if(tmp!=self.lable)
        {
            frame.origin.x -= moveLone;
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            
            tmp.frame = frame;
        }];
    }
    
    //land1与land2互换（land2永远为目的陆地）
    UIView *view = self.land2;
    
    self.land2 = self.land1;
    
    self.land1 = view;
    
    //把land2移到最右边屏幕外
    CGRect frame = self.land2.frame;
    
    frame.origin.x = self.view.bounds.size.width;
    
    self.land2.frame = frame;
    
    //移除birdge,不然不美观
    [self.bridge removeFromSuperview];
    
    //随机产生一个距离land1长度0～200的位置
    CGFloat farToland1 = arc4random()%200;
    
    frame.origin.x = self.land1.frame.origin.x+self.land1.frame.size.width+farToland1;
    
    //随机产生一个land2的宽度
    CGFloat widthOfLand2 = arc4random()%50;
    
    frame.size.width = 10+widthOfLand2;
    
    //按farToland1把land2拉进来
    [UIView animateWithDuration:0.5 animations:^{
       
        self.land2.frame = frame;
    }];
    
    //重新开始响应点击
    [self performSelector:@selector(canClick) withObject:nil afterDelay:0.5];
}

#pragma mark - 重新开始响应点击
-(void)canClick
{
    self.view.userInteractionEnabled = YES;
}

#pragma mark - 人掉下去
-(void)personDead
{
    CGRect frame = self.person.frame;
    
    frame.origin.y = self.view.bounds.size.height;
    
    [UIView animateWithDuration:0.5 animations:^{
       
        self.person.frame = frame;
    }];
}

@end
