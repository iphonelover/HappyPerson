//
//  HPFamousModel.h
//  HappyPerson
//
//  Created by wei on 15/11/20.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HPFamousModel : NSObject
@property (nonatomic, strong) NSNumber *listJumpToTouch;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSMutableArray *deals;
@property (nonatomic, strong) NSString *touchUrlForList;
@property (nonatomic, strong) NSNumber *famousID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *activityImgUrl;
@property (nonatomic, strong) NSMutableArray *share;
@property (nonatomic, strong) NSString *countdownText;
@property (nonatomic, strong) NSNumber *isShowTimeCountdown;
@property (nonatomic, strong) NSNumber *start;
@property (nonatomic, strong) NSString *descBefore;
@property (nonatomic, strong) NSString *descIn;
@property (nonatomic, strong) NSNumber *end;
@property (nonatomic, strong) NSNumber *isShowCateDesc;
@property (nonatomic, strong) NSString *descAfter;

@end
