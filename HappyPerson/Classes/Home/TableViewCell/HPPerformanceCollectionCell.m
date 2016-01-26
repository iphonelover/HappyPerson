//
//  HPPerformanceCollectionCell.m
//  HappyPerson
//
//  Created by wei on 16/1/14.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPPerformanceCollectionCell.h"
#import "HPPerformanceArrayModel.h"

@interface HPPerformanceCollectionCell ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *detail;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) HPPerformanceArrayModel *dataItem;

@end

@implementation HPPerformanceCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#f9f9f9"];
        [self cellLayout];
    }
    return self;
}

-(void)cellLayout
{
    _title = [UILabel new];
    _title.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    //    title0.text = model0.maintitle;
    _title.textAlignment = NSTextAlignmentCenter;
    //    title0.textColor = [UIColor colorWithHexString:model0.typeface_color];
    [self.contentView addSubview:_title];
    _detail = [UILabel new];
    _detail.textColor = [UIColor colorWithHexString:@"#b7b7b7"];
    _detail.font = [UIFont systemFontOfSize:10.f];
    _detail.textAlignment = NSTextAlignmentCenter;
    //    detail0.text = model0.deputytitle;
    [self.contentView addSubview:_detail];
    _imageView = [UIImageView new];
    //    NSString *imageURL = [model0.imageurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"80.0"];
    //    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    //    [imageView0 sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[HPAssistant imageWithContentsOfFile:@"bg_image_default"]];
    [self.contentView addSubview:_imageView];
    
    WS(ws);
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(ws).with.offset(10);
        make.right.equalTo(ws).with.offset(-10);
        make.bottom.equalTo(_detail.mas_top).with.offset(-2);
    }];
    
    [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(_title.mas_bottom).with.offset(2);
        make.right.equalTo(ws).with.offset(-10);
        make.bottom.equalTo(_imageView.mas_top).with.offset(-5);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(30);
        make.top.equalTo(_detail.mas_bottom).with.offset(5);
        make.right.equalTo(ws).with.offset(-30);
        make.bottom.equalTo(ws).with.offset(-20);
    }];
    
    
}

-(void)setModel:(id)item
{
    _dataItem = item;
    _title.text = _dataItem.maintitle;
    _title.textColor = [UIColor colorWithHexString:_dataItem.typeface_color];
    _detail.text = _dataItem.deputytitle;
    NSString *imageURL = [_dataItem.imageurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"80.0"];
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[HPAssistant imageWithContentsOfFile:@"bg_image_default"]];
    
    
}

@end
