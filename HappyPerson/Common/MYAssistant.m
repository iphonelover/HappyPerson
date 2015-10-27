//
//  MYAssistant.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2014 wei. All rights reserved.
//

#import "MYAssistant.h"


@implementation MYAssistant


+ (UIImage *) imageWithContentsOfFile:(NSString *) name
{
    static NSBundle *MYbundle = nil;
    static UIScreen *MYScreen = nil;
    if (MYbundle == nil) {
        MYbundle = [NSBundle mainBundle];
    }
    if (MYScreen == nil) {
        MYScreen = [UIScreen mainScreen];
    }
    NSString *path = nil;
    if (MYScreen.scale == 1.0) {
        path = [MYbundle pathForResource:name ofType:@"png"];
    }else if(MYScreen.scale == 2.0){
        path = [MYbundle pathForResource:[[NSString alloc] initWithFormat:@"%@@2x",name] ofType:@"png"];
    }else if(MYScreen.scale == 3.0){
        path = [MYbundle pathForResource:[[NSString alloc] initWithFormat:@"%@@3x",name] ofType:@"png"];
    }
    return  [UIImage imageWithContentsOfFile:path];
}

+ (UIImage *) imageWithContentsOfJPGFile:(NSString *) name
{
    NSBundle *MYbundle = nil;
    UIScreen *MYScreen = nil;
    if (MYbundle == nil) {
        MYbundle = [NSBundle mainBundle];
    }
    if (MYScreen == nil) {
        MYScreen = [UIScreen mainScreen];
    }
    NSString *path = nil;
    if (MYScreen.scale == 1.0) {
        path = [MYbundle pathForResource:name ofType:@"jpg"];
    }else if(MYScreen.scale == 2.0){
        path = [MYbundle pathForResource:[[NSString alloc] initWithFormat:@"%@@2x",name] ofType:@"jpg"];
    }else if (MYScreen.scale == 3.0){
        path = [MYbundle pathForResource:[[NSString alloc] initWithFormat:@"%@@3x",name] ofType:@"jpg"];
    }
    return  [UIImage imageWithContentsOfFile:path];
}



@end
