//
//  ViewController.m
//  004-Lol英雄展示
//
//  Created by dyf on 14/11/1.
//  Copyright (c) 2014年 dyf. All rights reserved.
//

#import "ViewController.h"
#import "JKHero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView * table;
}
@property (nonatomic, strong) NSArray *heros;
@property (nonatomic, strong) NSArray *hero;

@end

@implementation ViewController

// 懒加载
- (NSArray *)heros
{
    if (!_heros) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            JKHero *hero = [JKHero heroWithDict:dict];
            [arrayM addObject: hero];
        }
        
        _heros = [arrayM copy];
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    table  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"heroCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    JKHero *hero = self.heros[indexPath.row];
    
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    //换行
    cell.detailTextLabel.lineBreakMode = 0;
    cell.detailTextLabel.numberOfLines = 0;
    
    
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
