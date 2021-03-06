//
//  HPFamousTableCell.h
//  HappyPerson
//
//  Created by wei on 15/11/11.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackgroundClickBlock)();

@interface HPFamousTableCell : UITableViewCell
@property (nonatomic, copy) BackgroundClickBlock backgroundClickBlock;

+(instancetype)cellWithTableView:(UITableView *)tableView;

-(void)setModel:(id)item;


@end
