//
//  HPPerformanceTableCell.h
//  HappyPerson
//
//  Created by wei on 16/1/12.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^CollectionCellBlock)(NSString *toURL);
@interface HPPerformanceTableCell : UITableViewCell

@property (nonatomic, copy)CollectionCellBlock collectionCellBlock;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withArray:(NSMutableArray *)array;


@end
