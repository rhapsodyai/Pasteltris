//
//  Peice.m
//  Pasteltris
//
//  Created by Melissa Auclaire on 7/26/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//


#import "Peice.h"
#import "Block.h"
@implementation Peice

Block *block1;
Block *block2;
Block *block3;
Block *block4;

//default constructor
- (id) init {
    self = [super init];
    if(self) {
        
        //set the initial peice type
        self.peice_type = arc4random_uniform(7) + 1;
        
        //then set an initial peice orientation depending on the type
        self.peice_orientation = [self setPeiceOrientationOnInit:self.peice_type];
    }
    return self;
}

- (id) initWithScreenAdjust:(CGRect)rect screen_ratio_adjust_width:(int)scr_w screen_ratio_adjust_height:(int)scr_h xpos:(int)xpos ypos:(int)ypos {
    self = [super init];
    if(self) {
        
        self.scr_w = scr_w;
        self.scr_h = scr_h;
        self.movable = true;
        
        //set coordinates
        self.x_position = xpos;
        self.y_position = ypos;
        
        //set the initial peice type
        self.peice_type = arc4random_uniform(7) + 1;
        
        //then set an initial peice orientation depending on the type
        self.peice_orientation = [self setPeiceOrientationOnInit:self.peice_type];
        
        //then set peice height and width
        self.peice_width = [self setPeiceWidthOnInit:self.peice_type peice_orientation:self.peice_orientation];
        self.peice_height = [self setPeiceHeightOnInit:self.peice_type peice_orientation:self.peice_orientation];
        
        //then set peice offset
        self.peice_xoffset = self.x_position + self.peice_width;
        self.peice_yoffset = self.y_position + self.peice_height;
        
        //then build the peice (and connect to static self blocks)
        [self buildPeice:self.peice_type peice_orientation:self.peice_orientation];
        
        //draw the peice to the screen
        //[self drawPeice:rect];
    }
    return self;
}

//getters
//- (bool) getMovable               { return self.movable; }
- (int) getPeiceXPosition         { return self.x_position; }
- (int) getPeiceYPosition         { return self.y_position; }
- (int) getPeiceType              { return self.peice_type; }
- (int) getPeiceOrientation       { return self.peice_orientation; }
- (int) getPeiceBlockNumber       { return self.peice_block_number; }
//- (int) getHighestBlockPosition   { return self.highest_block_position; }
//- (int) getLowestBlockPosition    { return self.lowest_block_position; }
//- (int) getLeftmostBlockPosition  { return self.leftmost_block_position; }
//- (int) getRightmostBlockPosition { return self.rightmost_block_position; }


//setters
//- (void) setMovable:(bool)newValue               { self.movable = newValue; }
- (void) setPeiceXPosition:(int)newValue         { self.x_position = newValue; }
- (void) setPeiceYPosition:(int)newValue         { self.y_position =  newValue; }
- (void) setPeiceType:(int)newValue              { self.peice_type = newValue; }
- (void) setPeiceOrientation:(int)newValue       { self.peice_orientation = newValue; }
- (void) setPeiceBlockNumber:(int)newValue       { self.peice_block_number = newValue; }
//- (void) setHighestBlockPosition:(int)newValue   { self.highest_block_position = newValue; }
//- (void) setLowestBlockPosition:(int)newValue    { self.lowest_block_position = newValue; }
//- (void) setLeftmostBlockPosition:(int)newValue  { self.leftmost_block_position = newValue; }
//- (void) setRightmostBlockPosition:(int)newValue { self.rightmost_block_position = newValue; }


- (int) setPeiceOrientationOnInit: (int) p_type {
    switch (p_type) {
        case T_PEICE: // tpeice
            return arc4random_uniform(4) + 1;
            break;
        case LINE_PEICE: // linepeice
            return arc4random_uniform(2) + 1;
            break;
        case BOX_PEICE: // boxpeice
            return 1;
            break;
        case LEFT_LPEICE: // leftlpeice
            return arc4random_uniform(4) + 1;
            break;
        case RIGHT_LPEICE: // rightlpeice
            return arc4random_uniform(4) + 1;
            break;
        case LEFT_TETROID: // lefttetroid
            return arc4random_uniform(2) + 1;
            break;
        case RIGHT_TETROID: // righttetroid
            return arc4random_uniform(2) + 1;
            break;
    }
    //Note: this should never happen
    return -1;
}

