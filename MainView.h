//
//  MainView.h
//  Pasteltris
//
//  Created by Melissa Auclaire on 6/11/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "Peice.h"
#import "Block.h"

@interface MainView : UIView {
    CADisplayLink* gameTimer;
    BOOL animationRunning;
    NSTimeInterval drawDuration;
    CFTimeInterval lastDrawTime;
    CGFloat drawProgress;
}

- (NSInteger) drawBlockPosition:(CGRect)rect xpos:(NSInteger)xpos ypos:(NSInteger)xpos; //Draw a block at a given x or y coordinate
- (void) drawGrid:(CGRect)rect;                                                         //Draw the lined grid
- (void) refresh:(CGRect)rect;                                                          //Refresh the screen (output buffer)
- (void) clearScreen:(CGRect)rect;                                                      //Clear the screen with UIBezierPath

- (int) getBlockPositionX;
- (int) getBlockPositionY;
- (int) getScreenRatioAdjustWidth;
- (int) getScreenRatioAdjustHeight;
- (void) setBlockPositionX: (int) newPosition;
- (void) setBlockPositionY: (int) newPosition;

- (void) checkCollisionWithFloor;
- (void) checkCollisionWithBlocks;
- (void) updateBoard: (int [24][10])array;
- (void) updateModelWithTime:(CFTimeInterval) timestamp;
- (NSInteger) drawBlockAtPositionCoordinates:(CGRect)rect xpos:(NSInteger)xpos ypos:(NSInteger)ypos sraw:(int)scr_w srah:(int)scr_h block_color:(int)block_color;
@end
