//
//  HPNavigationController.H
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//
/*
 原作者:https://github.com/12207480/KnowingLife
 */


#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"

@interface HPNavigationController : CustomNavigationController

@property (nonatomic,readonly) BOOL canPushOrPop;
@property (nonatomic, readonly) id navLock;

@end
