//
//  DirectDraw.m
//  Pasteltris
//
//  Created by Melissa Auclaire on 8/14/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//

#import "DirectDraw.h"

#define SCREEN_RATIO_ADJUST_WIDTH 2.0
#define SCREEN_RATIO_ADJUST_HEIGHT 2.0


@implementation DirectDraw


//Functions to draw peice with a random initial orientation at the specified offsets
- (void) drawTPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    NSInteger orientation = arc4random_uniform(4) + 1;
    [self drawTPeice:rect orientation:orientation offsetx:offsetx offsety:offsety];
}

- (void) drawLinePeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    NSInteger orientation = arc4random_uniform(2) + 1;
    [self drawLinePeice:rect orientation:orientation offsetx:offsetx offsety:offsety];
}

- (void) drawLeftLPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    NSInteger orientation = arc4random_uniform(4) + 1;
    [self drawLeftLPeice:rect orientation:orientation offsetx:offsetx offsety:offsety];
}

- (void) drawRightLPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    NSInteger orientation = arc4random_uniform(4) + 1;
    [self drawRightLPeice:rect orientation:orientation offsetx:offsetx offsety:offsety];
}

- (void) drawLeftTetroid :(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    NSInteger orientation = arc4random_uniform(2) + 1;
    [self drawLeftTetroid:rect orientation:orientation offsetx:offsetx offsety:offsety];
}

- (void) drawRightTetroid:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    NSInteger orientation = arc4random_uniform(2) + 1;
    [self drawRightTetroid:rect orientation:orientation offsetx:offsetx offsety:offsety];
}


//method to draw peices
- (void) drawTPeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    
    switch(orientation) {
        case 1:
            //Left-Right Orientation
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:2+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            break;
            
        case 2:
            //Rightside Up Orientation
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:1+offsety block_color:0];
            break;
            
        case 3:
            //Right-Left Orientation
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:2+offsety block_color:0];
            break;
            
        case 4:
            //Upside Down Orientation
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            break;
    }
}

- (void) drawLinePeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    
    switch(orientation) {
        case 1:
            //Horizontal Orientation
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:3+offsetx ypos:0+offsety block_color:0];
            break;
            
        case 2:
            //Vertical
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:2+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:3+offsety block_color:0];
            break;
    }
}

- (void) drawBoxPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    
    [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
    [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
    [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
    [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
    
}

- (void) drawLeftLPeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    switch(orientation) {
        case 1:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:1+offsety block_color:0];
            break;
            
        case 2:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:2+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:2+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            break;
            
        case 3:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:1+offsety block_color:0];
            break;
            
        case 4:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:2+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            break;
    }
}

- (void) drawRightLPeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    switch(orientation) {
        case 1:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:0+offsety block_color:0];
            break;
            
        case 2:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:2+offsety block_color:0];
            break;
            
        case 3:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            break;
            
        case 4:
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:2+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:2+offsety block_color:0];
            break;
    }
}

- (void) drawLeftTetroid :(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    switch(orientation) {
        case 1:
            //Vertical
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:2+offsety block_color:0];
            break;
            
        case 2:
            //Horizontal
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:0+offsety block_color:0];
            break;
    }
}

- (void) drawRightTetroid:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety {
    switch(orientation) {
        case 1:
            //Vertical
            [self drawBlockPosition:rect xpos:0+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:0+offsetx ypos:2+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            break;
            
        case 2:
            //Horizontal
            [self drawBlockPosition:rect xpos:0+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:0+offsety block_color:0];
            [self drawBlockPosition:rect xpos:1+offsetx ypos:1+offsety block_color:0];
            [self drawBlockPosition:rect xpos:2+offsetx ypos:1+offsety block_color:0];
            break;
    }
}



/*
 * Returns the color of the block drawn in the palette key
 */
- (NSInteger) drawBlockPosition:(CGRect)rect xpos:(NSInteger) xpos ypos:(NSInteger)ypos block_color:(NSInteger)color {
    
    CGRect  screenRect = [[UIScreen mainScreen] bounds];
    float   blockWidth = (screenRect.size.width/10.0f)/SCREEN_RATIO_ADJUST_WIDTH;
    float   blockHeight = (screenRect.size.height/24.0f)/SCREEN_RATIO_ADJUST_HEIGHT;
    
    //NSLog(@"Block width of drawBlockPosition %f",blockWidth);
    //NSLog(@"Block height of drawBlockPosition %f",blockHeight);
    
    //Pastel Colors Table
    UIColor* pastel_red     = [UIColor colorWithRed:246.0f/255.0f green:150.0f/255.0f blue:121.0f/255.0f alpha:1.0f];
    UIColor* pastel_yellow  = [UIColor colorWithRed:255.0f/255.0f green:247.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
    UIColor* pastel_green   = [UIColor colorWithRed:130.0f/255.0f green:202.0f/255.0f blue:156.0f/255.0f alpha:1.0f];
    UIColor* pastel_cyan    = [UIColor colorWithRed:109.0f/255.0f green:207.0f/255.0f blue:246.0f/255.0f alpha:1.0f];
    UIColor* pastel_blue    = [UIColor colorWithRed:131.0f/255.0f green:147.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
    UIColor* pastel_violet  = [UIColor colorWithRed:161.0f/255.0f green:134.0f/255.0f blue:190.0f/255.0f alpha:1.0f];
    UIColor* pastel_magenta = [UIColor colorWithRed:244.0f/255.0f green:154.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    
    
    
    CGRect aRectangle = CGRectMake((xpos*blockWidth), (ypos*blockHeight*SCREEN_RATIO_ADJUST_HEIGHT), blockWidth, blockHeight*SCREEN_RATIO_ADJUST_HEIGHT); // Make a path with the square
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:aRectangle];                              // Stroke the square
    [path stroke];
    
    if (color == 0)
        color = arc4random_uniform(7)+ 1;
    switch (color) {
            
        case 1:
            [pastel_red setFill];
            color = 1;
            break;
        case 2:
            [pastel_yellow setFill];
            color = 2;
            break;
        case 3:
            [pastel_green setFill];
            color = 3;
            break;
        case 4:
            [pastel_cyan setFill];
            color = 4;
            break;
        case 5:
            [pastel_blue setFill];
            color = 5;
            break;
        case 6:
            [pastel_violet setFill];
            color = 6;
            break;
        case 7:
            [pastel_magenta setFill];
            color = 7;
            break;
    }
    [path fill];
    return color;
}
@end
