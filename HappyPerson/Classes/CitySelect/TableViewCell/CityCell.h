//
//  CityCell.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//


#import <UIKit/UIKit.h>
@protocol CityCellDelegate<NSObject>

@optional
-(void)clickSpecialCityItem:(NSString*)selectedCityName isLocationCity:(BOOL)isLocationCity;

@end
@interface CityCell : UITableViewCell
{
    NSMutableArray *_arrayCities;
    BOOL _isLocation;
}
- (void)refreshWithData:(id)object isLocationCity:(BOOL)isLocationCity isSuccess:(BOOL)isSuccess;
@property (nonatomic, copy) NSMutableArray *arrayCities;
@property (nonatomic, assign) id<CityCellDelegate> delegate;
@end
