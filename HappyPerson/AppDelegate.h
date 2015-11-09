//
//  AppDelegate.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HPTableBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *locationCity;
@property (assign, nonatomic) BOOL locationYES;

@property (nonatomic, assign) CLLocation *currentLocation;
@property (nonatomic, strong) HPTableBarController *hpTabBarController;





-(void)initLocationAction;
@end

