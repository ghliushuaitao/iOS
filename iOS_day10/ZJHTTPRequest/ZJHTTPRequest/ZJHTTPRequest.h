//
//  ZJHTTPRequest.h
//  ZJHTTPRequest
//
//  Created by mac on 14-9-2.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import <Foundation/Foundation.h>

//功能:
//传入下载数据的地址,传入下载完的事件处理方法
//效果: 当下载完成之后执行事件处理方法

@interface ZJHTTPRequest : NSObject<NSURLConnectionDataDelegate>
{
    //为了实现下载功能
    NSURLConnection *_urlConnection;
    id _target;
    SEL _action;
}
//为了存储下载的数据
@property (retain,nonatomic)NSMutableData *downloadData;
//参数: 传入下载地址, 传入事件处理方法
-(id)initWithURLString:(NSString *)urlString
                target:(id)target
                action:(SEL)action;
@end




