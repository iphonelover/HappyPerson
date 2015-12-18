//
//  HPVenderClientKit.h
//  HappyPerson
//
//  Created by wei on 15/11/12.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPVenderClientKit : NSObject

+(HPVenderClientKit *)sharedInstance;

-(void)getFamousProduct:(NSString *)param withPage:(NSString *)page success:(void (^)(NSDictionary *famousItems))success failure:(void(^)(NSError *error))failure;


-(void)getUserNewPreference:(NSString *)param success:(void(^)(NSArray *preferenceItems))success failure:(void(^)(NSError * error))failure;

-(void)getFanLife:(NSString *)param success:(void(^)(NSDictionary *fanLifeItems))success failure:(void(^)(NSError *error))failure;

-(void)getPreformance:(NSString *)param success:(void(^)(NSDictionary *performanceItems))success failure:(void(^)(NSError *error))failure;

-(void)getHotLine:(NSString *)param success:(void(^)(NSArray *hotlineItems))success failure:(void(^)(NSError *error))failure;

-(void)getRecommand:(NSString *)param success:(void(^)(NSArray *recommandItems))success failure:(void(^)(NSError *error))failure;
@end
