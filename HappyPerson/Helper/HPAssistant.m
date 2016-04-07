//
//  HPAssistant.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "HPAssistant.h"

@implementation HPAssistant

+(UIImage *)imageWithContentsOfFile:(NSString *)name
{
    static NSBundle *hpBundle = nil;
    static UIScreen *hpScreen = nil;
    
    if (hpBundle == nil) {
        hpBundle = [NSBundle mainBundle];
    }
    if (hpScreen == nil) {
        hpScreen = [UIScreen mainScreen];
    }
    
    NSString *path = nil;
    
    if (hpScreen.scale == 1.0) {
        path = [hpBundle pathForResource:name ofType:@"png"];
    }else if (hpScreen.scale == 2.0){
        path = [hpBundle pathForResource:[NSString stringWithFormat:@"%@@2x",name] ofType:@"png"];
    }else if(hpScreen.scale == 3.0){
        path = [hpBundle pathForResource:[NSString stringWithFormat:@"%@@3x",name] ofType:@"png"];
    }
    
    return [UIImage imageWithContentsOfFile:path];
}

+(UIImage *)imageWithContentsOfjpgFile:(NSString *)name
{
    static NSBundle *hpBundle = nil;
    static UIScreen *hpScreen = nil;
    
    if (hpBundle == nil) {
        hpBundle = [NSBundle mainBundle];
    }
    if (hpScreen == nil) {
        hpScreen = [UIScreen mainScreen];
    }
    NSString *path = nil;
    
    if (hpScreen.scale == 1.0) {
        path = [hpBundle pathForResource:name ofType:@"jpg"];
    }else if (hpScreen.scale == 2.0){
        path = [hpBundle pathForResource:[NSString stringWithFormat:@"%@@2x",name] ofType:@"jpg"];
    }else if (hpScreen.scale == 3.0){
        path = [hpBundle pathForResource:[NSString stringWithFormat:@"%@@3x",name] ofType:@"jpg"];
    }
    
    return [UIImage imageWithContentsOfFile:path];
}

+(NSArray *)arrayWithStringFromPlist:(NSString *)string{
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:string ofType:nil];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:plistPath];
    return array;
    
}

+(float)fileSizeAtPath:(NSString *)path{
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:path]){
        
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        
        return size/1024.0/1024.0;
    }
    return 0;
}



@end
