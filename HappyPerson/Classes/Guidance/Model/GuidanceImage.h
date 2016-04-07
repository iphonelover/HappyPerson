//
//  GuidanceImage.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuidanceImage : NSObject

@property (nonatomic,strong) UIImage *scrollViewImage;

+(id)modelWithImage:(UIImage *)image;

@end
