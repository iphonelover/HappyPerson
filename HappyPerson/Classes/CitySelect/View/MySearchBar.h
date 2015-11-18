//
//  MySearchBar.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kBgTextFieldImageName @"city_search_field_bg.png"
@interface MySearchBar : UISearchBar <UISearchBarDelegate>
- (void)changeBarTextfieldWithColor:(UIColor *)color bgImageName:(NSString *)bgImageName;
- (void)changeBarCancelButtonWithColor:(UIColor *)textColor bgImageName:(NSString *)bgImageName;
@end
