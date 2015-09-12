//
//  ViewController.h
//  MovieDemo
//
//  Created by mac on 12-8-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController
{
    MPMoviePlayerViewController *pvc;
}
-(IBAction)playerAction:(id)sender;
@end
