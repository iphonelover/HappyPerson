//
//  MYCollectionViewCell.h
//  HappyPerson
//
//  Created by wei on 15/7/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *labelName;

-(NSString *)getModelItem;

-(void)setModelItem:(NSString *)item;

@end
