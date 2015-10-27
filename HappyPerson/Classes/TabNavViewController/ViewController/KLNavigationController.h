//
//  KLNavigationController.h
//  KnowingLife
//
//  Created by tanyang on 14/10/26.
//  Copyright (c) 2014年 tany. All rights reserved.
//

/*
 原作者:https://github.com/12207480/KnowingLife
 */


#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"

@interface KLNavigationController : CustomNavigationController

@property (nonatomic,readonly) BOOL canPushOrPop;
@property (nonatomic, readonly) id navLock;

@end
