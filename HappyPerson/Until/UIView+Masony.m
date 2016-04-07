//
//  UIView+Masony.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "UIView+Masony.h"
#import "Masonry.h"

@implementation UIView (Masony)


/**
 *  视图添加约束，使之和父控件一样大
 *
 *  @param insets insets
 */
-(void)masViewAddConstraintMakeEqualSuperViewWithInsets:(UIEdgeInsets)insets{
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.superview).with.insets(insets);
    }];
}






@end
