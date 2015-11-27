//
//  HPFamousResponse.m
//  HappyPerson
//
//  Created by wei on 15/11/20.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPFamousResponse.h"

@implementation HPFamousResponse

//正式接口需要在后面添加参数
-(void)loadNetData
{
    
    [[HPVenderClientKit sharedInstance] getFamousProduct:nil withPage:nil  success:^(NSDictionary *famousItems) {
        if (self.responseSuccessBlock) {
            self.responseSuccessBlock(famousItems);
        }
    } failure:^(NSError *error) {
        if (self.responseFailureBlock) {
            self.responseFailureBlock(error);
        }
    }];
}

@end
