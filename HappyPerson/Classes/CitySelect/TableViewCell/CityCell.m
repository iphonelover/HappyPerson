//
//  CityCell.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "CityCell.h"

@implementation CityCell
@synthesize arrayCities = _arrayCities;
@synthesize delegate = _delegate;
#pragma mark --
#pragma mark LifeStyle
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     }
    [self setBackgroundColor:[UIColor whiteColor]];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

#pragma mark --
#pragma mark Methords
/**
 *reference:refresh cell with data
 *parameters:object(LandTipItem instance)
 *return:null
 */
- (void)refreshWithData:(id)object isLocationCity:(BOOL)isLocationCity isSuccess:(BOOL)isSuccess
{
    if (!object||![object isKindOfClass:[NSArray class]]||self.arrayCities==object) return;
    
    self.arrayCities = object;
    _isLocation = isLocationCity;
    NSInteger j = 0;
    for (NSInteger i =0; i< _arrayCities.count; i++) {
        UIButton * tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
        NSInteger intTemp = 0;
        if (i!=0&&i%3==0) {
            j++;
        }
        if (i>=3) {
            intTemp = i%3;
        }
        else{
            intTemp = i;
        }
        NSString *cityName = [_arrayCities objectAtIndex:i];
        if (isSuccess == NO && !_isLocation) {
            tempButton.frame = CGRectMake(intTemp*100+10, j*50+10, 150, 38);
            [tempButton setTitle:NSLocalizedString(@"KeyLocationFail", nil) forState:UIControlStateNormal];
        }
        else{
            tempButton.frame = CGRectMake(intTemp*100+10, j*50+10, 85, 38);
            [tempButton setTitle:cityName forState:UIControlStateNormal];
        }
        [tempButton setBackgroundColor:[UIColor clearColor]];
        [tempButton setBackgroundImage:[UIImage imageNamed:@"city_normal_bg"] forState:UIControlStateNormal];
        [tempButton setBackgroundImage:[UIImage imageNamed:@"city_selected_bg"] forState:UIControlStateSelected];
        [tempButton setBackgroundImage:[UIImage imageNamed:@"city_selected_bg"] forState:UIControlStateHighlighted];
        [tempButton setTitleColor:[UIColor colorWithHexString:@"5e5e5e" ] forState:UIControlStateNormal];
        [tempButton setTitleColor:[UIColor colorWithHexString:@"ff6c00" ] forState:UIControlStateSelected];
        [tempButton setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [tempButton.titleLabel setFont: [UIFont systemFontOfSize:14]];
        [tempButton setTag:i];
        
        [tempButton addTarget:self action:@selector(touchEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:tempButton];
    }
    self.frame = CGRectMake(0, 0, 300, 50*(j+1));
}


#pragma mark --
#pragma mark Methords
/**
 *reference:refresh cell with data
 *parameters:object(LandTipItem instance)
 *return:null
 */

- (void)touchEvent:(id)sender
{
    UIButton *cityButton = (UIButton*)sender;
    NSInteger index = cityButton.tag;
    
//    if (!ApplicationDelegate.locationYES) {
//        [MYProgressHUD showTextHUD:@"请选择城市" view:[UIView getKeyWindow]];
//    }else{
    
//    _isLocation = ApplicationDelegate.locationYES;
    
    _isLocation = ApplicationDelegate.locationYES;
    if ([_delegate respondsToSelector:@selector(clickSpecialCityItem:isLocationCity:)]) {
        [self.delegate clickSpecialCityItem:[_arrayCities objectAtIndex:index] isLocationCity:_isLocation];
    }
//    }
    
}

@end
