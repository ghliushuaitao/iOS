//
//  ViewController.h
//  TagerGame
//
//  Created by stdio on 15/5/25.
//  Copyright (c) 2015年 stdio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSMutableArray* imageArray;
    UIPickerView* myPickerView;
    NSTimer* timer1;
    NSTimer* timer2;


}


@end

