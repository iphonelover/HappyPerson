//
//  WBTabbar.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

/*
 原作者:https://github.com/12207480/KnowingLife
 */

#import <UIKit/UIKit.h>

@class HPTabBar;
@protocol HPTabbarDekegate <NSObject>

@optional
- (void)tabBar:(HPTabBar *)tabBar didSelectedButtonfrom:(NSInteger)from to:(NSInteger)to;
@end

@interface HPTabBar : UIView
@property (nonatomic, weak) id<HPTabbarDekegate>delegate;

- (void)addButtonWithItem:(UITabBarItem *)item;
@end
