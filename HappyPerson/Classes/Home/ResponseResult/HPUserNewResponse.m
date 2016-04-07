//
//  HPUserNewResponse.m
//  HappyPerson
//
//  Created by wei on 15/12/1.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPUserNewResponse.h"

@implementation HPUserNewResponse

-(void)loadNewData
{
    [[HPVenderClientKit sharedInstance] getUserNewPreference:nil success:^(NSArray *preferenceItems) {
        if (self.responseSuccessBlock) {
            self.responseSuccessBlock(preferenceItems);
        }
    } failure:^(NSError *error) {
        if (self.responseFailureBlock) {
            self.responseFailureBlock(error);
        }
    }];
}

@end
