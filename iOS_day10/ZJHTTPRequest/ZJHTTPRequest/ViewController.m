//
//  ViewController.m
//  ZJHTTPRequest
//
//  Created by mac on 14-9-2.
//  Copyright (c) 2014年 zhang jian. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    //这个对象指针定义在这儿, 不要定义在下面
    //  为啥: 定义在方法内部, 方法完了之后就释放了...
    ZJHTTPRequest *_httpRequest;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //封装 NSURLConnection的异步下载功能
    
    _httpRequest = [[ZJHTTPRequest alloc] initWithURLString:@"http://192.168.88.8/sns/my/user_list.php?page=1&number=20" target:self action:@selector(downloadFinish:)];
    
}
//添加下载完的事件处理方法
-(void)downloadFinish:(ZJHTTPRequest *)httpRequest
{
    //解析输出
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:httpRequest.downloadData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"dict = %@",dict);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
