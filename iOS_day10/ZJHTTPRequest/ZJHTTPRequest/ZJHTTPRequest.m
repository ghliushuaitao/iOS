//
//  ZJHTTPRequest.m
//  ZJHTTPRequest
//
//  Created by mac on 14-9-2.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ZJHTTPRequest.h"

//消除performSelector的警告
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

@implementation ZJHTTPRequest
//参数: 传入下载地址, 传入事件处理方法
-(id)initWithURLString:(NSString *)urlString
                target:(id)target
                action:(SEL)action;
{
    if(self = [super init])
    {
        _target = target;
        _action = action;
        
        _downloadData = [[NSMutableData alloc] init];
        //创建下载对象, 开始下载
        _urlConnection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]] delegate:self startImmediately:YES];
    }
    return self;
}
//接收下载的数据
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_downloadData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //执行回调方法, 通知界面数据下载完成了
    //respondsToSelector: 判断对象是否能够响应参数对应的消息
    //理解:  判断_target有没有实现_action对应的方法
    if([_target respondsToSelector:_action])
    {
        //执行传入的方法
        [_target performSelector:_action withObject:self];
    }
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //下载失败则清空数据
    _downloadData.length = 0;
}
@end