- (void) movePeiceLeft {
    if(self.x_position >= 0) {
        self.x_position--;
        [block1 setBlockXCoordinate:block1.getBlockXCoordinate-1];
        [block2 setBlockXCoordinate:block2.getBlockXCoordinate-1];
        [block3 setBlockXCoordinate:block3.getBlockXCoordinate-1];
        [block4 setBlockXCoordinate:block4.getBlockXCoordinate-1];
    }
}

- (void) movePeiceRight {
    if(self.x_position + self.peice_width < 10) {
        self.x_position++;
        [block1 setBlockXCoordinate:block1.getBlockXCoordinate+1];
        [block2 setBlockXCoordinate:block2.getBlockXCoordinate+1];
        [block3 setBlockXCoordinate:block3.getBlockXCoordinate+1];
        [block4 setBlockXCoordinate:block4.getBlockXCoordinate+1];
    }
}

- (void) movePeiceUp {
    if(self.y_position >= 0) {
        self.y_position--;
        [block1 setBlockYCoordinate:block1.getBlockYCoordinate-1];
        [block2 setBlockYCoordinate:block2.getBlockYCoordinate-1];
        [block3 setBlockYCoordinate:block3.getBlockYCoordinate-1];
        [block4 setBlockYCoordinate:block4.getBlockYCoordinate-1];
    }
}

- (void) movePeiceDown {
    if(self.y_position + self.peice_height < 24) {
        self.y_position++;
        [block1 setBlockYCoordinate:block1.getBlockYCoordinate+1];
        [block2 setBlockYCoordinate:block2.getBlockYCoordinate+1];
        [block3 setBlockYCoordinate:block3.getBlockYCoordinate+1];
        [block4 setBlockYCoordinate:block4.getBlockYCoordinate+1];
    }
}


- (void) buildPeice:(int)param_peice_type peice_orientation:(int)param_peice_orientation {
    switch(param_peice_type) {
        case T_PEICE:
            switch (param_peice_orientation) {
                case 1:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:2+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    break;
                case 2:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:1+self.y_position];
                    break;
                case 3:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:2+self.y_position];
                    break;
                case 4:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:0+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    break;
            }
        break;
            
        case LINE_PEICE:
            switch (param_peice_orientation) {
                case 1:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:0+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:3+self.x_position y_coordinate:0+self.y_position];
                    break;
                case 2:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:2+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:3+self.y_position];
                    break;
            }
        break;
        
            
        case BOX_PEICE:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
        break;
            
            
        case LEFT_LPEICE:
            switch (param_peice_orientation) {
                case 1:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:1+self.y_position];
                    break;
                case 2:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:2+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:2+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    break;
                case 3:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:0+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:1+self.y_position];
                    break;
                case 4:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:2+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    break;
            }
        break;
            
        case RIGHT_LPEICE:
            switch (param_peice_orientation) {
                case 1:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:0+self.y_position];
                    break;
                case 2:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:2+self.y_position];
                    break;
                case 3:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:0+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    break;
                case 4:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:2+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:2+self.y_position];
                    break;
            }
        break;
            
        case LEFT_TETROID:
            switch (param_peice_orientation) {
                case 1:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:2+self.y_position];
                    break;
                case 2:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:0+self.y_position];
                    break;
            }
        break;
            
        case RIGHT_TETROID:
            switch (param_peice_orientation) {
                case 1:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:1+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:2+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    break;
                case 2:
                    block1 = [[Block alloc] initWithCoordinates:0+self.x_position y_coordinate:0+self.y_position];
                    block2 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:0+self.y_position];
                    block3 = [[Block alloc] initWithCoordinates:1+self.x_position y_coordinate:1+self.y_position];
                    block4 = [[Block alloc] initWithCoordinates:2+self.x_position y_coordinate:1+self.y_position];
                    break;
            }
        break;
    }
    staticBlock1 = block1;
    staticBlock2 = block2;
    staticBlock3 = block3;
    staticBlock4 = block4;
}

