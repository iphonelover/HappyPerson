//
//  MyCenterTableCell.h
//  HappyPerson
//
//  Created by wei on 15/7/28.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellContentViewHeight 44.f

@interface MyCenterTableCell : UITableViewCell

-(void)setModel:(NSString *)info;
-(NSString *)getInfo;

@end
