//
//  DirectDraw.h
//  Pasteltris
//
//  Created by Melissa Auclaire on 8/14/14.
//  Copyright (c) 2014 Melissa Lynn Auclaire. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DirectDraw : NSObject

//Peice draw functions
- (void) drawTPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawLinePeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawBoxPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawLeftLPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawRightLPeice:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawLeftTetroid :(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawRightTetroid:(CGRect)rect offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;

//Peice draw functions with orientation
- (void) drawTPeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawLinePeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawBoxPeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawLeftLPeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawRightLPeice:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawLeftTetroid :(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;
- (void) drawRightTetroid:(CGRect)rect orientation:(NSInteger)orientation offsetx:(NSInteger)offsetx offsety:(NSInteger)offsety;

@end
