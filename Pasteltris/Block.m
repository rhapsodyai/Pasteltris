//
//  Block.m
//  Pasteltris
//
//  Created by Melissa Auclaire on 7/31/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//

#import "Block.h"

@implementation Block


- (id) init {
    self = [super init];
    if(self) {
        
        //set the initial peice type
        self.block_color = arc4random_uniform(7) + 1;
    }
    return self;
}



- (id) initWithCoordinates:(int)x_coor y_coordinate:(int)y_coor {
    
    self = [super init];
    if(self) {
        
        //dummy code to check if this object already exists (in this case it will just be drawn over [figure out this stuff later]) 
        //Account *ac = [accountDictionary objectForKey:identifier];
        //if (ac) { // object with that ID already exists
        //[self release];
        //return [ac retain];
        self.block_x_coordinate = x_coor;
        self.block_y_coordinate = y_coor;
        self.block_color = arc4random_uniform(7) + 1;
    }
    return self;
}


- (NSInteger) drawBlock:(CGRect)rect sraw:(int)scr_w srah:(int)scr_h {
    //initial screen variable definitions
    CGRect  screenRect = [[UIScreen mainScreen] bounds];
    float   blockWidth = (screenRect.size.width/10.0f)/scr_w;
    float   blockHeight = (screenRect.size.height/24.0f)/scr_h;
    
    
    //Pastel Colors Table (push out the pallete somewhere else)
    UIColor* pastel_red     = [UIColor colorWithRed:246.0f/255.0f green:150.0f/255.0f blue:121.0f/255.0f alpha:1.0f];
    UIColor* pastel_yellow  = [UIColor colorWithRed:255.0f/255.0f green:247.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
    UIColor* pastel_green   = [UIColor colorWithRed:130.0f/255.0f green:202.0f/255.0f blue:156.0f/255.0f alpha:1.0f];
    UIColor* pastel_cyan    = [UIColor colorWithRed:109.0f/255.0f green:207.0f/255.0f blue:246.0f/255.0f alpha:1.0f];
    UIColor* pastel_blue    = [UIColor colorWithRed:131.0f/255.0f green:147.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
    UIColor* pastel_violet  = [UIColor colorWithRed:161.0f/255.0f green:134.0f/255.0f blue:190.0f/255.0f alpha:1.0f];
    UIColor* pastel_magenta = [UIColor colorWithRed:244.0f/255.0f green:154.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    
    // Make a path with the square and stroke the square
    CGRect aRectangle = CGRectMake((self.block_x_coordinate*blockWidth), (self.block_y_coordinate*blockHeight*scr_h), blockWidth, blockHeight*scr_h);
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:aRectangle];
    [path stroke];
    
    //random color case
    if(self.block_color == 0)
        self.block_color = arc4random_uniform(7) + 1;
    
    //color deliberately selected case
    switch (self.block_color) {
        case 1:
            [pastel_red setFill];
            break;
        case 2:
            [pastel_yellow setFill];
            break;
        case 3:
            [pastel_green setFill];
            break;
        case 4:
            [pastel_cyan setFill];
            break;
        case 5:
            [pastel_blue setFill];
            break;
        case 6:
            [pastel_violet setFill];
            break;
        case 7:
            [pastel_magenta setFill];
            break;
    }

    [path fill];
    return self.block_color;
}


/*
 * Returns the color of the block drawn in the palette key
 */
- (NSInteger) drawBlockAtPositionCoordinates:(CGRect)rect xpos:(NSInteger)xpos ypos:(NSInteger)ypos sraw:(int)scr_w srah:(int)scr_h {
    
    

    
    //initial screen variable definitions
    CGRect  screenRect = [[UIScreen mainScreen] bounds];
    float   blockWidth = (screenRect.size.width/10.0f)/scr_w;
    float   blockHeight = (screenRect.size.height/24.0f)/scr_h;
    
    //float color values arrays
    float pastelWhiteValues[4]   = {0.0f,0.0f,0.0f,1.0f};
    float pastelRedValues[4]     = {246.0f,150.0f,121.0f,1.0f};
    float pastelYellowValues[4]  = {255.0f,247.0f,153.0f,1.0f};
    float pastelGreenValues[4]   = {130.0f,202.0f,156.0f,1.0f};
    float pastelCyanValues[4]    = {109.0f,207.0f,246.0f,1.0f};
    float pastelBlueValues[4]    = {131.0f,147.0f,202.0f,1.0f};
    float pastelVioletValues[4]  = {161.0f,134.0f,190.0f,1.0f};
    float pastelMagentaValues[4] = {244.0f,154.0f,193.0f,1.0f};
    
    //Pastel Colors Table (push out the pallete somewhere else)
    UIColor* pastel_red     = [UIColor colorWithRed:pastelRedValues[1]/255.0f green:pastelRedValues[2]/255.0f blue:pastelRedValues[3]/255.0f alpha:1.0f];
    UIColor* pastel_yellow  = [UIColor colorWithRed:pastelYellowValues[1]/255.0f green:pastelYellowValues[2]/255.0f blue:pastelYellowValues[3]/255.0f alpha:1.0f];
    UIColor* pastel_green   = [UIColor colorWithRed:130.0f/255.0f green:202.0f/255.0f blue:156.0f/255.0f alpha:1.0f];
    UIColor* pastel_cyan    = [UIColor colorWithRed:109.0f/255.0f green:207.0f/255.0f blue:246.0f/255.0f alpha:1.0f];
    UIColor* pastel_blue    = [UIColor colorWithRed:131.0f/255.0f green:147.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
    UIColor* pastel_violet  = [UIColor colorWithRed:161.0f/255.0f green:134.0f/255.0f blue:190.0f/255.0f alpha:1.0f];
    UIColor* pastel_magenta = [UIColor colorWithRed:244.0f/255.0f green:154.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    

    
    CGRect aRectangle = CGRectMake((xpos*blockWidth), (ypos*blockHeight*scr_h), blockWidth, blockHeight*scr_h); // Make a path with the square
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:aRectangle];                                          // Stroke the square
    
    //GRADIENT CODE START
    //	Get the drawing context
    CGContextRef context =  UIGraphicsGetCurrentContext ();
    
    CGGradientRef gradient;
    CGColorSpaceRef colorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    
    //GRADIENT CODE END
    [path stroke];
    CGFloat components[8];
    //color deliberately selected case
    switch (self.block_color) {
        case 1:
            [pastel_red setFill];
            memcpy(components, (float [8]){pastelRedValues[1],pastelRedValues[2],pastelRedValues[3],1.0f,0.0f,0.0f,0.0f,1.0f}, 8*sizeof(int));
            break;
        case 2:
            [pastel_yellow setFill];
            memcpy(components, (float [8]){pastelYellowValues[1],pastelYellowValues[2],pastelYellowValues[3],1.0f,0.0f,0.0f,0.0f,1.0f}, 8*sizeof(int));
            break;
        case 3:
            [pastel_green setFill];
            memcpy(components, (float [8]){pastelGreenValues[1],pastelGreenValues[2],pastelGreenValues[3],1.0f,0.0f,0.0f,0.0f,1.0f}, 8*sizeof(int));
            break;
        case 4:
            [pastel_cyan setFill];
            memcpy(components, (float [8]){pastelCyanValues[1],pastelCyanValues[2],pastelCyanValues[3],1.0f,0.0f,0.0f,0.0f,1.0f}, 8*sizeof(int));
            break;
        case 5:
            [pastel_blue setFill];
            memcpy(components, (float [8]){pastelBlueValues[1],pastelBlueValues[2],pastelBlueValues[3],1.0f,0.0f,0.0f,0.0f,1.0f}, 8*sizeof(int));
            break;
        case 6:
            [pastel_violet setFill];
            memcpy(components, (float [8]){pastelVioletValues[1],pastelVioletValues[2],pastelVioletValues[3],1.0f,0.0f,0.0f,0.0f,1.0f}, 8*sizeof(int));
            break;
        case 7:
            [pastel_magenta setFill];
            memcpy(components, (float [8]){pastelMagentaValues[1],pastelMagentaValues[2],pastelMagentaValues[3],1.0f,0.0f,0.0f,0.0f,1.0f}, 8*sizeof(int));
            break;
    }

    
    [path fill];
    
    //BEGIN GRADIENT CODE AGAIN
    colorspace = CGColorSpaceCreateDeviceRGB();
    gradient = CGGradientCreateWithColorComponents (colorspace, components, locations, num_locations);
    CGContextDrawLinearGradient (context, gradient, CGPointMake([self getBlockXCoordinate],[self getBlockYCoordinate]+blockHeight),
                                 CGPointMake([self getBlockXCoordinate]+blockWidth,[self getBlockYCoordinate]), 0);
    
    
    CGGradientRelease(gradient);
    //END GRADIENT CODE
    return self.block_color;
}



//getters
- (int) getBlockXCoordinate { return self.block_x_coordinate; }
- (int) getBlockYCoordinate { return self.block_y_coordinate; }
- (int) getBlockColor {return self.block_color; }

// setters
- (void) setBlockXCoordinate:(int)newValue { self.block_x_coordinate = newValue; }
- (void) setBlockYCoordinate:(int)newValue { self.block_y_coordinate = newValue; }
- (void) setBlockColor:(int)newValue { self.block_color = newValue; }

@end
