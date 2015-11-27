//
//  HPBaseResponse.h
//  HappyPerson
//
//  Created by wei on 15/11/20.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPBaseResponse : NSObject

@property (nonatomic, copy) HPResponseSuccessBlock responseSuccessBlock;
@property (nonatomic, copy) HPResponseFailureBlock responseFailureBlock;
@property (nonatomic, copy) NSString *currentPage;
@property (nonatomic, strong) id responseData;

-(void)loadNetData;

@end
