//
//  HPFamousDealsModel.m
//  HappyPerson
//
//  Created by wei on 15/11/20.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPFamousDealsModel.h"

@implementation HPFamousDealsModel

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"dealsID":@"id",
             @"rate_count":@"rate-count"};
}

@end
