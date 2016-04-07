//
//  AdDataModel.h
//  HappyPerson
//
//  Created by wei on 15/06/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdDataModel : NSObject

@property (retain,nonatomic,readonly) NSArray * imageNameArray;
@property (retain,nonatomic,readonly) NSArray * adTitleArray;

- (instancetype)initWithImageName;
- (instancetype)initWithImageNameAndAdTitleArray;
+ (id)adDataModelWithImageName;
+ (id)adDataModelWithImageNameAndAdTitleArray;
@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
