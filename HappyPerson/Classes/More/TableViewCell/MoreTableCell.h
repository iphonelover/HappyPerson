//
//  MoreTableCell.h
//  HappyPerson
//
//  Created by wei on 16/1/26.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreTableCell : UITableViewCell

@property (nonatomic, strong) UILabel *cache;
-(void)setModel:(NSString *)info withSection:(NSInteger)sectionIndex withRow:(NSInteger)rowIndex;


@end
