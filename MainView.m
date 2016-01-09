
//  MainView.m
//  Pasteltris
//
//  Created by Melissa Auclaire on 6/11/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.

#import "MainView.h"
#import <AudioToolbox/AudioToolbox.h>




#define BLOCK_COLORS 7
#define BLOCK_WIDTH screenRect.size.width/10.0f;
#define BLOCK_HEIGHT screenRect.size.height/24.0f;
#define SCREEN_RATIO_ADJUST_WIDTH 2.0
#define SCREEN_RATIO_ADJUST_HEIGHT 2.0
#define PASTELTRIS_BOARD_WIDTH 2.0 //Board width relative to the full screen size

@implementation MainView

float blockPositionX;
float blockPositionY;
int currentPos[2];
int currentPeice = 1;
int offset_x = 0;
int offset_y = 0;
BOOL initial = YES;

Peice *testPeice;

int orient;

//board
int pasteltrisBoardBasic[24][10] = {
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,7,5,5,6,0,0,0},
    {0,0,0,1,7,6,5,0,0,0},
    {0,0,0,1,4,6,5,0,0,0},
    {0,0,0,1,4,6,5,0,0,0},
    {0,0,0,1,4,6,4,0,0,0},
    {0,0,0,1,4,6,4,0,0,0},
    {0,0,0,1,4,6,5,0,0,0},
    {0,0,0,1,4,6,5,0,0,0},
    {0,0,0,1,4,6,5,0,0,0},
    {0,0,0,1,4,6,5,0,0,0},
    {0,0,0,1,4,6,5,6,4,3},
    {0,0,0,1,4,3,2,2,2,2},
    {0,0,0,1,1,2,3,4,5,6},
    {0,0,0,1,1,2,3,4,5,6},
    {0,0,0,1,5,6,7,3,2,1},
};

int  copyBoard[24][10] = {
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
};





- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //Initialization code
        gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
        drawDuration = 3.0;
    }
    return self;
}


- (void)drawGrid:(CGRect)rect {
    CGRect  screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    float   blockWidth = (screenRect.size.width/10.0f);
    float   blockHeight = (screenRect.size.height/24.0f);
    
    //NSLog(@"Block width of drawGrid %f",blockWidth);
    //NSLog(@"Block height of drawGrid %f",blockHeight);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    for(int i = 0; i < (10*SCREEN_RATIO_ADJUST_WIDTH); i++) {
        CGFloat black[4] = {0.0f, 0.0f, 0.0f, 1.0f};
        CGContextSetStrokeColor(c, black);
        CGContextBeginPath(c);
        CGContextMoveToPoint(c, i * blockWidth, 0.0f);
        CGContextAddLineToPoint(c, i* blockWidth, screenHeight*SCREEN_RATIO_ADJUST_HEIGHT);
        CGContextStrokePath(c);
    }
    
    for(int j = 0; j < (24*SCREEN_RATIO_ADJUST_HEIGHT); j++) {
        CGFloat black[4] = {0.0f, 0.0f, 0.0f, 1.0f};
        CGContextSetStrokeColor(c, black);
        CGContextBeginPath(c);
        CGContextMoveToPoint(c, 0.0f, j * blockHeight * SCREEN_RATIO_ADJUST_HEIGHT);
        CGContextAddLineToPoint(c, screenWidth *(SCREEN_RATIO_ADJUST_WIDTH/PASTELTRIS_BOARD_WIDTH), (j*blockHeight)*SCREEN_RATIO_ADJUST_HEIGHT); //remember to divide by at least float
        CGContextStrokePath(c);
    }
    
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
       (type == 7 && orient == 1)
       )
        return 3;
    
    //cases where peice height = 4
    if(type == 2 && orient == 2)
        return 4;
    
    //or else something has gone seriously wrong here...
    return -1;
}

