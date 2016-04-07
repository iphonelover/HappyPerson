//
//  UIView+Masony.h
//  HappyPerson
//
//  Created by wei on 15/4/22.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Masony)



/**
 *  视图添加约束，使之和父控件一样大
 *
 *  @param insets insets
 */
-(void)masViewAddConstraintMakeEqualSuperViewWithInsets:(UIEdgeInsets)insets;




@end
