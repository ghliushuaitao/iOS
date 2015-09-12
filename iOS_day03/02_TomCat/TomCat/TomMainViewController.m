//
//  TomMainViewController.m
//  TomCat
//
//  Created by qianfeng on 14-12-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "TomMainViewController.h"

@interface TomMainViewController ()

@end

@implementation TomMainViewController
{
    UIImageView *_tom;
//    NSMutableDictionary *_images;
}

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
    NSString *str = [[NSBundle mainBundle]pathForResource:@"angry_00" ofType:@"jpg"];
    
    UIImage *imageName = [UIImage imageWithContentsOfFile:str];
    _tom = [[UIImageView alloc]initWithImage:imageName];
    _tom.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_tom];
    
    NSArray *data =   @[@{@"name":@"cymbal"},
                      @{@"name":@"drink"},
                      @{@"name":@"eat"},
                      @{@"name":@"fart"},
                      @{@"name":@"pie"},
                      @{@"name":@"scratch"},
                      @{@"name": @"angry",@"x":@"215",@"Y":@"370",@"width":@"30",@"hight":@"60"},
                      @{@"name": @"footRight",@"x":@"110",@"Y":@"425",@"width":@"40",@"hight":@"40"},
                      @{@"name": @"footLeft",@"x":@"165",@"Y":@"425",@"width":@"40",@"hight":@"40"},
                      @{@"name": @"knockout",@"x":@"100",@"Y":@"90",@"width":@"120",@"hight":@"120"},
                      @{@"name": @"stomach",@"x":@"120",@"Y":@"300",@"width":@"80",@"hight":@"100"}];
    
    for (int i=0; i<11; i++) {
        NSDictionary *dict = [data objectAtIndex:i];
        NSString *name = dict[@"name"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        if (i<6) {
            if (i<3) {
                button.frame = CGRectMake(5, 290+i*60, 60, 60);
            }else if(i>=3){
                button.frame = CGRectMake(255, 290+(i-3)*60, 60, 60);
            }
            UIImage *image = [UIImage imageNamed:name];
            [button setBackgroundImage:image forState:UIControlStateNormal];
        }else{
            NSString *X = dict[@"x"];
            NSString *Y = dict[@"Y"];
            NSString *width = dict[@"width"];
            NSString *hight = dict[@"hight"];
            button.frame = CGRectMake([X intValue], [Y intValue], [width intValue], [hight intValue]);
        }
        [button setTitle:name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)onButtonClick:(UIButton *)sender
{
    NSMutableArray *images = [[NSMutableArray alloc]init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tom" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *title = [sender titleForState:UIControlStateNormal];
    int count = [dict[title] intValue];
    for (int i=0; i<count; i++) {
        NSString *str = [NSString stringWithFormat:@"%@_%02d.jpg",title,i];
//        NSString *imageName = [[NSBundle mainBundle]pathForResource:str ofType:@"jpg"];
//        UIImage *image = [UIImage imageWithContentsOfFile:imageName];
        UIImage *image = [UIImage imageNamed:str];
        [images addObject:image];
    }
//    NSArray *images = [_images objectForKey:title];
    _tom.animationImages = images;
    _tom.animationDuration = count/9;
    _tom.animationRepeatCount = 1;
    [_tom startAnimating];
    [images release];
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    _images = [[NSMutableDictionary alloc]init];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"tom" ofType:@"plist"];
//    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
//    NSArray *array = @[@"cymbal",@"drink",@"eat",@"fart",@"pie",@"scratch",@"angry",@"footRight",@"footLeft" ,@"knockout",@"stomach"];
//    for (int j=0; j<11; j++) {
//        int count = [dict[array[j]] intValue];
//        NSMutableArray *array1 = [[NSMutableArray alloc]init];
//        for (int i=0; i<count; i++) {
//            NSString *str = [NSString stringWithFormat:@"%@_%02d.jpg",array[j],i];
//            UIImage *image = [UIImage imageNamed:str];
//            [array1 addObject:image];
//        }
//        [_images setObject:array1 forKey:array[j]];
//    }
//}

- (void)dealloc
{
//    [_images release];
    [_tom release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
