//
//  ViewController.m
//  NSURLConnectionUseDemo
//
//  Created by mac on 14-9-2.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
{
    //用于下载的对象
    NSURLConnection *_urlConnection;
    //存储下载数据
    NSMutableData *_downloadData;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //如何使用NSURLConnection实现数据的下载
    
    //<1>NSString 类实现网络数据下载
    //[self testStringDownload];
    
    //<2>使用NSURLConnection以同步的形式下载数据
    //[self urlConnectionSynchronizeDownload];
    
    //<3>使用NSURLConnection以异步的形式下载数据
    //  这种下载数据形式以后项目中应该用的形式
    [self urlConnectionAsynchronousDownloadData];

}

#pragma mark - 使用NSURLConnection以异步的形式下载数据
-(void)urlConnectionAsynchronousDownloadData
{
    //创建一个url下载对象
    //参数initWithRequest:  传入一个网络请求
    //参数delegate: 传入事件处理的对象
    //    为啥需要代理: 是一个异步下载?
    //    initWithRequest方法执行了立即返回, 数据由另外i线程下载, 下载完之后通知delegate指向的对象
    
    //如何理解同步或异步
    //同步: 小店吃饭, 小店老板厨师都是一个人
    //   程序: 如果程序在下载数据, UI界面无法响应
    //异步: 收银,端菜的, 厨师分开的, 各司其职
    //   程序: 异步数据下载和UI界面有两个线程再跑
    //线程:  一个程序(进程)的不同任务
    
    
    NSString *urlString = @"http://192.168.88.8/sns/my/user_list.php?page=1&number=20";
    
    //创建NSURL对象
    NSURL *url = [NSURL URLWithString:urlString];
    //创建NSURLRequest网络请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //参数initWithRequest: 需要传入下载请求
    //参数delegate: 下载过程处理事件的对象
    //参数startImmediately: 是否立即开始
    //注意: 异步下载
    //  效果: 方法执行之后立即返回, 一旦有数据下载,通知delegate指向的对象
    _downloadData = [[NSMutableData alloc] init];
    _urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}

//作用: 当接受到服务器的响应时执行, 以为开始下载数据了
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"开始下载数据");
}
//作用: 当接受到数据时执行, 下载数据较多时执行多次
//  需要把每次下载的数据合并到一起
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"下载数据......");
    [_downloadData appendData:data];
}
//作用: 当数据下载完成之后执行
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"数据下载完成");
    
    //显示下载的数据
    //NSString *str = [[NSString alloc] initWithData:_downloadData encoding:NSUTF8StringEncoding];
    //NSLog(@"str = %@",str);
    
    
    //解析下载的JSON数据
    //作用:把json格式的数据解析为OC的的数据类型(字典或数组)
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:_downloadData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"dict = %@",dict);
    
}

//作用: 当数据下载失败的时候执行
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"下载失败 error = %@",error);
}





#pragma mark - 使用NSURLConnection以同步的形式下载数据
-(void)urlConnectionSynchronizeDownload
{
    NSString *urlString = @"http://192.168.88.8/sns/my/user_list.php?page=1&number=20";
    
    //创建NSURL对象
    NSURL *url = [NSURL URLWithString:urlString];
    //创建NSURLRequest网络请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //发起同步的网络请求
    //注意:  这种用法只能用一次, 项目中绝对不能用
    //  为啥: 这种下载是同步下载
    //      initWithContentsOfURL直到数据下载完之后才
    //          会返回, 下载数据的UI界面不会响应
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if(error != nil)
    {
        NSLog(@"数据下载失败 error = %@",error);
        return;
    }
    
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"str = %@",str);
    
}

#pragma mark - 使用NSString下载数据
-(void)testStringDownload
{
    //用户列表的数据接口:
    // http://192.168.88.8/sns/my/user_list.php?page=1&number=20
    
    NSString *urlString = @"http://192.168.88.8/sns/my/user_list.php?page=1&number=20";
    
    //initWithContentsOfURL
    //    作用: 从一个网址创建字符串
    //NSError **类型:
    //  需要传入一个指针的地址, 函数内部修改指针指向一个对象
    //注意:  这种用法只能用一次, 项目中绝对不能用
    //  为啥: 这种下载是同步下载
    //      initWithContentsOfURL直到数据下载完之后才
    //          会返回, 下载数据的UI界面不会响应
    
    
    NSError *error = nil;
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *userListData = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    //如果error有值, 下载失败
    if(error != nil)
    {
        NSLog(@"下载失败 Error = %@",error);
        return;
    }
    
    NSLog(@"userlist = %@",userListData);
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
