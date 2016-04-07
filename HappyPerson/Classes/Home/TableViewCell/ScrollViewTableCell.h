//
//  ScrollViewTableCell.h
//  HappyPerson
//
//  Created by wei on 15/11/9.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)(NSInteger tagValue);

@interface ScrollViewTableCell : UITableViewCell

@property(nonatomic,copy) ButtonClickBlock buttonClickBlock;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withPlist:(NSArray *)imgAndTitleArray;


@end
