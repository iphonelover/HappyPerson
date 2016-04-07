//
//  AdDataModel.m
//  HappyPerson
//
//  Created by wei on 14/06/20.
//  Copyright (c) 2014年 shuji. All rights reserved.
//

#import "AdDataModel.h"

#define PLISTFILENAME @"AdDataPlist.plist"

#define PATH  [[NSBundle mainBundle]pathForResource:PLISTFILENAME ofType:nil]

@implementation AdDataModel

- (instancetype)initWithImageName
{
    self = [super init];
    if (self)
    {
        _imageNameArray = [NSArray arrayWithContentsOfFile:PATH][0];
    }
    return self;
}

- (instancetype)initWithImageNameAndAdTitleArray
{
    if ([[NSArray arrayWithContentsOfFile:PATH] count]>=1)
    {
        _adTitleArray = [NSArray arrayWithContentsOfFile:PATH][1];
    }
    
    return [self initWithImageName];
}

+ (id)adDataModelWithImageName
{
    return [[self alloc]initWithImageName];
}

+ (id)adDataModelWithImageNameAndAdTitleArray
{
    return [[self alloc]initWithImageNameAndAdTitleArray];
}
@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
