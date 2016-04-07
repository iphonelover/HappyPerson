//
//  HPSessionClient.h
//  HappyPerson
//
//  Created by wei on 15/12/1.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface HPSessionClient : AFHTTPSessionManager

+ (HPSessionClient *)sharedClient;

@end
