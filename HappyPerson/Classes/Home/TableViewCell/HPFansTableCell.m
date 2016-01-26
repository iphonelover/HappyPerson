//
//  FansTableCell.m
//  HappyPerson
//
//  Created by wei on 16/1/11.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPFansTableCell.h"
#import "HPFansLifeArrayModel.h"

#define TagValue 50000

@interface HPFansTableCell ()

@property (nonatomic, strong) HPFansLifeArrayModel *fansItem;

@end

@implementation HPFansTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self fansLayout];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self.contentView addGestureRecognizer:tap];
    }
    return self;
}

-(void)tapView:(UITapGestureRecognizer *)gesture{
    if (self.fansBlock) {
        self.fansBlock(@"sss");
    }
}

-(void)fansLayout
{
//    UIView *fansView = [[UIView alloc] initWithFrame:self.frame];
    UIImageView *imageView = [UIImageView new];
    imageView.tag = TagValue+1;
    [self.contentView addSubview:imageView];
    
    UILabel *title = [UILabel new];
    title.tag = TagValue+2;
    title.text = @"美范儿，FUN式生活放肆美";
    title.textAlignment = NSTextAlignmentLeft;
    title.font = [UIFont systemFontOfSize:15.f];
//    title.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
    [self.contentView addSubview:title];
    
    UILabel *detail = [UILabel new];
    detail.tag = TagValue+3;
    detail.text = @"年度美食，新开张餐厅大赏";
    detail.textAlignment = NSTextAlignmentLeft;
    detail.font = [UIFont systemFontOfSize:10.f];
    detail.textColor = [UIColor colorWithHexString:@"#b7b7b7"];
    [self.contentView addSubview:detail];
    
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 140, kMainScreenWidth, 10)];
    
    UIView *footerView = [UIView new];
    footerView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    [self.contentView addSubview:footerView];
    
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.right.equalTo(ws).with.offset(-10);
        make.top.equalTo(ws).with.offset(10);
        make.bottom.equalTo(title.mas_top).with.offset(-5);
        make.height.mas_equalTo(CGSizeMake(kMainScreenWidth-20, 80));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.right.equalTo(ws).with.offset(-10);
        make.top.equalTo(imageView.mas_bottom).with.offset(5);
        make.bottom.equalTo(detail.mas_top).with.offset(-5);
    }];
    
    [detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(title.mas_bottom).with.offset(5);
//        make.bottom.equalTo(footerView.mas_top).with.offset(-5);
        make.right.equalTo(ws).with.offset(-10);
    }];
    
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
//        make.top.equalTo(detail.mas_bottom).with.offset(5);
        make.height.equalTo(@10);
    }];
}

-(void)setFrame:(CGRect)frame
{
    frame.size.width = kMainScreenWidth;
    NSLog(@"frame.size.width is %@",NSStringFromCGRect(frame));
    [super setFrame:frame];
}

-(void)setFansModel:(id)item
{
    _fansItem = item;
    UIImageView *imageView = (UIImageView *)[self.contentView viewWithTag:TagValue+1];
    NSString *imgURL = _fansItem.imageurl;
    NSString *fansURL = [imgURL stringByReplacingOccurrencesOfString:@"w.h" withString:[NSString stringWithFormat:@"%f.0",kMainScreenWidth-20]];
    [imageView sd_setImageWithURL:[NSURL URLWithString:fansURL] placeholderImage:nil];
    UILabel *title = (UILabel *)[self.contentView viewWithTag:TagValue+2];
    title.text = _fansItem.maintitle;
    title.textColor = [UIColor colorWithHexString:_fansItem.typeface_color];
    UILabel *detail = (UILabel *)[self.contentView viewWithTag:TagValue+3];
    detail.text = _fansItem.deputytitle;
    
}

@end
