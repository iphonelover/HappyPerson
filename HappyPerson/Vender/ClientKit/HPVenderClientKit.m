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

#import "HPSessionClient.h"

@implementation HPVenderClientKit

+(HPVenderClientKit *)sharedInstance
{
    static HPVenderClientKit *clientKitInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        clientKitInstance = [[self alloc] init];
    });
    return clientKitInstance;
}
/*!
 *    @brief  HPRequestClient请求方式
 *
 *    @param param   <#param description#>
 *    @param page    <#page description#>
 *    @param success <#success description#>
 *    @param failure <#failure description#>
 *
 *    @since <#version number#>
 */
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
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [requestClient GET:urlStr parameters:nil success:successBlock failure:failureBlock];
    
}
 

/*!
 *    @brief  AFHTTPSessionManager请求方式
 *
 *    @param param   <#param description#>
 *    @param page    <#page description#>
 *    @param success <#success description#>
 *    @param failure <#failure description#>
 *
 *    @since <#version number#>
 
-(void)getFamousProduct:(NSString *)param withPage:(NSString *)page success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure{
    NSMutableDictionary *paramFamous = [NSMutableDictionary dictionary];
    
    [NSString emptyStringConvert:&param];
    [paramFamous setObject:param forKey:@"paramFamous"];
    
    HPSessionClient *sessionClient = [[HPSessionClient alloc] init];
    
    HPSessionSuccessBlock sessionSuccessBlock = ^(NSURLSessionDataTask *task, id responseObject){
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
    HPSessionFailureBlock sessionFailureBlock = ^(NSURLSessionDataTask *task,NSError *error){
        failure(error);
    };
    
    NSString *url = [[HPRequestURL sharedInstance] famousProductURL];
    [sessionClient GET:url parameters:nil success:sessionSuccessBlock failure:sessionFailureBlock];
    
    
}
 */


-(void)getUserNewPreference:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    
    [NSString emptyStringConvert:&param];
    [paramsDic setObject:param forKey:@"params1"];
    
    HPRequestClient *requestClient = [[HPRequestClient alloc] init];
    HPSuccessBlock successBlock = ^(AFHTTPRequestOperation *operation,id responseObject){
        NSError *error;
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            if (!error) {
                NSArray *dataDic = [responseObject objectForKey:@"data"];
                success(dataDic);
            }else{
                failure(error);
            }
        }
    };
    
    HPFailureBlock failureBlock = ^(AFHTTPRequestOperation *operation,NSError *error){
        failure(error);
    };
    NSString *url = [[HPRequestURL sharedInstance] userNewPreferenceURL];
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [requestClient GET:urlStr parameters:nil success:successBlock failure:failureBlock];
}

-(void)getFanLife:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    
    [NSString emptyStringConvert:&param];
    [paramsDic setObject:param forKey:@"params1"];
    
    HPRequestClient *requestClient = [[HPRequestClient alloc] init];
    HPSuccessBlock successBlock = ^(AFHTTPRequestOperation *operation,id responseObject){
        NSError *error;
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            if (!error) {
                NSArray *dataDic = [[responseObject objectForKey:@"data"] objectForKey:@"topics"];
                success(dataDic);
            }else{
                failure(error);
            }
        }
    };
    
    HPFailureBlock failureBlock = ^(AFHTTPRequestOperation *operation,NSError *error){
        failure(error);
    };
    NSString *url = [[HPRequestURL sharedInstance] fanLifeURL];
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [requestClient GET:urlStr parameters:nil success:successBlock failure:failureBlock];
}

-(void)getPerformance:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    
    [NSString emptyStringConvert:&param];
    [paramsDic setObject:param forKey:@"params1"];
    
    HPRequestClient *requestClient = [[HPRequestClient alloc] init];
    HPSuccessBlock successBlock = ^(AFHTTPRequestOperation *operation,id responseObject){
        NSError *error;
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            if (!error) {
                NSArray *dataDic = [[responseObject objectForKey:@"data"] objectForKey:@"topics"];
                success(dataDic);
            }else{
                failure(error);
            }
        }
    };
    
    HPFailureBlock failureBlock = ^(AFHTTPRequestOperation *operation,NSError *error){
        failure(error);
    };
    NSString *url = [[HPRequestURL sharedInstance] performanceURL];
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [requestClient GET:urlStr parameters:nil success:successBlock failure:failureBlock];
}

-(void)getHotLine:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    
    [NSString emptyStringConvert:&param];
    [paramsDic setObject:param forKey:@"params1"];
    
    HPRequestClient *requestClient = [[HPRequestClient alloc] init];
    HPSuccessBlock successBlock = ^(AFHTTPRequestOperation *operation,id responseObject){
        NSError *error;
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            if (!error) {
                NSArray *dataDic = [responseObject objectForKey:@"data"];
                success(dataDic);
            }else{
                failure(error);
            }
        }
    };
    
    HPFailureBlock failureBlock = ^(AFHTTPRequestOperation *operation,NSError *error){
        failure(error);
    };
    NSString *url = [[HPRequestURL sharedInstance] hotLineUpURL];
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [requestClient GET:urlStr parameters:nil success:successBlock failure:failureBlock];
}

-(void)getRecommand:(NSString *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    
    [NSString emptyStringConvert:&param];
    [paramsDic setObject:param forKey:@"params1"];
    
    HPRequestClient *requestClient = [[HPRequestClient alloc] init];
    HPSuccessBlock successBlock = ^(AFHTTPRequestOperation *operation,id responseObject){
        NSError *error;
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            if (!error) {
                NSArray *dataDic = [responseObject objectForKey:@"data"];
                success(dataDic);
            }else{
                failure(error);
            }
        }
    };
    
    HPFailureBlock failureBlock = ^(AFHTTPRequestOperation *operation,NSError *error){
        failure(error);
    };
    NSString *url = [[HPRequestURL sharedInstance] recommandURL];
    NSString *urlStr = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    [requestClient GET:urlStr parameters:nil success:successBlock failure:failureBlock];
}
@end
