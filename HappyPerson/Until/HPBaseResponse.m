//
//  HPBaseResponse.m
//  HappyPerson
//
//  Created by wei on 15/11/20.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPBaseResponse.h"

@implementation HPBaseResponse

- (id)init
{
    self = [super init];
    if (self) {
        self.currentPage = kStartPageCount;
    }
    return self;
}

-(void)loadNetData
{
    
}

@end