//This is the main drawing method
- (void) drawRect:(CGRect)rect {
    
    //reset the peice position on each cycle
    if (initial) {
        testPeice = [[Peice alloc] initWithScreenAdjust:rect screen_ratio_adjust_width:SCREEN_RATIO_ADJUST_WIDTH screen_ratio_adjust_height:SCREEN_RATIO_ADJUST_HEIGHT xpos:0 ypos:0];
        offset_x = 0;
        offset_y = 0;
        
    }
    initial = NO;
    BOOL gameOver = NO;
    
    if (!animationRunning) {
        [gameTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        animationRunning = YES;
        return;
    }
    
    if (lastDrawTime == 0) {
        lastDrawTime = gameTimer.timestamp;
        return;
    }
    
    CFTimeInterval elapsedTime = (gameTimer.timestamp - lastDrawTime) ;
    NSLog(@"Current value of timer is %f", elapsedTime);
    lastDrawTime = gameTimer.timestamp;
    
    if(elapsedTime >= 10) //Run forever
        gameOver = YES;
    
    if (gameOver) {
        NSLog(@"Invalidate display link");
        [gameTimer invalidate];
        animationRunning = NO;
        lastDrawTime = 0;
    }
    
    //refresh screen
    [self clearScreen:rect];
    
    //draw grid
    //[self drawGrid:rect];
    
    //Reached bottom?
    if(testPeice.y_position + testPeice.peice_height >= 24)
        initial = YES;
    
    
    //Draw side image
    //NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"myImage" ofType:@"png"];
    //UIImage *myImageObj = [[UIImage alloc] initWithContentsOfFile:imagePath];
    
    // Store the image into a property of type UIImage *
    // for use later in the class's drawRect: method.
    //self.anImage = myImageObj;
    
    
    // Load all images from the bundle, I added 14 images, named 01.jpg ... 14.jpg
    /*
     NSMutableArray *images = [NSMutableArray array];
     [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg", 0]]];
     MLAViewController *picViewController = [[MLAViewController alloc] initWithImages:images];
     [self presentModalViewController:picViewController animated:YES];
     [picViewController release];
     */
    
    //update board
    [self drawBoard:rect game_board:pasteltrisBoardBasic];
    //[self updateBoard:pasteltrisBoardBasic];
    
    //draw a block
    [testPeice drawPeice:rect];
    //[testPeice printPeiceData];
    
    //move peice down 1 automatically
    [testPeice movePeiceDown];
    
    //set output buffer
    [self setNeedsDisplay];
    
    //sleep interval
    [NSThread sleepForTimeInterval:0.1f];
    
    //NSLog(@"Beginning");
    //[self printArray];
    [self copyArray];
    [self eliminateNeighborsAcross];
    [self eliminateNeighborsVertical];
    
    //NSLog(@"After Elimination");
    //[self printArray];
    //NSLog(@"After Pushdown");
    //[self printArray];
    [self pushDown];
}

//wrapper method to refresh display in drawRect
- (void) refresh:(CGRect)rect {
    [self setNeedsDisplay];
}

- (NSInteger) drawBlockPosition:(CGRect)rect xpos:(NSInteger)xpos ypos:(NSInteger)ypos block_color:(int)block_color{
    
    //initial screen variable definitions
    CGRect  screenRect = [[UIScreen mainScreen] bounds];
    float   blockWidth = (screenRect.size.width/10.0f)/SCREEN_RATIO_ADJUST_WIDTH;
    float   blockHeight = (screenRect.size.height/24.0f)/SCREEN_RATIO_ADJUST_HEIGHT;
    
    
    //Pastel Colors Table (push out the pallete somewhere else)
    UIColor* white          = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    UIColor* pastel_red     = [UIColor colorWithRed:246.0f/255.0f green:150.0f/255.0f blue:121.0f/255.0f alpha:1.0f];
    UIColor* pastel_yellow  = [UIColor colorWithRed:255.0f/255.0f green:247.0f/255.0f blue:153.0f/255.0f alpha:1.0f];
    UIColor* pastel_green   = [UIColor colorWithRed:130.0f/255.0f green:202.0f/255.0f blue:156.0f/255.0f alpha:1.0f];
    UIColor* pastel_cyan    = [UIColor colorWithRed:109.0f/255.0f green:207.0f/255.0f blue:246.0f/255.0f alpha:1.0f];
    UIColor* pastel_blue    = [UIColor colorWithRed:131.0f/255.0f green:147.0f/255.0f blue:202.0f/255.0f alpha:1.0f];
    UIColor* pastel_violet  = [UIColor colorWithRed:161.0f/255.0f green:134.0f/255.0f blue:190.0f/255.0f alpha:1.0f];
    UIColor* pastel_magenta = [UIColor colorWithRed:244.0f/255.0f green:154.0f/255.0f blue:193.0f/255.0f alpha:1.0f];
    
    
    CGRect aRectangle = CGRectMake((xpos*blockWidth), (ypos*blockHeight*SCREEN_RATIO_ADJUST_HEIGHT), blockWidth, blockHeight*SCREEN_RATIO_ADJUST_HEIGHT); // Make a path with the square
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:aRectangle];                                          // Stroke the square
    if(block_color != 0) {
        [path stroke];
    }
    
    //color deliberately selected case
    switch (block_color) {
        case 0:
            [white setFill];
            break;
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
    return block_color;
}

//draw the remaining stored blocks on the board
- (void) drawBoard:(CGRect)rect game_board:(int[24][10])board {
    for (int i = 0; i < 10; i++) {
        for(int j = 0; j < 24; j++) {
            [self drawBlockPosition:rect xpos:i ypos:j block_color:board[j][i]];
        }
    }
    
}

//clear the screen (white)
- (void) clearScreen:(CGRect)rect {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIColor* bg_color = [UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f];
    [bg_color setFill];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0, 0.0)];
    [path addLineToPoint:CGPointMake(screenWidth/2,0.0)];           //dividing by 2 clears half of the screen
    [path addLineToPoint:CGPointMake(screenWidth/2, screenHeight)]; // dividing by 2 clears half of the screen
    [path addLineToPoint:CGPointMake(0.0, screenHeight)];
    [path closePath];
    [path fill];
}


