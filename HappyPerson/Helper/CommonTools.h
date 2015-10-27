//
//  CommonTools.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonTools : NSObject

+ (BOOL) isBlankString:(NSString *)string;

+ (BOOL) validateEmail: (NSString *) candidate;
+ (BOOL) validateCarNo:(NSString*)carNo;



@end
