//
//  HPHotLineResponse.m
//  HappyPerson
//
//  Created by wei on 15/12/2.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPHotLineResponse.h"

@implementation HPHotLineResponse


-(void)loadNewData
{
    [[HPVenderClientKit sharedInstance] getHotLine:nil success:^(NSArray *hotlineItems) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
