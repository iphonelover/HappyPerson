//
//  HPFansLifeResponse.m
//  HappyPerson
//
//  Created by wei on 15/12/2.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPFansLifeResponse.h"

@implementation HPFansLifeResponse

-(void)loadNewData
{
    [[HPVenderClientKit sharedInstance] getFanLife:nil success:^(NSDictionary *fanLifeItems) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
