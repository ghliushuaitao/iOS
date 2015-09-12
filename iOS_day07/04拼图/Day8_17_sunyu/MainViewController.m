//
//  MainViewController.m
//  Day8_17_sunyu
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 350, 80, 80)];
    image.image = [UIImage imageNamed:@"0"];
    [self.view addSubview:image];
    for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
            UIImage *image1 = [UIImage imageNamed:@"0"];
            //切割图片
            UIImage *image = [self clipImage:image1 inRect:CGRectMake(120*j, 120*i, 120, 120)];            
            UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10+100*j, 40+100*i, 100, 100)];
            imageV.userInteractionEnabled = YES;
            imageV.tag = (i+1)+(j*3);
            //留一个缺口
            if (!(i==2&&j==2)) {
                imageV.layer.borderColor = [UIColor colorWithRed:j*0.1 green:1 blue:i*0.1 alpha:0.8].CGColor;
                imageV.layer.borderWidth = 1;
                imageV.image = image;
                //创建一个手势
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
                //点击次数
                tap.numberOfTapsRequired = 1;
                //需要几只手指
                tap.numberOfTouchesRequired = 1;
                //关联事件
                [tap addTarget:self action:@selector(onTap:)];
                //图片关联手势
                [imageV addGestureRecognizer:tap];
            }
            [self.view addSubview:imageV];
        }
    }
}

- (void)onTap:(UITapGestureRecognizer *)sender
{
    UIImageView *image = (UIImageView *)[self.view viewWithTag:9];
    CGPoint ptImage = image.center;
    CGPoint ptSender = sender.view.center;
    float x = ptImage.x-ptSender.x;
    float y = ptImage.y-ptSender.y;
    
    [UIView beginAnimations:nil context:nil];
    //fabs()是求绝对值的意思
    NSLog(@"x = %f y = %f",fabs(x),fabs(y));
    NSLog(@"tag = %ld",sender.view.tag);
    //只有两个方块可以移动
    if(sender.view.tag!=9&&((fabs(x)==100&&fabs(y)==0)||(fabs(x)==0&&fabs(y)==100))){
        CGRect rectImage = image.frame;
        //被点击的图片的尺寸
        CGRect rectSender = sender.view.frame;
        sender.view.frame = rectImage;
        image.frame = rectSender;
    }
    [UIView commitAnimations];
}

//从给定的大图中切出指定矩形区域的小图
- (UIImage *)clipImage: (UIImage *)bigImage inRect: (CGRect)rect
{
    CGImageRef imageRef = CGImageCreateWithImageInRect(bigImage.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    return image;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
