//
//  HPFansTableCell.h
//  HappyPerson
//
//  Created by wei on 16/1/11.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FansBlock)(NSString *toURL);

@interface HPFansTableCell : UITableViewCell

@property (nonatomic, copy) FansBlock fansBlock;

-(void)setFansModel:(id)item;

@end
