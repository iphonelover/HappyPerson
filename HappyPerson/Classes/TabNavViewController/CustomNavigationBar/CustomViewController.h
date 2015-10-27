//
//  CustomViewController.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

/*
 版权属于原作者：https://github.com/jimple/CustomNavigationBar
 */

#import <UIKit/UIKit.h>

@interface CustomViewController : UIViewController

- (void)bringNaviBarToTopmost;

- (void)hideNaviBar:(BOOL)bIsHide;
- (void)setNaviBarTitle:(NSString *)strTitle;
- (void)setNaviBarLeftBtn:(UIButton *)btn;
- (void)setNaviBarRightBtn:(UIButton *)btn;
- (void)setCustomBarBtn:(UIButton *)btn rect:(CGRect)rect;

- (void)setNavCenterView:(UIView *)centerView;

- (void)naviBarAddCoverView:(UIView *)view;
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view;
- (void)naviBarRemoveCoverView:(UIView *)view;

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack;


- (void)enableKeyboardNSNotification:(BOOL)isEnable;

- (void)keyboardWillShow:(NSNotification *)notification;

- (void)keyboardWillHide:(NSNotification *)notification;


@end
