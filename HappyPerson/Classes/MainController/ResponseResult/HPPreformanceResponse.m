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
    [[HPVenderClientKit sharedInstance] getPreformance:nil success:^(NSDictionary *performanceItems) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
