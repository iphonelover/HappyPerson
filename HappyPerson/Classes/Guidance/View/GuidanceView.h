//
//  GuidanceView.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol GuidanceIntroViewDelegate <NSObject>

-(void)onDoneButtonPressed;

@end

@interface GuidanceView : UIView
@property(nonatomic, assign) id<GuidanceIntroViewDelegate> delegate;

@end
