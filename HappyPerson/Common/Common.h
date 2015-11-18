//
//  XWCommon.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "UIColor+Additions.h"
#import "CustomViewController.h"
#import "CustomNaviBarView.h"

#import "UIView+Additions.h"
#import "UIView+Masony.h"
#import "AppDelegate.h"




#ifndef HappyPerson_XWCommon_h
#define HappyPerson_XWCommon_h



const static NSString *APIKey = @"f30e6a8cfd37ab9d0133a185fe8ff54e";

#define TAGVALUE  10000


#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define kApplecationScreenWidth  [[UIScreen mainScreen] applicationFrame].size.width
#define kApplecationScreenHeight [[UIScreen mainScreen] applicationFrame].size.height



//定位获取到结果(获取到经纬度)的通知
#define NOTIFICATION_LOCATION_GET_RESULT @"location_succeed_Notification"
//定位获取到结果(获取到经纬度)的通知
#define NOTIFICATION_LOCATION_INFO_GET_CITYNAME @"get_location_succeed_Notification"

//判断是否大于7.0系统
#define ios7 [[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0





//#define __IPHONE_8_0     80000
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // iOS 8.0 supported

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 80000 // iOS 8.0 supported and required

#define IS_IOS_8_0_SYSTEM_AVAILABLE      YES

#else                                         // iOS 8.0 supported but not required

#ifndef NSFoundationVersionNumber_iPhoneOS_8_0

#define NSFoundationVersionNumber_iPhoneOS_8_0 9999.00
#endif

#define IS_IOS_8_0_SYSTEM_AVAILABLE     (NSFoundationVersionNumber >= NSFoundationVersionNumber_iPhoneOS_8_0)

#endif

#else                                        // iOS 8.0 not supported

#define IS_IOS_8_0_SYSTEM_AVAILABLE      NO

#endif

// Compiling for iOS
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000 // iOS 7.0 supported

#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000 // iOS 7.0 supported and required

#define IS_IOS_7_0_SYSTEM_AVAILABLE      YES

#else                                         // iOS 7.0 supported but not required

#ifndef NSFoundationVersionNumber_iPhoneOS_7_0

#define NSFoundationVersionNumber_iPhoneOS_7_0 999.00
#endif

#define IS_IOS_7_0_SYSTEM_AVAILABLE     (NSFoundationVersionNumber >= NSFoundationVersionNumber_iPhoneOS_7_0)

#endif

#else                                        // iOS 7.0 not supported

#define IS_IOS_7_0_SYSTEM_AVAILABLE      NO

#endif


#ifdef DEBUG
#define NSLog(...)   NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#define MARK    NSLog(@"\nMARK: %s, %d", __PRETTY_FUNCTION__, __LINE__)


#pragma mark - Device Information

#define iPhone6  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6plus  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define isiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define isSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)


#define kMainScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kMainScreenHeight   [[UIScreen mainScreen] bounds].size.height


#define MYUIKeyboardFrameEndUserInfoKey (&UIKeyboardFrameEndUserInfoKey != NULL ? \
UIKeyboardFrameEndUserInfoKey : @"UIKeyboardBoundsUserInfoKey")

#define kSupportIos7NavBar YES

#define kViewBackgroundColor  [UIColor colorWithDesignIndex:19]


//第一次安装此程序
static NSString * const kFirstLogined = @"kFirstLogined";

static NSString * const kFirstUpload = @"kFirstUpload";


//是否为一直登录状态
static NSString * const kRetainLogining = @"kRetainLogining";

#define HPCachesPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]


//强化NSLog
//#define NSLog(format, ...) do { \
//fprintf(stderr, "<%s : %d> %s\n", \
//[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
//__LINE__, __func__); \
//(NSLog)((format), ##__VA_ARGS__); \
//fprintf(stderr, "-------\n"); \
//} while (0)



#endif
