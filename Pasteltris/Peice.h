//
//  Peice.h
//  Pasteltris
//
//  Created by Melissa Auclaire on 7/26/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block.h"

@class Block;

enum peiceOrientation {
    RANDOM_ORIENTATION = 0,
    RIGHT_ORIENTATION = 1,
    LEFT_ORIENTATION = 2,
    UP_ORIENTATION = 3,
    DOWN_ORIENTATION = 4,
};

enum peiceType {
    T_PEICE = 1,
    LINE_PEICE = 2,
    BOX_PEICE = 3,
    LEFT_LPEICE = 4,
    RIGHT_LPEICE = 5,
    LEFT_TETROID = 6,
    RIGHT_TETROID = 7,
};

@interface Peice : NSObject {
    Block *staticBlock1;
    Block *staticBlock2;
    Block *staticBlock3;
    Block *staticBlock4;
}

@property(nonatomic, assign) bool movable;
@property(nonatomic, assign) int scr_w;
@property(nonatomic, assign) int scr_h;
@property(nonatomic, assign) int x_position;
@property(nonatomic, assign) int y_position;

@property(nonatomic, assign) int peice_type;
@property(nonatomic, assign) int peice_orientation;
@property(nonatomic, assign) int peice_block_number;
@property(nonatomic, assign) int peice_height;
@property(nonatomic, assign) int peice_width;
@property(nonatomic, assign) int peice_xoffset;
@property(nonatomic, assign) int peice_yoffset;

@property(nonatomic, assign) int highest_block_position;
@property(nonatomic, assign) int lowest_block_position;
@property(nonatomic, assign) int leftmost_block_position;
@property(nonatomic, assign) int rightmost_block_position;


- (id) init;
- (id) initWithScreenAdjust:(CGRect)rect screen_ratio_adjust_width:(int)scr_w screen_ratio_adjust_height:(int)scr_h xpos:(int)xpos ypos:(int)ypos;

//getter declarations
//- (bool) getMovable;
- (int) getPeiceXPosition;
- (int) getPeiceYPosition;
- (int) getPeiceType;
- (int) getPeiceOrientation;
- (int) getPeiceBlockNumber;

//- (int) getHighestBlockPosition;
//- (int) getLowestBlockPosition;
//- (int) getLeftmostBlockPosition;
//- (int) getRightmostBlockPosition;

//setter declarations
//- (void) setMovable:(bool)newValue;
- (void) setPeiceXPosition:(int)newValue;
- (void) setPeiceYPosition:(int)newValue;
- (void) setPeiceType:(int)newValue;
- (void) setPeiceOrientation:(int)newValue;
- (void) setPeiceBlockNumber:(int)newValue;
//- (void) setHighestBlockPosition:(int)newValue;
//- (void) setLowestBlockPosition:(int)newValue;
//- (void) setLeftmostBlockPosition:(int)newValue;
//- (void) setRightmostBlockPosition:(int)newValue;

//move methods
- (void) movePeiceLeft;
- (void) movePeiceRight;
- (void) movePeiceUp;
- (void) movePeiceDown;

//other methods
- (int) setPeiceWidthOnInit: (int)p_type peice_orientation:(int)p_orientation;
- (int) setPeiceHeightOnInit: (int)p_type peice_orientation:(int)p_orientation;
- (int) setPeiceOrientationOnInit: (int) p_type;
- (void) buildPeice:(int)param_peice_type peice_orientation:(int)param_peice_orientation;
- (void) drawPeice:(CGRect)rect;
- (void) printPeiceData;


@end
