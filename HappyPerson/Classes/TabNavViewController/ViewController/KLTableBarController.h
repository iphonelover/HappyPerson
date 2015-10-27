//
//  KLTableBarController.h
//  KnowingLife
//
//  Created by tanyang on 14/10/26.
//  Copyright (c) 2014年 tany. All rights reserved.
//

/*
 原作者:https://github.com/12207480/KnowingLife
 */

#import <UIKit/UIKit.h>
#import "WBTabBar.h"
#import "MainViewController.h"
#import "NearbyViewController.h"
@interface KLTableBarController : UITabBarController
@property (nonatomic, weak) WBTabBar *customTabBar;
@property (nonatomic, weak) MainViewController *life;
@property (nonatomic, weak) NearbyViewController *more;

@end
