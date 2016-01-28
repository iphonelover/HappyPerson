//
//  HPRequestClient.m
//  HappyPerson
//
//  Created by wei on 15/11/12.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPRequestClient.h"

@implementation HPRequestClient


-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        [self.requestSerializer setTimeoutInterval:40];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
        NSStringEncoding gbk = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
        self.responseSerializer.stringEncoding = gbk;
    }
    return self;
}

@end
