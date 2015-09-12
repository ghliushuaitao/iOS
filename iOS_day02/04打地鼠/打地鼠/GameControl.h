//
//  GameControl.h
//  打地鼠
//
//  Created by Tony's air on 15-3-21.
//  Copyright (c) 2015年 Tony's air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
//#import <AudioToolbox/AudioToolbox.h>
@interface GameControl : UIView{
    
    UILabel  * _label;
    
    AVAudioPlayer * player;
}

@end
