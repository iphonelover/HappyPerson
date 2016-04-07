//
//  SMLocation.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "SMLocation.h"


@interface SMLocation ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *positionCity;

@end

@implementation SMLocation


#pragma mark - CLLocationManager

-(id)init:(id)delegate
{
    if (self = [super init]) {
        _delegate = delegate;
        [self startLocationManger];
    }
    
    return self;
}

//是否支持定位
+ (BOOL)locationEnable
{
    return [CLLocationManager locationServicesEnabled];
}

//使用CLLocationManager定位
- (void)startLocationManger
{
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        if(_locationManager == nil){
            _locationManager = [[CLLocationManager alloc] init];
            [_locationManager setDelegate:self];
            //        _locationManager.distanceFilter = 100;
            [_locationManager requestAlwaysAuthorization];        //NSLocationAlwaysUsageDescription
            [_locationManager requestWhenInUseAuthorization];
            
            [self.locationManager startUpdatingLocation];
            
            //        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        }

    }
    
    
}


#pragma  mark - CLLocationManagerDelegate
////
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
//    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LOCATION_GET_RESULT object:newLocation];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            //获取城市
            _city = placemark.locality;
            if (!_city) {
                _city = [[placemark.administrativeArea substringToIndex:1] substringToIndex:2];
                _positionCity = _city;
            }
            //            city = @"廊坊市";
            NSRange range = [_city rangeOfString:@"市"];

            _positionCity = [_city substringToIndex:range.location];
            
//            [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_LOCATION_INFO_GET_CITYNAME
//                                                                object:nil];
//            [self refreshLocationCityCell];

            if ([_delegate respondsToSelector:@selector(getCityNameSuccess:withCityName:withLocation:)]) {
                [_delegate getCityNameSuccess:YES withCityName:_positionCity withLocation:newLocation];
            }
        }
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([_delegate respondsToSelector:@selector(getCityNameSuccess:withCityName:withLocation:)]) {
        [_delegate getCityNameSuccess:NO withCityName:@"定位失败" withLocation:nil];
    }
}




////
////
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:{
            NSLog(@"Got authorization, start tracking location");
            [self startTrackingLocation];

//            CitySelectViewController *cityVC = [[CitySelectViewController alloc] init];
//            [ApplicationDelegate.rootNavController pushViewController:cityVC animated:YES];
            break;
        }
        case kCLAuthorizationStatusNotDetermined:
            [_locationManager requestWhenInUseAuthorization];
            break;
        case kCLAuthorizationStatusDenied:{
//            CitySelectViewController *cityVC = [[CitySelectViewController alloc] init];
//            [ApplicationDelegate.rootNavController pushViewController:cityVC animated:YES];
            //            [self];
            //传递定位失败的信息,点击定位城市的位置 提示：是否去设置开启定位
            //跳转到定位城市列表
            break;
        }
        default:
            break;
    }
}

- (void)startTrackingLocation {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined) {
        [_locationManager requestWhenInUseAuthorization];
    }
    else if (status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [_locationManager startUpdatingLocation];
    }
}


@end
