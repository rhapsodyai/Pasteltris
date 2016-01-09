//
//  MLAViewController.m
//  Pasteltris
//
//  Created by Melissa Auclaire on 6/11/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//


//All needed
#import "MLAViewController.h"
#import "MainView.h"
#import "SoundDriver.h"
#import "AudioController.h"

SystemSoundID mySound;

@interface MLAViewController ()

    @property (strong, nonatomic) AudioController *audioController;

@end

@implementation MLAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.audioController = [[AudioController alloc] init];
    [self.audioController tryPlayMusic];
    
    MainView *mainView = [[MainView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:mainView];
    
    //set up the CADisplayLink for the animation
    gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisplay:)];
    
    //add a background image
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];

    // Construct URL to sound file
    //NSString *path = [NSString stringWithFormat:@"retrogamecenter", [[NSBundle mainBundle] resourcePath]];
    //NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    //_audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    //[_audioPlayer play];
    
    //self.audioController = [[AudioController alloc] init];
    //[self.audioController tryPlayMusic];
    
    //Add the display link to the current run loop
    //[gameTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}



- (void) updateDisplay:(CADisplayLink*) sender {
    //This method is called by the gameTimer each time the display should update
}

- (void) endGameWithMessage:(NSString *)message {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)backgroundTap:(id)sender {
    NSLog(@"TAPPED!!!!!!!!!");
    //[test resignFirstResponder];
    
}
*/

/*
- (void) playMySoundLikeRightNowReally {
    AudioServicesPlaySystemSound(mySound);
}
*/

@end
