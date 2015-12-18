//
//  HPSessionClient.m
//  HappyPerson
//
//  Created by wei on 15/12/1.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPSessionClient.h"

@implementation HPSessionClient

+ (HPSessionClient *)sharedClient {
    static HPSessionClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //前缀都一样时，可以将前缀写在这里,并且初始化的时候调用这个单例即可
        NSURL *baseURL = [NSURL URLWithString:@"http://api.meituan.com/"];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"TuneStore iOS 1.0"}];
        
        
        //设置我们的缓存大小 其中内存缓存大小设置10M  磁盘缓存5M
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                          diskPath:nil];
        
        [config setURLCache:cache];
        
        _sharedClient = [[HPSessionClient alloc] initWithBaseURL:baseURL
                                         sessionConfiguration:config];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return _sharedClient;
}


-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        [self.requestSerializer setTimeoutInterval:40];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    }
    
    return self;
}

@end
