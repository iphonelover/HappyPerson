//
//  CityListViewController.h
//  CityList
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^SelectCityName)(NSString *);

@protocol CitySelectDelegate <NSObject>


@end

@interface CitySelectViewController : CustomViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *cities;

@property (nonatomic, strong) NSMutableArray *keys; //城市首字母
@property (nonatomic, strong) NSMutableArray *arrayCitys;   //城市数据
@property (nonatomic, strong) NSMutableArray *arrayHotCity;
@property (nonatomic, strong) NSMutableArray *arrayGPSCity;

@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) NSString *gpsCity;
@property (nonatomic,strong) NSString* localCityName;

@property(nonatomic,assign)id<CitySelectDelegate>delegate;

@property (nonatomic, copy) SelectCityName selectCityName;



-(id)initWithLocalCityName:(NSString *)cityName;
@end
