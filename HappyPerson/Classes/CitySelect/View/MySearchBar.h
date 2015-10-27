//
//  MySearchBar.h
//  CardWise
//
//  Created by yulong on 14-4-14.
//  Copyright (c) 2014年 CDG. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kBgTextFieldImageName @"city_search_field_bg.png"
@interface MySearchBar : UISearchBar <UISearchBarDelegate>
- (void)changeBarTextfieldWithColor:(UIColor *)color bgImageName:(NSString *)bgImageName;
- (void)changeBarCancelButtonWithColor:(UIColor *)textColor bgImageName:(NSString *)bgImageName;
@end
