//
//  UIView+Additions.h
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2014 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

- (UIWindow *)getTopKeyWindow;

- (UIWindow *)getTopKeyBoardWindow;

+ (UIWindow *)getKeyWindow;

@end
