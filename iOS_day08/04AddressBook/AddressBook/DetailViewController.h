//
//  DetailViewController.h
//  AddressBook
//
//  Created by LaoWen on 14-12-18.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;//类的前向声明，用于告诉编译器DetailViewController是一个类，编译器看到这行之后就知道DetailViewController是个类了，但也仅仅知道DetailViewController是个类而以，不知道任何其它详细信息。

@protocol DetailViewControllerDelegate <NSObject>

- (void)DetailViewControllerDelegateSave:(DetailViewController*)detailVC;

@end

@interface DetailViewController : UIViewController

@property (nonatomic, copy)NSString *personName;
@property (nonatomic, copy)NSString *phoneNumber;

@property (nonatomic, assign)id<DetailViewControllerDelegate>delegate;

@end
