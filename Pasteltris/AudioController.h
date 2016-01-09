//
//  AudioController.h
//  ATBasicSounds
//
//  Created by Melissa Lynn Auclaire on 01/08/2016.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioController : NSObject

- (instancetype)init;
- (void)tryPlayMusic;
- (void)playSystemSound;

@end
