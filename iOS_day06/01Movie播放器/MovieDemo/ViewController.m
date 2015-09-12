//
//  ViewController.m
//  MovieDemo
//
//  Created by mac on 12-8-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@implementation ViewController

-(IBAction)playerAction:(id)sender
{
    NSString  * path=[[NSBundle mainBundle]pathForResource:@"test1" ofType:@"mp4"];
    NSURL * url=[NSURL fileURLWithPath:path];
    pvc =[[MPMoviePlayerViewController alloc]initWithContentURL:url];
    [self presentModalViewController:pvc animated:YES]; 
    
    //注册事件
    //[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moviewPlayVackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
}

-(void)moviewPlayVackDidFinish:(NSNotification*)notification
{
    [pvc dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
