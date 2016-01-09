//
//  MLAViewController.h
//  Pasteltris
//
//  Created by Melissa Auclaire on 6/11/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>


int xoffset;
int yoffset;


@interface MLAViewController : UIViewController <AVAudioPlayerDelegate> {
    CADisplayLink* gameTimer;
    AVAudioPlayer *audioPlayer;
}

- (void) updateDisplay : (CADisplayLink*) sender;
- (void) endGameWithMessage : (NSString *) message;
- (void)backgroundTap:(id)sender;

@end
