//
//  HPRecommandModel.m
//  HappyPerson
//
//  Created by wei on 15/12/2.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPRecommandModel.h"

@implementation HPRecommandModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"recommandID":@"id",
             @"rate_count":@"rate-count"};
}


@end
