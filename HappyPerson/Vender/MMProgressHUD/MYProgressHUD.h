//
//  MYProgressHUD.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2015 shuji. All rights reserved.
//


#import "MBProgressHUD.h"


@interface MYProgressHUD : NSObject

+ (void)showErrorHUD:(NSString *)text view:(UIView *)inView;

+ (void)showSadImageHUD:(NSString *)text view:(UIView *)inView;

+ (void)showSuccessHUD:(NSString *)text view:(UIView *)inView;

+ (MBProgressHUD *)showHUD:(NSString *)text image:(NSString *)imageName view:(UIView *)inView;

+ (void)showTextHUD:(NSString *)text view:(UIView *)inView;

+ (MBProgressHUD *)showHUD:(NSString *)text image:(NSString *)imageName yOffset:(float)yOffset view:(UIView *)inView;

@end
