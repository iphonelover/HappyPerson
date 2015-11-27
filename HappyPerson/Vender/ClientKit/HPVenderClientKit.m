//
//  HPVenderClientKit.m
//  HappyPerson
//
//  Created by wei on 15/11/12.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPVenderClientKit.h"
#import "HPRequestClient.h"
#import "HPRequestURL.h"
#import "NSString+Additions.h"
#import "HPFamousModel.h"

@implementation HPVenderClientKit

+(HPVenderClientKit *)sharedInstance
{
    static HPVenderClientKit *clientKitInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clientKitInstance = [[HPVenderClientKit alloc] init];
    });
    return clientKitInstance;
}

-(void)getFamousProduct:(NSString *)param withPage:(NSString *)page success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *paramsDic =  [NSMutableDictionary dictionary];

    [NSString emptyStringConvert:&param];
    [paramsDic setObject:param forKey:@"video_id"];
    
    [NSString emptyStringConvert:&page];
    [paramsDic setObject:page forKey:@"page"];
    
    
    HPRequestClient *requestClient = [[HPRequestClient alloc]init];
    HPSuccessBlock successBlock = ^(AFHTTPRequestOperation *operation, id responseObject){
        NSError *error;
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            if (!error) {
                NSDictionary *dataDic = [responseObject objectForKey:@"data"];
                success(dataDic);
            }else{
                failure(error);
            }
        }
    };
    HPFailureBlock failureBlock = ^(AFHTTPRequestOperation *operation, NSError *error){
        failure(error);
    };
    
    NSString *url = [[HPRequestURL sharedInstance] famousProductURL];
    [requestClient GET:url parameters:nil success:successBlock failure:failureBlock];
    
}

-(void)getUserNewPreference:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    
}

-(void)getFanLife:(NSString *)param success:(void (^)(NSArray *))success failure:(id)failure
{
    
}

-(void)getPreformance:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    
}

-(void)getHotLine:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    
}

-(void)getRecommand:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    
}
@end
