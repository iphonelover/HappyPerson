//
//  UIColor+Additions.h
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2014 shuji. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIColor (Additions)


UIColor *UIColorWithRGBFloatValue(float red,float green,float blue);

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

+ (UIColor *) colorWithDesignIndex:(int)index;

+ (BOOL) isTheSameColor:(UIColor*)color1 anotherColor:(UIColor*)color2;
@end
