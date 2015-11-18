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

-(void)getFamousProduct:(NSString *)param success:(void (^)(NSArray *items)) success falure:(void(^)(NSError *error)) falure;

@end
