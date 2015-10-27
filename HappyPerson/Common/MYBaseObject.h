//
//  MYBaserObject.h
//  HappyPerson
//
//  Created by wei on 15/7/26.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MTLModel.h"

@interface MYBaseObject : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy) NSString *status;

@end
