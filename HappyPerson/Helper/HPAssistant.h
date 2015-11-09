//
//  HPAssistant.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPAssistant : NSObject

+(UIImage *)imageWithContentsOfFile:(NSString *)name;
+(UIImage *)imageWithContentsOfjpgFile:(NSString *)name;
+(NSArray *)arrayWithStringFromPlist:(NSString *)string;
+(float)fileSizeAtPath:(NSString *)path;


@end
