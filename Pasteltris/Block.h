//
//  Block.h
//  Pasteltris
//
//  Created by Melissa Auclaire on 7/31/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Block : NSObject

@property(nonatomic, assign) int block_x_coordinate;
@property(nonatomic, assign) int block_y_coordinate;
@property(nonatomic, assign) int block_color;


- (NSInteger) drawBlock:(CGRect)rect sraw:(int)scr_w srah:(int)scr_h;
- (NSInteger) drawBlockAtPositionCoordinates:(CGRect)rect xpos:(NSInteger)xpos ypos:(NSInteger)ypos block_color:(int)color sraw:(int)scr_w srah:(int) scr_h;

//constructors
- (id) init;
- (id) initWithCoordinates:(int)x_coor y_coordinate:(int)y_coor;

//getters
- (int) getBlockXCoordinate;
- (int) getBlockYCoordinate;
- (int) getBlockColor;

//setters
- (void) setBlockXCoordinate:(int)newValue;
- (void) setBlockYCoordinate:(int)newValue;
- (void) setBlockColor:(int)newValue;

//other methods
- (NSInteger) drawBlock:(CGRect)rect sraw:(int)scr_w srah:(int)scr_h;
- (NSInteger) drawBlockAtPositionCoordinates:(CGRect)rect xpos:(NSInteger)xpos ypos:(NSInteger)ypos block_color:(int)color sraw:(int)scr_w srah:(int) scr_h;

@end
