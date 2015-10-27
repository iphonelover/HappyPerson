//
//  MainViewController.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MainViewController.h"
#import "MyCenterViewController.h"
#import "AppDelegate.h"
#import "AdView.h"
#import "AdDataModel.h"
#import "MYCollectionView.h"
#import "MYCollectionReusableView.h"
#import "MYCollectionViewCell.h"
#import "CitySelectViewController.h"

#import "KLNavigationController.h"

#import "TableViewCell1.h"
//#import "GuidanceView.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>



@property (nonatomic, strong) NSString *sStr;
@property (nonatomic, copy) NSString *cStr;

//@property (nonatomic, strong) UIButton *backBtn;


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) MYCollectionView *collectionView;
@property (nonatomic, strong) TableViewCell1 *cell;
@property (nonatomic, strong) AdView * scrollView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSDictionary *imgTitleDic;

//城市选择

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //此句隐藏navigationBar
//    [self hideNaviBar:YES];
    
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if (![defaults objectForKey:@"intro_screen_viewed"]) {
//        [self hideNaviBar:YES];
//        
//    }else{
        [self mineTableView];
//    }
    
}



-(void)mineTableView
{
    if (!ApplicationDelegate.locationYES) {
        ApplicationDelegate.locationCity = @"定位失败";
        
        
        CitySelectViewController *citySelectVC = [[CitySelectViewController alloc] initWithLocalCityName:ApplicationDelegate.locationCity];
        //http://blog.sina.com.cn/s/blog_8f38d3410101530b.html
        //如果citySelectVC不加在navController，弹出的citySelectVC里的tableview会靠上，GPS定位城市section会隐藏
        KLNavigationController *navController = [[KLNavigationController alloc] initWithRootViewController:citySelectVC];
        citySelectVC.selectCityName = ^(NSString *cityName){
            //            ApplicationDelegate.locationCity = cityName;
            [_cityBtn setTitle:cityName forState:UIControlStateNormal];
            //            _cityBtn = [CustomNaviBarView createNormalNaviBarBtnByTitle:cityName target:self action:@selector(selectCity:)];
        };
        
        [ApplicationDelegate.window.rootViewController presentViewController:navController animated:YES completion:nil];
        //        [self.navigationController pushViewController:citySelectVC animated:YES];
        
    }
    
    NSLog(@"locationCity is %@",ApplicationDelegate.locationCity);
    [self setNaviBarTitle:@"生活"];
    _imageArray = [NSArray arrayWithObjects:@"icon_homepage_aroundjourneyCategory",@"icon_homepage_beautyCategory",@"icon_homepage_cakeCategory",@"icon_homepage_CouponCategory",@"icon_homepage_dailyNewDealCategory",@"icon_homepage_fastfoodCategory",@"icon_homepage_foodCategory",@"icon_homepage_foottreatCategory", nil];
    
    _titleArray = [NSArray arrayWithObjects:@"美食",@"电影",@"酒店",@"KTV",@"优惠买单",@"周边游",@"预定早餐",@"外卖", nil];
    
    _imgTitleDic = [NSDictionary dictionaryWithObjectsAndKeys:_imageArray,@"imageview",_titleArray,@"title", nil];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentSize = CGSizeMake(kMainScreenWidth, 3000);
    [self.view addSubview:_tableView];
    
    _tableView.tableHeaderView = [self tableViewWithHeaderView];
    
    
    _cityBtn = [CustomNaviBarView createNormalNaviBarBtnByTitle:ApplicationDelegate.locationCity target:self action:@selector(selectCity:)];
    [self setNaviBarLeftBtn:_cityBtn];
    
    self.view.backgroundColor = [UIColor redColor];
}


-(void)selectCity:(id)sender
{
    CitySelectViewController *cityVC = [[CitySelectViewController alloc] init];
    
    
    cityVC.selectCityName = ^(NSString *cityName){
        [_cityBtn setTitle:cityName forState:UIControlStateNormal];
    };
    if (!ApplicationDelegate.locationYES) {
        KLNavigationController *navController = [[KLNavigationController alloc] initWithRootViewController:cityVC];
        [self presentViewController:navController animated:YES completion:nil];
    }else{
    
    [self.navigationController pushViewController:cityVC animated:YES];
    }
    
}

