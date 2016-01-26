//
//  HPUserNewCollectionCell.m
//  HappyPerson
//
//  Created by wei on 16/1/10.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPUserNewCollectionCell.h"
#import "HPUserNewArraysModel.h"

@interface HPUserNewCollectionCell ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *detail;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) HPUserNewArraysModel *dataModel;

@end

@implementation HPUserNewCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self collectionCellLayout];
    }
    return self;
}

-(void)collectionCellLayout
{
    _title = [UILabel new];
//    _title.font = [UIFont systemFontOfSize:20.f];

    [self.contentView addSubview:_title];
    
    _detail = [UILabel new];
    _detail.font = [UIFont systemFontOfSize:10.f];
    _detail.textColor = [UIColor colorWithHexString:@"#b7b7b7"];
    [self.contentView addSubview:_detail];
    
    _imageView = [UIImageView new];
    [self.contentView addSubview:_imageView];
    
    
    WS(ws)
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(ws).with.offset(20);
        make.bottom.equalTo(_detail.mas_top).with.offset(-5);
//        make.right.equalTo(_imageView.mas_left).with.offset(-10);
    }];
    
    [_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(10);
        make.top.equalTo(_title.mas_bottom).with.offset(5);
        make.bottom.equalTo(ws).with.offset(-20);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_title.mas_right).with.offset(10);
        make.right.equalTo(ws).with.offset(-10);
    }];
}


-(void)setModel:(id)item withRow:(NSInteger)rowId
{
    _dataModel = item;
    
    
    _title.text = _dataModel.maintitle;
    _title.textColor = [UIColor colorWithHexString:_dataModel.typeface_color];
    
    _detail.text = _dataModel.deputytitle;
    
//    NSString *imageURL = [_dataModel.imageurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"120.0"];
//    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
//    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[HPAssistant imageWithContentsOfFile:@"bg_image_default"]];
    WS(ws)
    
    if (rowId == 0) {
        
        NSString *imageURL = [_dataModel.imageurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
        UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[HPAssistant imageWithContentsOfFile:@"bg_image_default"]];
        _title.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.f];

        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws).with.offset(5);
//            make.bottom.equalTo(ws).with.offset(-5);
            make.size.mas_equalTo(CGSizeMake(img.size.width, img.size.height));
        }];
    }else{
        
        NSString *imageURL = [_dataModel.imageurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"120.0"];
        [_imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:[HPAssistant imageWithContentsOfFile:@"bg_image_default"]];
        _title.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.f];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws).with.offset(10);
            make.bottom.equalTo(ws).with.offset(-10);
            make.size.mas_equalTo(CGSizeMake(60,60));
        }];
    }
    
    
    NSLog(@"imageView.frame is %@",NSStringFromCGRect(self.contentView.frame));
}

@end
