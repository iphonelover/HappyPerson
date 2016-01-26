//
//  AppDelegate.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "AppDelegate.h"
#import "SMLocation.h"
#import "UIView+Additions.h"

#import <MAMapKit/MAMapKit.h>

#import <AMapSearchKit/AMapSearchAPI.h>
#import <AMapSearchKit/AMapSearchObj.h>
#import <AMapSearchKit/AMapCommonObj.h>
#import "CitySelectViewController.h"

#import "MYProgressHUD.h"
#import "UIView+Additions.h"

#import "GuidanceImage.h"
#import "GuidanceViewController.h"

#import "MyCenterViewController.h"
#import "MoreViewController.h"
#import "HomeViewController.h"
#import "ShopViewController.h"

//定位tag
#define LOCATION_AGAIN_TAG 5000
//评论tag
#define COMMENT_ACTION_TAG 5001
//没有开启定位的tag
#define NO_KAIQI_LOCATION_TAG 5002
//定位到的城市不存在
#define NO_CITY_TAG 5003
//切换城市
#define CHANGE_CITY_TAG 5004



@interface AppDelegate ()<MAMapViewDelegate,AMapSearchDelegate,CLLocationManagerDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) SMLocation *location;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;
@property (nonatomic, strong) CitySelectViewController *cityViewController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self configureAPIKey];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    _hpTabController = [[HPTableBarController alloc] init];
    
    HomeViewController *home = [[HomeViewController alloc]init];
    ShopViewController *shop = [[ShopViewController alloc]init];
    MyCenterViewController *myCenter = [[MyCenterViewController alloc] init];
    MoreViewController *more = [[MoreViewController alloc] init];

    
    [_hpTabController setViewControllers:@[home,shop,myCenter,more]];
    
    
    
    [self addChildViewControl:home title:@"团购" imageName:@"icon_tabbar_homepage" selectedImageName:@"icon_tabbar_homepage_selected"];
    [self addChildViewControl:shop title:@"商家" imageName:@"icon_tabbar_merchant_normal" selectedImageName:@"icon_tabbar_merchant_selected"];
    [self addChildViewControl:myCenter title:@"我的" imageName:@"icon_tabbar_mine" selectedImageName:@"icon_tabbar_mine_selected"];
    [self addChildViewControl:more title:@"更多" imageName:@"icon_tabbar_misc" selectedImageName:@"icon_tabbar_misc_selected"];
    
    
    
    
    [self initLocationAction];

    
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"kFirstLogined"]){
        GuidanceImage *m1 = [GuidanceImage modelWithImage:[UIImage imageNamed:@"gui1"]];
        
        GuidanceImage *m2 = [GuidanceImage modelWithImage:[UIImage imageNamed:@"gui2"]];
        
        GuidanceImage *m3 = [GuidanceImage modelWithImage:[UIImage imageNamed:@"gui3"]];
        
        self.window.rootViewController = [GuidanceViewController guidanceWithModels:@[m1,m2,m3] enterBlock:^{
            
            NSLog(@"进入主页面");
            [self enter];
        }];
        
    }else{
        [self enter];
    }
    
//    MainViewController *mainVC = [[MainViewController alloc] init];
//    self.window.rootViewController = mainVC;
    
    
   [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)addChildViewControl:(CustomViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题图片
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [HPAssistant imageWithContentsOfFile:imageName];
    childVc.tabBarItem.selectedImage = [HPAssistant imageWithContentsOfFile:selectedImageName];
    // 添加到导航控制器
    
    // 添加自定义item
    [_hpTabController.customTabBar addButtonWithItem:childVc.tabBarItem];
}


-(void)enter
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kFirstLogined"];
    _hpNavController = [[HPNavigationController alloc] initWithRootViewController:_hpTabController];
//    _xwTabBarController.tabBar.hidden = YES;
    self.window.rootViewController = _hpNavController;
    
    

}
#pragma mark -
- (void)configureAPIKey
{
    if ([APIKey length] == 0)
    {
        NSString *reason = [NSString stringWithFormat:@"apiKey为空，请检查key是否正确设置。"];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:reason delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
    }
    
//    [MAMapServices sharedServices].apiKey = (NSString *)APIKey;
    [MAMapServices sharedServices].apiKey = @"f30e6a8cfd37ab9d0133a185fe8ff54e";
}







