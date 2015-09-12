//
//  JKHero.h
//  004-Lol英雄展示
//
//  Created by dyf on 14/11/1.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKHero : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)heroWithDict:(NSDictionary *)dict;

@end
