//
//  HPRecommandTableCell.m
//  HappyPerson
//
//  Created by wei on 16/1/13.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPRecommandTableCell.h"
#import "HPRecommandModel.h"

#define CellTag 50000

@interface HPRecommandTableCell ()

@property (nonatomic, strong) UIImageView *shopIV;
@property (nonatomic, strong) UIImageView *noIdealIV;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *detail;
@property (nonatomic, strong) UILabel *price;
@property (nonatomic, strong) UILabel *oldPrice;
@property (nonatomic, strong) UILabel *distance;
@property (nonatomic, strong) UILabel *sale;
@property (nonatomic, strong) UIView *seperateLine;

@end

@implementation HPRecommandTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        
        [self recommandLayout];
    }
    return self;
}

-(void)recommandLayout
{
    _shopIV = [UIImageView new];
    [self.contentView addSubview:_shopIV];
    
    _noIdealIV = [UIImageView new];
    _noIdealIV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_noIdealIV];
    
    _title = [UILabel new];
    _title.font = [UIFont fontWithName:@"Helvetica" size:17.f];
    _title.textColor = [UIColor colorWithHexString:@"#353535"];
    [self.contentView addSubview:_title];
    
    _detail = [UILabel new];
    _detail.font = [UIFont systemFontOfSize:10.f];
    _detail.textColor = [UIColor colorWithHexString:@"#999999"];
    [self.contentView addSubview:_detail];
    
    _price = [UILabel new];
    _price.textColor = [UIColor colorWithHexString:@"#33b8ac"];
    [self.contentView addSubview:_price];
    
    _oldPrice = [UILabel new];
    _oldPrice.textColor = [UIColor colorWithHexString:@"#999999"];
    _oldPrice.font = [UIFont systemFontOfSize:10.f];
    _oldPrice.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_oldPrice];
    
    _distance = [UILabel new];
    _distance.textColor = [UIColor colorWithHexString:@"#999999"];
    _distance.font = [UIFont systemFontOfSize:10.f];
    [self.contentView addSubview:_distance];
    
    _sale = [UILabel new];
    _sale.textColor = [UIColor colorWithHexString:@"#999999"];
    _sale.font = [UIFont systemFontOfSize:10.f];
    [self.contentView addSubview:_sale];
    
    _seperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, 99, kMainScreenWidth, 1)];
    _seperateLine.backgroundColor = [UIColor colorWithHexString:@"e0e0df"];
    [self.contentView addSubview:_seperateLine];

    WS(ws);
    [_shopIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(ws).with.offset(10);
        make.bottom.equalTo(ws).with.offset(-10);
        make.right.equalTo(_title.mas_left).with.offset(-10);
        make.width.mas_equalTo(@100);
    }];
    
    [_noIdealIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(ws).with.offset(10);
        make.height.mas_equalTo(@40);
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shopIV.mas_right).with.offset(10);
        make.top.equalTo(ws).with.offset(10);
        make.bottom.equalTo(_detail.mas_top).with.offset(-10);
        make.right.equalTo(_distance.mas_left).with.offset(-10);
    }];
    
    [_distance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_title.mas_right).with.offset(10);
        make.top.equalTo(ws).with.offset(10);
        make.right.equalTo(ws).with.offset(-10);
        make.bottom.equalTo(_detail.mas_top).with.offset(-10);
    }];
    
    [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shopIV.mas_right).with.offset(10);
        make.top.equalTo(_title.mas_bottom).with.offset(10);
        make.bottom.equalTo(_price.mas_top).with.offset(-10);
        make.right.equalTo(ws).with.offset(-10);
    }];
    
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_shopIV.mas_right).with.offset(10);
        make.top.equalTo(_detail.mas_bottom).with.offset(10);
        make.bottom.equalTo(ws).with.offset(-10);
        make.right.equalTo(_oldPrice.mas_left).with.offset(-10);
    }];
    
    [_oldPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_price.mas_right).with.offset(10);
        make.top.equalTo(_detail.mas_bottom).with.offset(10);
//        make.right.equalTo(_sale.mas_left).with.offset(-10);
        make.bottom.equalTo(ws).with.offset(-10);
    }];
    
    [_sale mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_oldPrice.mas_right).with.offset(10);
        make.top.equalTo(_detail.mas_bottom).with.offset(10);
        make.right.equalTo(ws).with.offset(-10);
        make.bottom.equalTo(ws).with.offset(-10);
    }];
    
    
    
}

-(void)setModel:(id)item
{
    HPRecommandModel *model = item;
    if ([[model.nobooking stringValue] isEqualToString:@"1"]) {
        _noIdealIV.image = [HPAssistant imageWithContentsOfFile:@"ic_deal_noBooking"];
        
    }else{
        _noIdealIV.hidden = YES;
    }
    
    NSString *imageURL = [model.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
//    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    [_shopIV sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:nil];
    _title.text = model.brandname;
    _detail.text = [NSString stringWithFormat:@"[%@]%@",model.range,model.mtitle];
    if ([model.canbuyprice stringValue]) {
        _oldPrice.layer.borderColor = [UIColor colorWithHexString:@"#f58300"].CGColor;
        _oldPrice.layer.borderWidth = 1.f;
        _oldPrice.textColor = [UIColor colorWithHexString:@"#f59300"];
        if ([model.canbuyprice integerValue]==1) {
            _oldPrice.text = [NSString stringWithFormat:@"%@元抢",[model.canbuyprice stringValue]];
            _price.text = [model.price stringValue];
        }else{
            _price.text = [model.canbuyprice stringValue];
            _oldPrice.text = [NSString stringWithFormat:@"立减%ld",[model.price integerValue]-[model.canbuyprice integerValue]];
        }
    }else{
        _oldPrice.layer.borderColor = [UIColor colorWithHexString:@"#ffffff"].CGColor;
        _oldPrice.layer.borderWidth = 0.f;

        NSString *oldStr = [NSString stringWithFormat:@"%@元",model.price];
        _price.text = @"20元";
        //中划线
        
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oldStr attributes:attribtDic];
        
        _oldPrice.attributedText = attribtStr;
        _oldPrice.textColor = [UIColor colorWithHexString:@"#999999"];


    }
    

    [self setNeedsDisplay];

}


@end
