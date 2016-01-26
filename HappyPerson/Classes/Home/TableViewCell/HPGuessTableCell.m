//
//  HPGuessTableCell.m
//  HappyPerson
//
//  Created by wei on 16/1/13.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPGuessTableCell.h"

@implementation HPGuessTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        UILabel *guessLabel = [UILabel new];
        guessLabel.text = @"猜你喜欢";
        guessLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        guessLabel.textAlignment = NSTextAlignmentLeft;
        guessLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13.f];
        [self.contentView addSubview:guessLabel];
        
        
        UIView *seperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, 34, kMainScreenWidth, 1)];
        seperateLine.backgroundColor = [UIColor colorWithHexString:@"e0e0df"];
        [self.contentView addSubview:seperateLine];
        WS(ws);
        [guessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(10);
            make.top.equalTo(ws).with.offset(10);
            make.bottom.equalTo(seperateLine.mas_top).with.offset(-10);
            make.right.equalTo(ws).with.offset(0);
        }];
        
//        [seperateLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(ws).with.offset(0);
//            make.right.equalTo(ws).with.offset(0);
////            make.top.equalTo(guessLabel.mas_bottom).with.offset(10);
//            make.height.mas_equalTo(@1);
//            make.bottom.equalTo(ws).with.offset(0);
//        }];
        
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
