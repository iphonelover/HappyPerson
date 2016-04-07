//
//  UIView+Additions.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2014 shuji. All rights reserved.
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (UIWindow *)getTopKeyWindow
{
    UIWindow *window = nil;
    if ([UIApplication sharedApplication].windows.count > 0) {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    
    
    if (!window) {
        window = self.window;
    }
    return window;
}

- (UIWindow *)getTopKeyBoardWindow
{
    int index = 0.f;
    UIWindow *window = nil;
    if ([UIApplication sharedApplication].windows.count > 0) {
        if ([UIApplication sharedApplication].windows.count > 1) {
            index = 1.f;
        }
        window = [[UIApplication sharedApplication].windows objectAtIndex:index];
    }
    
    
    if (!window) {
        window = self.window;
    }
    return window;
}

+ (UIWindow *)getKeyWindow
{
    int index = 0.f;
    UIWindow *window = nil;
    if ([UIApplication sharedApplication].windows.count > 0) {
        if ([UIApplication sharedApplication].windows.count > 1) {
            index = 1.f;
        }
        window = [[UIApplication sharedApplication].windows objectAtIndex:index];
    }
    
    
    if (!window) {
        window = [UIApplication sharedApplication].keyWindow;
    }
    return window;
}

@end