- (void) drawPeice:(CGRect)rect {
    [self->staticBlock1 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
    [self->staticBlock2 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
    [self->staticBlock3 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
    [self->staticBlock4 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
    
    [block1 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
    [block2 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
    [block3 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
    [block4 drawBlock:rect sraw:self.scr_w srah:self.scr_h];
}

- (void) printPeiceData {
    NSLog(@"Peice X Position: %i",self.x_position);
    NSLog(@"Peice Y Position: %i",self.y_position);
    NSLog(@"Peice Width: %i",self.peice_width);
    NSLog(@"Peice Height: %i",self.peice_height);
    NSLog(@"Peice Offset: %i",self.peice_height-self.x_position);
    NSLog(@"SCR_W: %i",self.scr_w);
    NSLog(@"SCR_H: %i",self.scr_h);
    NSLog(@"Peice Type: %i",self.peice_type);
    NSLog(@"Peice Orientation: %i",self.peice_orientation);
    NSLog(@"Peice Block Number: %i",self.peice_block_number);
}

- (int) setPeiceWidthOnInit: (int)p_type peice_orientation:(int)p_orientation {
    switch(p_type) {
        case T_PEICE:
            switch(p_orientation) {
                case 1:
                    return 2;
                    break;
                case 2:
                    return 3;
                    break;
                case 3:
                    return 2;
                    break;
                case 4:
                    return 3;
                    break;
            }
            break;
        case LINE_PEICE:
            switch(p_orientation) {
                case 1:
                    return 4;
                    break;
                case 2:
                    return 1;
                    break;
            }
            break;
        case BOX_PEICE:
            return 2;
            break;
        case LEFT_LPEICE:
            switch(p_orientation) {
                case 1:
                    return 3;
                    break;
                case 2:
                    return 2;
                    break;
                case 3:
                    return 3;
                    break;
                case 4:
                    return 2;
                    break;
            }
            break;
        case RIGHT_LPEICE:
            switch(p_orientation) {
                case 1:
                    return 3;
                    break;
                case 2:
                    return 2;
                    break;
                case 3:
                    return 3;
                    break;
                case 4:
                    return 2;
                    break;
            }
            break;
        case LEFT_TETROID:
            switch(p_orientation) {
                case 1:
                    return 2;
                    break;
                case 2:
                    return 3;
                    break;
            }
            break;
        case RIGHT_TETROID:
            switch(p_orientation) {
                case 1:
                    return 2;
                    break;
                case 2:
                    return 3;
                    break;
            }
            break;
    }
    //Note: this should never happen
    return -1;
}

- (int) setPeiceHeightOnInit: (int)p_type peice_orientation:(int)p_orientation {
    switch(p_type) {
        case T_PEICE:
            switch(p_orientation) {
                case 1:
                    return 3;
                    break;
                case 2:
                    return 2;
                    break;
                case 3:
                    return 3;
                    break;
                case 4:
                    return 2;
                    break;
            }
            break;
        case LINE_PEICE:
            switch(p_orientation) {
                case 1:
                    return 1;
                    break;
                case 2:
                    return 4;
                    break;
            }
            break;
        case BOX_PEICE:
            return 2;
            break;
        case LEFT_LPEICE:
            switch(p_orientation) {
                case 1:
                    return 2;
                    break;
                case 2:
                    return 3;
                    break;
                case 3:
                    return 2;
                    break;
                case 4:
                    return 3;
                    break;
            }
            break;
        case RIGHT_LPEICE:
            switch(p_orientation) {
                case 1:
                    return 2;
                    break;
                case 2:
                    return 3;
                    break;
                case 3:
                    return 2;
                    break;
                case 4:
                    return 3;
                    break;
            }
            break;
        case LEFT_TETROID:
            switch(p_orientation) {
                case 1:
                    return 3;
                    break;
                case 2:
                    return 2;
                    break;
            }
            break;
        case RIGHT_TETROID:
            switch(p_orientation) {
                case 1:
                    return 3;
                    break;
                case 2:
                    return 2;
                    break;
            }
            break;
    }
    //Note: this should never happen
    return -1;
}

- (int) getPeiceWidth:(int)type orientation:(int)orient {
    //case where peice width = 1
    //case where peice width = 2
    //case where peice width = 3
    //case where peice width = 4
    return -1;
}

- (int) getPeiceHeight:(int)type orientation:(int)orient {
    //cases where peice height = 1
    if(type == 2 && orient == 1)
        return 1;
    
    //cases where peice height = 2
    if ((type == 1 && orient == 2) ||
        (type == 1 && orient == 4) ||
        (type == 4 && orient == 1) ||
        (type == 4 && orient == 3) ||
        (type == 5 && orient == 1) ||
        (type == 5 && orient == 3) ||
        (type == 6 && orient == 2) ||
        (type == 7 && orient == 2) ||
        (type == 3))
        return 2;
    
    //cases where peice height = 3
    if((type == 1 && orient == 1) ||
       (type == 1 && orient == 3) ||
       (type == 4 && orient == 2) ||
       (type == 4 && orient == 4) ||
       (type == 5 && orient == 2) ||
       (type == 5 && orient == 4) ||
       (type == 6 && orient == 1) ||
       (type == 7 && orient == 1))
        return 3;
    
    //cases where peice height = 4
    if(type == 2 && orient == 2)
        return 4;
    
    //something has gone seriously wrong here o_O
    return -1;
}

@end


