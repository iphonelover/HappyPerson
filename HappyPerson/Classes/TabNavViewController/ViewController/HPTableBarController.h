//
//  HPTableBarController.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "HPTabBar.h"
#import "MainViewController.h"
#import "NearbyViewController.h"
@interface HPTableBarController : UITabBarController
@property (nonatomic, weak) HPTabBar *customTabBar;
@property (nonatomic, weak) MainViewController *life;
@property (nonatomic, weak) NearbyViewController *more;

@end
