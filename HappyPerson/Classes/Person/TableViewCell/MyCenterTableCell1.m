//
//  MyCenterTableCell1.m
//  HappyPerson
//
//  Created by wei on 16/1/18.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "MyCenterTableCell1.h"

@interface MyCenterTableCell1 ()

@property (nonatomic, strong) UIImageView *iv;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *filmSelectSeatLabel;
@property (nonatomic, strong) UILabel *lookFoot;
@property (nonatomic, strong) UIImageView *arrowImage;
@property (nonatomic, strong) NSDictionary *dicItem;

@end

@implementation MyCenterTableCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        icon_mine_comment
        _iv = [UIImageView new];
        UIImage *img = [HPAssistant imageWithContentsOfFile:@"icon_mine_comment"];
        _iv.image = img;
        [self.contentView addSubview:_iv];
        
        _title = [UILabel new];
        _title.text = @"团购订单";
        _title.textAlignment = NSTextAlignmentLeft;
        _title.font = [UIFont systemFontOfSize:15.f];
        _title.textColor = [UIColor colorWithHexString:@"#666666"];
        [self.contentView addSubview:_title];
        
        _filmSelectSeatLabel = [UILabel new];
        _filmSelectSeatLabel.text = @"电影选作";
        _filmSelectSeatLabel.textAlignment = NSTextAlignmentLeft;
        _filmSelectSeatLabel.textColor = [UIColor grayColor];
        _filmSelectSeatLabel.font = [UIFont systemFontOfSize:14.f];
        _filmSelectSeatLabel.hidden = YES;
        [self.contentView addSubview:_filmSelectSeatLabel];
        
        UILabel *lookFoot = [UILabel new];
        lookFoot.text = @"查看我的评论足记";
        lookFoot.hidden = YES;
        lookFoot.textAlignment = NSTextAlignmentRight;
        lookFoot.textColor = [UIColor lightGrayColor];
        lookFoot.font = [UIFont systemFontOfSize:14.f];
        [self.contentView addSubview:lookFoot];
        
        UIImageView *arrowImage = [UIImageView new];
        arrowImage.image = [HPAssistant imageWithContentsOfFile:@"icon_mine_accountViewRightArrow"];
        [self.contentView addSubview:arrowImage];
        
        WS(ws);
        [_iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(10);
            make.top.equalTo(ws).with.offset((45-img.size.height)/2);
            make.right.equalTo(_title.mas_left).with.offset(-10);
            make.height.equalTo(@34);
        }];
        
        
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_iv.mas_right).with.offset(10);
            make.top.equalTo(ws).with.offset(10);
            make.bottom.equalTo(ws).with.offset(-10);
            make.right.equalTo(_filmSelectSeatLabel.mas_left).with.offset(-10);
        }];
        
        [_filmSelectSeatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_title.mas_right).with.offset(10);
            make.right.equalTo(lookFoot.mas_left).with.offset(-10);
            make.top.equalTo(ws).with.offset(10);
            make.bottom.equalTo(ws).with.offset(-10);
        }];
        
        [lookFoot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_filmSelectSeatLabel.mas_right).with.offset(10);
            make.right.equalTo(arrowImage.mas_left).with.offset(-10);
            make.top.equalTo(ws).with.offset(10);
            make.bottom.equalTo(ws).with.offset(10);
        }];
        
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lookFoot.mas_right).with.offset(10);
            make.right.equalTo(lookFoot.mas_right).with.offset(-10);
            make.top.equalTo(ws).with.offset(10);
            make.bottom.equalTo(ws).with.offset(-10);
        }];
        
        
    }
    return self;
}

-(NSDictionary *)dicItem
{
    if (!_dicItem) {
        _dicItem = [NSDictionary dictionary];
    }
    return _dicItem;
}



-(void)setModel:(id)item
{
//    <key>img</key>
//    <key>title</key>
//    <key>filmorder</key>
//    <key>commonfoot</key>

    self.dicItem = item;
    _iv.image = [_dicItem objectForKey:@"img"];
    _title = [_dicItem objectForKey:@"title"];
    _filmSelectSeatLabel.text = [_dicItem objectForKey:@"filmorder"];
    _lookFoot.text = [_dicItem objectForKey:@"commonfoot"];
    
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