/* Remove similarly colored horizontal neighbor blocks */
- (void) eliminateNeighborsAcross {
    int xpos = 0, ypos = 0;
    for(ypos = 0; ypos < 24; ypos++) {
        for(xpos = 9; xpos >= 0; xpos--) {
            //eliminate horizontal neighbors
            if(pasteltrisBoardBasic[ypos][xpos] == pasteltrisBoardBasic[ypos][xpos-1] && pasteltrisBoardBasic[ypos][xpos] != 0) {
                while(pasteltrisBoardBasic[ypos][xpos] == pasteltrisBoardBasic[ypos][xpos-1] && xpos-1 >= 0) {
                    printf("X:%i Y:%i\n",xpos+1,ypos+1);
                    pasteltrisBoardBasic[ypos][xpos] = 9;
                    if(xpos-1 >= 0) {
                        xpos--;
                    }
                    else {
                        break;
                    }
                }
                printf("X:%i Y:%i\n",ypos+1,xpos+1);;
                pasteltrisBoardBasic[ypos][xpos] = 9;
            }
        }
    }
}


/* Remove similarly colored vertical neighbor blocks */
- (void) eliminateNeighborsVertical {
    int xpos = 0, ypos = 0, count = 0;
    //eliminate vertical neighbors
    for(xpos = 9; xpos >=0; xpos--) {
        for(ypos = 23; ypos >= 0; ypos-- ) {
            //CODE ADDED
            if(pasteltrisBoardBasic[ypos][xpos] == pasteltrisBoardBasic[ypos-1][xpos] && ypos-1 >= 0 && pasteltrisBoardBasic[ypos][xpos] != 0) {
                while(pasteltrisBoardBasic[ypos][xpos] == pasteltrisBoardBasic[ypos-1-count][xpos] && ypos-1-count >= 0) {
                    pasteltrisBoardBasic[ypos-1-count][xpos] = 9;
                    count++;;
                }
            }
            count = 0;
            //CODE ADDED END
            if(pasteltrisBoardBasic[ypos][xpos] == 9) {
                while(pasteltrisBoardBasic[ypos-1][xpos] == copyBoard[ypos][xpos] && ypos-1 >= 0) {
                    pasteltrisBoardBasic[ypos-1][xpos] = 9;
                    if(ypos-1 >= 0) {
                        ypos--;
                    }
                    else {
                        break;
                    }
                }
                
                while(pasteltrisBoardBasic[ypos+1][xpos] == copyBoard[ypos][xpos] && ypos+1 < 24) {
                    pasteltrisBoardBasic[ypos+1][xpos] = 9;
                    if(ypos+1 < 24) {
                        ypos++;
                    }
                    else {
                        break;
                    }
                }
            }
        }
    }
}

/* Drop blocks to the lowest possible position */
- (void) pushDown {
    int x,y,i,entered = 0,count = 0;
    for(x = 0; x < 10; x++) {
        for(y = 23; y >=0; y--) {
            if(pasteltrisBoardBasic[y][x] == 9) {
                entered = 1;
                while(pasteltrisBoardBasic[y-count][x] == 9) { //until there are no 9s
                    count++;
                    if(y-count < 0) //if 9s all the way to the top, exit
                        break;
                }
                for(i = 0; i < y; i++) {
                    if(y-count-i >= 0) {
                        pasteltrisBoardBasic[y-i][x] = pasteltrisBoardBasic[y-count-i][x];
                    }
                }
                for(i = count - 1; i >= 0; i--)
                    pasteltrisBoardBasic[i][x] = 0;
            }
        }
        count = 0;
    }
}

//helper method
- (void) copyArray {
    int x = 0 ,y = 0;
    for(y = 0; y < 24; y++) {
        for(x = 0; x < 10; x++) {
            copyBoard[y][x] = pasteltrisBoardBasic[y][x];
        }
    }
    
}

//helper method 2
- (void) printArray {
    int x,y;
    for(y = 0; y < 24; y++) {
        for(x = 0; x < 10; x++) {
            printf("%i",pasteltrisBoardBasic[y][x]);
        }
        printf("\n");
    }
    printf("\n");
}



- (int) getBlockPositionX { return blockPositionX; }
- (int) getBlockPositionY { return blockPositionY; }
- (int) getScreenRatioAdjustWidth { return SCREEN_RATIO_ADJUST_WIDTH; }
- (int) getScreenRatioAdjustHeight { return SCREEN_RATIO_ADJUST_HEIGHT; }

- (void) setBlockPositionX: (int) newPosition { blockPositionX = newPosition; }
- (void) setBlockPositionY: (int) newPosition { blockPositionY = newPosition; }
@end