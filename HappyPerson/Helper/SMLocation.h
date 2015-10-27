//
//  SMLocation.h
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocationManager.h>

@protocol SMLocationDelegate <NSObject>

-(void)getLocationSuccess:(BOOL)successed withLongitude:(CGFloat)lon withLatitude:(CGFloat)lat;

-(void)getCityNameSuccess:(BOOL)successed withCityName:(NSString *)cityNAME withLocation:(CLLocation *)location;

@end


@interface SMLocation : NSObject<CLLocationManagerDelegate>{
}


/**
 *  地图实例
 */
//@property (nonatomic, strong) MAMapView *mapView;
//
///**
// *  搜索实例
// */
//@property (nonatomic, strong) AMapSearchAPI *searchApi;
//

@property (nonatomic,assign) id<SMLocationDelegate> delegate;



-(id)init:(id)delegate;

+ (BOOL)locationEnable;

@end
