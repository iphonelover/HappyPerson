//
//  HPRequestURL.h
//  HappyPerson
//
//  Created by wei on 15/11/20.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPRequestURL : NSObject

+(HPRequestURL *)sharedInstance;

-(NSString *)famousProductURL;

-(NSString *)userNewPreferenceURL;

-(NSString *)fanLifeURL;

-(NSString *)performanceURL;

-(NSString *)hotLineUpURL;

-(NSString *)recommandURL;


@end
