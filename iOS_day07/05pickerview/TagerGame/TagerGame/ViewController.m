//
//  ViewController.m
//  TagerGame
//
//  Created by stdio on 15/5/25.
//  Copyright (c) 2015年 stdio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createview];
}

-(void)createview{
    imageArray = [[NSMutableArray alloc] init];
    //载入图片
    for (int i = 0; i < 11; i++) {
        NSString* name = [NSString stringWithFormat:@"image%d.png",i];

        UIImage* image = [[UIImage alloc]init];
        image = [UIImage imageNamed:name];
        [imageArray addObject:image];
    }
    //开始button
    UIButton* startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(50, 50, 80, 30);
    [startButton setTitle:@"start" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    //停止button
    UIButton* stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton.frame = CGRectMake(200, 50, 80, 30);
    [stopButton setTitle:@"stop" forState:UIControlStateNormal];
    [stopButton addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 244, 400, 0)];
    myPickerView.delegate = self;
    myPickerView.dataSource = self;
    [self.view addSubview:myPickerView];

}

//几列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 2;
}
//几行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return [imageArray count];
}
//高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 75;
}
//宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 150;
}
-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    UIImage *img = [imageArray objectAtIndex:row];
    UIImageView*imgview = [[UIImageView alloc]initWithImage:img];
    return imgview;
}

- (void)start{

    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(myAction) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:0.19 target:self selector:@selector(myAction2) userInfo:nil repeats:NO];
}
//方法
- (void)myAction{
    //    //自动选择
        [myPickerView selectRow:0 inComponent:0 animated:NO];
    //    //得到某列的当前行
    [myPickerView selectedRowInComponent:0];
    NSInteger row = [myPickerView selectedRowInComponent:0];
    [myPickerView selectRow:[imageArray count]-1 inComponent:0 animated:YES];
}

- (void)myAction2{
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(myAction3) userInfo:nil repeats:YES];
}

- (void)myAction3{
    NSInteger row = [myPickerView selectedRowInComponent:1];
    if (row == 0) {
        [myPickerView selectRow:[imageArray count]-1 inComponent:1 animated:YES];
    } else {
        [myPickerView selectRow:0 inComponent:1 animated:YES];
    }
}


- (void)stop{
    int num = arc4random()%11;
    [timer1 invalidate];
    [myPickerView selectRow:num inComponent:0 animated:YES];
    [myPickerView selectRow:num inComponent:0 animated:YES];
    [myPickerView selectRow:num inComponent:0 animated:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(stop2) userInfo:nil repeats:NO];
}

- (void)stop2{
    int num = arc4random()%11;
    [timer2 invalidate];
    [myPickerView selectRow:num inComponent:1 animated:YES];
    [myPickerView selectRow:num inComponent:1 animated:YES];
    [myPickerView selectRow:num inComponent:1 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
