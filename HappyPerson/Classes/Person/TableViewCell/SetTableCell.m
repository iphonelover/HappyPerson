//
//  SetTableCell.m
//  HappyPerson
//
//  Created by wei on 15/10/24.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "SetTableCell.h"

@interface SetTableCell ()
{
    UIImageView *_setSubIV;
    UILabel *_setSubLabel;
    UIView *_setSubLine;
}

@end

@implementation SetTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        _setSubIV = [UIImageView new];
        [self.contentView addSubview:_setSubIV];
        _setSubLabel = [UILabel new];
        _setSubLabel.font = [UIFont systemFontOfSize:14];
        _setSubLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_setSubLabel];
        _setSubLine = [UIView new];
        _setSubLine.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_setSubLine];
        WS(ws);
        [_setSubIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.contentView.mas_left).with.offset(20);
            make.right.equalTo(_setSubLabel.mas_left).with.offset(-30);
            make.top.equalTo(ws.contentView.mas_top).with.offset(10);
            make.bottom.equalTo(_setSubLine.mas_top).with.offset(-10);
        }];
        [_setSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_setSubIV.mas_right).with.offset(30);
            make.right.equalTo(ws.contentView.mas_right).with.offset(-30);
            make.top.equalTo(ws.contentView.mas_top).with.offset(10);
            make.bottom.equalTo(_setSubLine.mas_top).with.offset(-10);
        }];
        [_setSubLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.contentView.mas_left).with.offset(0);
            make.right.equalTo(ws.contentView.mas_right).with.offset(0);
            make.top.equalTo(_setSubIV.mas_bottom).with.offset(2);
            make.bottom.equalTo(ws.contentView.mas_bottom).with.offset(0);
            make.height.mas_equalTo(@1);
        }];
        
    }
    return self;
}

-(void)setModel:(NSString *)info
{
    NSArray *arrayModel = [info componentsSeparatedByString:@" "];
    UIImage *image = [UIImage imageNamed:[arrayModel objectAtIndex:1]];
    _setSubIV.image = image;
    [_setSubIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(image.size.width, image.size.height));
        [super updateConstraints];
    }];
    _setSubLabel.text = [arrayModel objectAtIndex:0];
    [self.contentView setNeedsDisplay];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
