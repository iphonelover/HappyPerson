//
//  MYProgressHUD.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2015 shuji. All rights reserved.
//

#import "MYProgressHUD.h"

@implementation MYProgressHUD


+ (void)showErrorHUD:(NSString *)text view:(UIView *)inView
{
    [MYProgressHUD showHUD:text image:@"MY_Fail_Icon" view:inView];
}

+ (void)showSadImageHUD:(NSString *)text view:(UIView *)inView
{
    [MYProgressHUD showHUD:text image:@"MY_Sadface_Icon" view:inView];
}

+ (void)showSuccessHUD:(NSString *)text view:(UIView *)inView
{
    [MYProgressHUD showHUD:text image:@"MY_Success_Icon" view:inView];
}

+ (MBProgressHUD *)showHUD:(NSString *)text image:(NSString *)imageName view:(UIView *)inView
{
    return [MYProgressHUD showHUD:text image:imageName yOffset:0.f view:inView];
}

+ (MBProgressHUD *)showHUD:(NSString *)text image:(NSString *)imageName yOffset:(float)yOffset view:(UIView *)inView
{
    
    MBProgressHUD *_hud= [[MBProgressHUD alloc] initWithView:inView];

    [inView addSubview:_hud];
    
    if (imageName && imageName.length > 0) {
        _hud.customView = [[UIImageView alloc] initWithImage:[HPAssistant imageWithContentsOfFile:imageName]];
        _hud.mode = MBProgressHUDModeCustomView;
    }
    _hud.minSize = CGSizeMake(150.f, 100.f);
    _hud.opacity = 0.8;
    _hud.removeFromSuperViewOnHide = YES;
    _hud.labelText = text;
//    if (!fequalzero(yOffset)) {
//        _hud.yOffset = yOffset;
//    }
    
    if (imageName && imageName.length > 0) {
        [_hud show:YES];
        [_hud hide:YES afterDelay:2.f];
        return nil;
    }else{
        return _hud;
    }
    
}

+ (void)showTextHUD:(NSString *)text view:(UIView *)inView
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:inView animated:YES];
	
	// Configure for text only and offset down
	hud.mode = MBProgressHUDModeText;
	hud.labelText = text;
	hud.margin = 10.f;
	hud.yOffset = 50.f;
	hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
	
	[hud hide:YES afterDelay:1.f];
}

@end
