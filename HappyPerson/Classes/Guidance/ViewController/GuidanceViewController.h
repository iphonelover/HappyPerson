//
//  GuidanceViewController.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface GuidanceViewController : UIViewController

@property (nonatomic, strong) NSArray *images;


+(id)guidanceWithModels:(NSArray *)guidanceModels enterBlock:enterBlock;

@end