#pragma mark -初始化定位
-(void)initLocationAction
{
    //断网：1、设置-隐私-定位服务开启，[CLLocationManager locationServicesEnabled]=1，[CLLocationManager authorizationStatus]=kCLAuthorizationStatusNotDetermined
    //     2、设置-隐私-定位服务关闭，[CLLocationManager locationServicesEnabled]=0，[CLLocationManager authorizationStatus]=kCLAuthorizationStatusDenied
    
//    if ([[CWNetWorkListenner sharedManager] checkNowNetWorkStatus] == NotReachable) {
//        [MYProgressHUD showErrorHUD:@"网络连接失败" view:[UIView getKeyWindow]];
//        NSLog(@"SSSSS  %d   %d",[CLLocationManager locationServicesEnabled],[CLLocationManager authorizationStatus]);//0  kCLAuthorizationStatusNotDetermined
//    }
//    else{
//       NSLog(@"SSSSS  %d   %d",[CLLocationManager locationServicesEnabled],[CLLocationManager authorizationStatus]);
//        //0  2
//    }
    if ([CLLocationManager locationServicesEnabled]) {
        //网络断：弹出是否允许定位的提示框，点击允许后，引导页之后先跳转到首页再跳转到城市选择页
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            if(_locationManager == nil){
                _locationManager = [[CLLocationManager alloc] init];
                //delegate = CLLocationManagerDelegate;
                [_locationManager setDelegate:self];
                //        _locationManager.distanceFilter = 100;
                [_locationManager requestAlwaysAuthorization];        //NSLocationAlwaysUsageDescription
                [_locationManager requestWhenInUseAuthorization];
                
                [self.locationManager startUpdatingLocation];
                
                //        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            }
        }
        if (_mapView == nil) {
            self.mapView = [[MAMapView alloc] init];
        }
        self.mapView.frame = CGRectZero;
        self.mapView.showsUserLocation = YES;
        self.mapView.delegate = self;
        self.mapView.userTrackingMode = MAUserTrackingModeFollow;
        
//    }else {
//        //隐私里的总的定位服务关闭
//        _locationCity = @"定位失败";
//        //        ApplicationDelegate.currentCityNode.cityName = @"定位失败";
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您未开启定位服务" message:@"打开定位服务来允许应用获取您的位置" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
//        alert.tag = NO_KAIQI_LOCATION_TAG;
//        [alert show];
//    }

        
    }else{
        //到设置-隐私-开启定位服务
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"未开启定位服务" message:@"到隐私里开启定位服务" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    
    
//    if (([CLLocationManager locationServicesEnabled]&&([CLLocationManager authorizationStatus]!=kCLAuthorizationStatusDenied||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusNotDetermined))||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusRestricted) {
    
//        if ([CLLocationManager locationServicesEnabled]&&([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedAlways||[CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse)) {
    
//        }
//    if (([CLLocationManager authorizationStatus]!=kCLAuthorizationStatusDenied||[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusNotDetermined)&&[CLLocationManager authorizationStatus]==kCLAuthorizationStatusRestricted) {
//        if (_location) {
//            _location = nil;
//        }
//        _location = [[SMLocation alloc] init:self];
//    if (CLLocationManager locationServicesEnabled&&[CLLocationManager authorizationStatus]!=kCLAuthorizationStatusDenied) {
//        
//    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"buttonIndex is %ld",(long)buttonIndex);
    if (buttonIndex == 0) {
    
    }else if (buttonIndex == 1){
//    NSURL*url=[NSURL URLWithString:@"prefs:root=LOCATION_SERVICES"];
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication] openURL:url];
    }
}


#pragma mark - MAMapViewDelegate
//定位成功
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    _currentLocation = userLocation.location;
    if (_currentLocation) {
        self.mapView.showsUserLocation = NO;
    }
    NSLog(@"latitude  %f",userLocation.coordinate.latitude);
    
    _search = [[AMapSearchAPI alloc] initWithSearchKey:@"f30e6a8cfd37ab9d0133a185fe8ff54e" Delegate:self];
    
    //构造AMapReGeocodeSearchRequest对象，location为必选项，radius为可选项
    AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc] init];
    regeoRequest.searchType = AMapSearchType_ReGeocode;
    regeoRequest.location = [AMapGeoPoint locationWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude];
    regeoRequest.radius = 10000;
    regeoRequest.requireExtension = YES;
    
    //发起逆地理编码
    [_search AMapReGoecodeSearch: regeoRequest];
    
}
//定位失败
-(void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    switch ([error code]) {
        case kCLErrorDenied:{
            _cityViewController = [[CitySelectViewController alloc] initWithLocalCityName:@"定位失败"];
            self.locationCity = @"定位失败";
            self.locationYES = NO;
            self.window.rootViewController = _cityViewController;//为什么是getKeyWindow
//            [MYProgressHUD showErrorHUD:@"请开启定位" view:[UIView getKeyWindow]];
            break;
        }
        case kCLErrorLocationUnknown:{
            [MYProgressHUD showErrorHUD:@"请检查定位" view:[UIView getKeyWindow]];
            
            break;
        }
            
        default:
//            [MYProgressHUD showErrorHUD:@"请检查定位" view:[UIView getKeyWindow]];
            break;
    }
}


#pragma mark - AMapSearchDelegate
//地理编码查询回调函数
-(void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response
{
    NSLog(@"onGeocodeSearchDoneresponse is %@",response);
}

//实现逆地理编码的回调函数
-(void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if(response.regeocode != nil)
    {
        //通过AMapReGeocodeSearchResponse对象处理搜索结果
        if (![CommonTools isBlankString:response.regeocode.addressComponent.city]) {
//            self.currentCityNode.cityName = response.regeocode.addressComponent.city;
            self.locationCity = response.regeocode.addressComponent.city;
            NSString *suffixStr = [self.locationCity substringFromIndex:self.locationCity.length-1];
            if ([suffixStr isEqualToString:@"市"]) {
                self.locationYES = YES;
                self.locationCity = [self.locationCity substringToIndex:self.locationCity.length - 1];
            }
            
        }
        else{
            self.locationCity = response.regeocode.addressComponent.province;
            NSString *suffixStr = [self.locationCity substringFromIndex:self.locationCity.length-1];
            if ([suffixStr isEqualToString:@"市"]) {
                self.locationYES = YES;
                self.locationCity = [self.locationCity substringToIndex:self.locationCity.length - 1];
            }
//            self.currentCityNode.cityName = response.regeocode.addressComponent.province;
            
        }
    }
}

//地址反编译
//- (void)searchReGeocodeWithCoordinate:(CLLocationCoordinate2D)coordinate
//{
//    
//}

#pragma mark - CLLocation
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
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


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    if ([CLLocationManager authorizationStatus]!=kCLAuthorizationStatusRestricted) {
         _cityViewController = [[CitySelectViewController alloc] init];
        [self.window.rootViewController presentViewController:_cityViewController animated:YES completion:nil];
    }
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
