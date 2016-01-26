//
//  MyCenterTableCell0.m
//  HappyPerson
//
//  Created by wei on 16/1/15.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "MyCenterTableCell0.h"

@implementation MyCenterTableCell0

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth/2, 60)];
        [self.contentView addSubview:leftView];
        UIImageView *leftIV = [UIImageView new];
        [leftView addSubview:leftIV];
        UILabel *leftLabel = [UILabel new];
        leftLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        leftLabel.textAlignment = NSTextAlignmentLeft;
        leftLabel.text = @"美团券";
        [leftView addSubview:leftLabel];
        
        UIImage *quanImg = [HPAssistant imageWithContentsOfFile:@"icon_tabbar_merchant_normal"];
        [leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftView).with.offset(20);
            make.top.equalTo(leftView).with.offset((60-quanImg.size.height)/2);
            make.size.mas_equalTo(CGSizeMake(quanImg.size.width, quanImg.size.height));
        }];
        
        [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftIV.mas_right).with.offset(25);
            make.top.equalTo(leftView).with.offset(40);
            make.right.equalTo(leftView).with.offset(-20);
            make.bottom.equalTo(leftView).with.offset(-40);;
        }];
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(kMainScreenWidth/2, 0, kMainScreenWidth/2, 60)];
        [self.contentView addSubview:rightView];
        UIImageView *rightIV = [UIImageView new];
        [rightView addSubview:rightIV];
        
        UILabel *rightLabel = [UILabel new];
        rightLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        rightLabel.text = @"我的收藏";
        rightLabel.textAlignment = NSTextAlignmentLeft;
        [rightView addSubview:rightLabel];
        
        UILabel *num = [UILabel new];
        num.text = @"3";;
        num.textColor = [UIColor colorWithHexString:@"#666666"];
        [rightView addSubview:num];
        
        [rightIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(rightView).with.offset(20);
            make.top.equalTo(rightView).with.offset((60-quanImg.size.height)/2);
            make.size.mas_equalTo(CGSizeMake(quanImg.size.width, quanImg.size.height));
        }];
        
        [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(rightIV.mas_right).with.offset(25);
            make.top.equalTo(rightView).with.offset(40);
            make.right.equalTo(rightView).with.offset(-20);
            make.bottom.equalTo(num.mas_top).with.offset(-10);;
        }];
        
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(rightIV.mas_right).with.offset(40);
            make.right.equalTo(rightView).with.offset(-40);
            make.top.equalTo(rightLabel.mas_bottom).with.offset(10);
            make.bottom.equalTo(rightView).with.offset(20);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
