//
//  HPUserNewTableCell.h
//  HappyPerson
//
//  Created by wei on 15/12/28.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UserNewTableCellBlock)(NSString *toURL);

@interface HPUserNewTableCell : UITableViewCell

@property (nonatomic, copy) UserNewTableCellBlock userNewTableCellBlock;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withArray:(NSMutableArray *)userNewArray;


@end
