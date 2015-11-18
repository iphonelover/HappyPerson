//
//  HPVenderClientKit.m
//  HappyPerson
//
//  Created by wei on 15/11/12.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPVenderClientKit.h"
#import "HPRequestClient.h"

@implementation HPVenderClientKit

+(HPVenderClientKit *)sharedInstance
{
    static HPVenderClientKit *clientKit = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clientKit = [[HPVenderClientKit alloc] init];
    });
    return clientKit;
}

-(void)getFamousProduct:(NSString *)param success:(void (^)(NSArray *))success falure:(void (^)(NSError *))falure
{
    
}

@end
