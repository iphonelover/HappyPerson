//
//  MYBaserObject.m
//  HappyPerson
//
//  Created by wei on 15/7/26.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MYBaseObject.h"

@implementation MYBaseObject

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    return  @{@"status":@"status"};
}

@end
