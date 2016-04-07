//
//  HPRecommandResponse.m
//  HappyPerson
//
//  Created by wei on 15/12/2.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPRecommandResponse.h"

@implementation HPRecommandResponse

-(void)loadNewData
{
    [[HPVenderClientKit sharedInstance] getRecommand:nil success:^(NSArray *recommandItems) {
        
    } failure:^(NSError *error) {
        
    }];
}

@end
