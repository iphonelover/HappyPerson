//
//  GuidanceImage.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "GuidanceImage.h"

@implementation GuidanceImage


/*!
 *    @brief  <#Description#>
 *
 *    @param image <#image description#>
 *
 *    @return <#return value description#>
 *
 *    @since <#version number#>
 */
+(instancetype)modelWithImage:(UIImage *)image{
    
    GuidanceImage *guidanceImage = [[GuidanceImage alloc] init];
    
    guidanceImage.scrollViewImage = image;
    
    return guidanceImage;
}


@end
