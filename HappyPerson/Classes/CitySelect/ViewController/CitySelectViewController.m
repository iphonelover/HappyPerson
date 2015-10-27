//
//  CityListViewController.m
//  CityList
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "CitySelectViewController.h"


#define HOTCITY_KEY @"热"
#define LOCCITY_KEY @"定"
#define RECCITY_KEY @"*"

@interface CitySelectViewController ()

@property (nonatomic, readonly) UIButton *m_btnNaviLeft;
@property (nonatomic,assign) BOOL isLocal;



@end

@implementation CitySelectViewController


-(id)initWithLocalCityName:(NSString *)cityName
{
    if (self = [super init]) {
        _localCityName = cityName;
        
        //        self.arrayCitys = [NSMutableArray array];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _gpsCity = ApplicationDelegate.locationCity;
    
    self.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州市",@"北京市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"无锡市", nil];
    
    self.arrayGPSCity = [NSMutableArray arrayWithObject:_gpsCity];
    self.keys = [NSMutableArray array];
    //    _localCityName = ApplicationDelegate.currentCityNode.cityName;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    
    [self setNaviBarTitle:@"城市选择"];    // 设置标题
    
    if (!ApplicationDelegate.locationYES) {
        _m_btnNaviLeft = [CustomNaviBarView createImgNaviBarBtnByImgNormal:@"btn_closeItem" imgHighlight:@"btn_closeItem_hl" target:self action:@selector(backAction)];
    }else{
        _m_btnNaviLeft = [CustomNaviBarView createImgNaviBarBtnByImgNormal:@"navi_back_normal" imgHighlight:@"navi_back_select" target:self action:@selector(backAction)];
    }
    [self setNaviBarLeftBtn:_m_btnNaviLeft];
    //
    //
    //    [self getSearchView];
    [self getCityTableView];
    //    [self getSearchDisplayController];
    //
    //
    [self getCityDataList];
    self.view.backgroundColor=[UIColor purpleColor];
    
    _isLocal = [CLLocationManager locationServicesEnabled];
    
}

- (void) applicationWillEnterForeground{
    [ApplicationDelegate initLocationAction];
    _localCityName = ApplicationDelegate.locationCity;
    [self refreshLocationCityCell];
    
}

#pragma mark - 获取城市数据
-(void)getCityDataList
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"
                                                   ofType:@"plist"];
    self.cities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    //    self.cities = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"3",@"C",@"4",@"A",@"5",@"B", nil];
    
    [self.keys addObjectsFromArray:[[self.cities allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    
    
    //添加GPS城市
    //    NSString *strGPS = @"定";
    [self.keys insertObject:LOCCITY_KEY atIndex:0];
    [self.cities setObject:_arrayGPSCity forKey:LOCCITY_KEY];
    //添加热门城市
    //    NSString *strHot = @"热";
    [self.keys insertObject:HOTCITY_KEY atIndex:1];
    [self.cities setObject:_arrayHotCity forKey:HOTCITY_KEY];
}

- (void)backAction
{
    //    [ApplicationDelegate.rootNavController popViewControllerAnimated:YES];
    if (!ApplicationDelegate.locationYES) {
        if ([_localCityName isEqualToString:@"定位失败"]) {
            [MYProgressHUD showTextHUD:@"请选择城市" view:self.view];
        }else{
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



/**
 *	@brief	初始化城市tableView
 */
#pragma mark 初始化城市tableView----------------------------------------------------
- (void)getCityTableView
{
    //    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (IOS7_OR_LATER?64:45), self.view.bounds.size.width, self.view.bounds.size.height-(IOS7_OR_LATER?64:40))];
    
    //    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, kMainScreenWidth, kMainScreenHeight-100)];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64)];
    _tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    _tableView.backgroundColor = [UIColor whiteColor];
    //设置分割线样式
    _tableView.separatorStyle = UITableViewCellSelectionStyleBlue;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundView = nil;
    //侧边字母颜色
//    _tableView.sectionIndexColor = [UIColor colorWithHexString:@"ff6c00"];
    [self.view addSubview:_tableView];
}



#pragma mark - tableView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

#pragma mark 每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

/*
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 0, 250, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:12];
    
    NSString *key = [_keys objectAtIndex:section];
    if ([key rangeOfString:@"定"].location != NSNotFound) {
        titleLabel.text = @"GPS定位城市";
    }
    else if ([key rangeOfString:@"热"].location != NSNotFound) {
        titleLabel.text = @"热门城市";
    }else
        titleLabel.text = key;
    
    [bgView addSubview:titleLabel];
    
    return bgView;
}
 
 */
#pragma mark 表头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 26)];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 25)];
    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.textColor = [UIColor blackColor];
    bgView.backgroundColor = [UIColor whiteColor];
    titleLabel.textColor = [UIColor blackColor];
    NSString *key = [_keys objectAtIndex:section];
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    if ([key rangeOfString:@"热"].location != NSNotFound) {
        titleLabel.text = @"热门城市";
    }
    else if ([key rangeOfString:@"定"].location != NSNotFound) {
        titleLabel.text = @"GPS定位城市";
    }
    //    else if ([key rangeOfString:RECCITY_KEY].location != NSNotFound) {
    //        titleLabel.text = @"最近访问城市";
    //    }
    else{
        titleLabel.text = key;
        titleLabel.font = [UIFont systemFontOfSize:16];
    }
    [bgView addSubview:titleLabel];
    //    UIImageView *borderimage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"city_border_orange"]];
    UIView *borderView= [[UIView alloc] initWithFrame:CGRectMake(10, 25, self.view.frame.size.width, 1)];
    //    borderimage.frame = CGRectMake(10, 25, self.view.frame.size.width-20, 1);
    borderView.backgroundColor = [UIColor colorWithHexString:@"#ff6100"];
    [bgView addSubview:borderView];
    bgView.backgroundColor=[UIColor clearColor];
    bgView.bounds=CGRectMake(0, 0, bgView.frame.size.width, 44);
    return bgView;
}


- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [_keys objectAtIndex:section];
    
    NSArray *citySection = [_cities objectForKey:key];
    return [citySection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [_keys objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //此判断放置出现多个相同的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.textLabel setTextColor:[UIColor blackColor]];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
    }
    cell.textLabel.text = [[_cities objectForKey:key] objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = [_keys objectAtIndex:indexPath.section];

    
    NSString *selectedCityName = [[_cities objectForKey:key] objectAtIndex:indexPath.row];
    
    if ([selectedCityName isEqualToString:@"定位失败"]) {
        [MYProgressHUD showTextHUD:@"定位失败，请先选择一个城市" view:self.view];
    }else{
        
        if (self.selectCityName) {
            self.selectCityName(selectedCityName);
        }
        
        [self.navigationController popViewControllerAnimated:YES];
        if (_localCityName||ApplicationDelegate.locationCity) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        
    }

}


#pragma mark 刷新定位城市cell
- (void)refreshLocationCityCell
{
    //刷新定位城市cell
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    NSArray *indexArray=[NSArray arrayWithObject:indexPath];
    [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewDidAppear:animated];
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
