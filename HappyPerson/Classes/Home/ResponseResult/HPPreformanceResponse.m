//
//  HPPreformanceResponse.m
//  HappyPerson
//
//  Created by wei on 15/12/2.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPPreformanceResponse.h"

@implementation HPPreformanceResponse

-(void)loadNewData
{
    [[HPVenderClientKit sharedInstance] getPerformance:nil success:^(NSArray *performanceItems) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
