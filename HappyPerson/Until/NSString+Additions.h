//
//  NSString+Additions.h
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2014 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

+ (void)emptyStringConvert:(NSString **)string;

- (BOOL)isEmpty;

- (NSString *)intervalDayFromNow;

+ (NSString *)serializeURL:(NSString *)baseURL params:(NSDictionary *)params;

+ (NSMutableDictionary *) explodeQueryStringToDictionary:(NSString *) queryString;

- (NSUInteger)getWeiboTextLength;

+ (NSString *)urlEnCode:(NSString *)url;

- (NSString *) MD5String;

@end