-(UIView *)tableViewWithHeaderView
{
    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 300)];
    headerView.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];
//    [headerView setBackgroundColor:[UIColor blueColor]];
    AdDataModel * dataModel = [AdDataModel adDataModelWithImageName];
     _scrollView = [AdView adScrollViewWithFrame:CGRectMake(0, 0, kMainScreenWidth, 100) ImageNameArray:dataModel.imageNameArray pageControlShowStyle:UIPageControlShowStyleCenter];
    [_scrollView setBackgroundColor:[UIColor colorWithHexString:@"#ffffff"]];
//    [headerView addSubview:scrollView];
//    return scrollView;
    
    
    
    //UICollectionViewFlowLayout
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.headerReferenceSize = CGSizeMake(kMainScreenWidth, 100);
    _collectionView = [[MYCollectionView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 300) withFlowLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    _collectionView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
//    _collectionView.backgroundColor = [UIColor redColor];
    [headerView addSubview:_collectionView];
    
    //注册cell和ReusableView（相当于头部）
    [_collectionView registerClass:[MYCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    
//    UIView *collectionView = [[UIView alloc] initWithFrame:CGRectMake(0, scrollView.frame.size.height +10, kMainScreenWidth, 200)];
//    _collectionView = [[MYCollectionView alloc] initWithFrame:CGRectMake(0, scrollView.frame.size.height +10, kMainScreenWidth, 230)];
//    _collectionView.delegate = self;
//    _collectionView.dataSource = self;
//    _collectionView.allowsMultipleSelection = YES;
//    [_collectionView registerClass:[MYCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
////    [_collectionView registerClass:[MYCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeCollectionHeader"];
//    [_collectionView setBackgroundColor:[UIColor colorWithHexString:@"ffffff"]];
////    [_collectionView setBackgroundColor:[UIColor redColor]];
//    
//    [headerView addSubview:_collectionView];
    
    return headerView;
}



-(void)click:(id)sender
{
    MyCenterViewController *v3 = [[MyCenterViewController alloc] init];
    [self.navigationController pushViewController:v3 animated:YES];
    
//    [self pushViewController:v3 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UITableViewDataSource and UITableViewDelegate

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [UIView new];
//    return #headerView#;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  90.f;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGSize size = [_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";    

    _cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (_cell == nil) {
        _cell = [[TableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    return _cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


//===========================================================
#pragma mark - UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MYCollectionViewCell *cell = nil;
    static NSString *cellIdentify = @"collectionViewCell";
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentify forIndexPath:indexPath];
    [cell sizeToFit];
    //判断返回的数据的个数是否大于indexPath.row
    [cell setModelItem:[_titleArray objectAtIndex:indexPath.row]];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"HomeCollectionViewCell");
//    MYCollectionReusableView *supplementaryView = nil;
    UICollectionReusableView *supplementaryView ;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
       supplementaryView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
        [supplementaryView addSubview:_scrollView];
    }
    
    return supplementaryView;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//https://developer.apple.com/library/ios/documentation/UIKit/Reference/UICollectionViewDelegateFlowLayout_protocol/

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"collectionviewlayoutdelegate");
    //4个  5*8 = 40
    //图片为正方形，边长：(fDeviceWidth-20)/2-5-5 所以总高(fDeviceWidth-20)/2-5-5 +20+30+5+5 label高20 btn高30 边
    return CGSizeMake((kMainScreenWidth-40)/4, (kMainScreenWidth-40)/4+20);
}

//定义每个UICollectionView的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}

//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - UICollectViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    NSLog(@"选择了%ld",indexPath.row);
//    switch (indexPath.section) {
//        case 0:
//            
//            break;
//        case 1:
//            break;
//        default:
//            break;
//    }
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
