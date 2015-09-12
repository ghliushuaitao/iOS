
//
//  JKHero.m
//  004-Lol英雄展示
//
//  Created by dyf on 14/11/1.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "JKHero.h"

@implementation JKHero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
