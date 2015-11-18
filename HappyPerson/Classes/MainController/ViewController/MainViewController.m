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
#import "MYCollectionView.h"
#import "MYCollectionReusableView.h"
#import "MYCollectionViewCell.h"
#import "CitySelectViewController.h"

#import "HPNavigationController.h"
#import "SDCycleScrollView.h"

#import "TableViewCell1.h"
#import "ScrollViewTableCell.h"
#import "HPFamousTableCell.h"
//#import "GuidanceView.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SDCycleScrollViewDelegate>



@property (nonatomic, strong) NSString *sStr;
@property (nonatomic, copy) NSString *cStr;

//@property (nonatomic, strong) UIButton *backBtn;


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) MYCollectionView *collectionView;
@property (nonatomic, strong) TableViewCell1 *cell;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSDictionary *imgTitleDic;
@property (nonatomic, strong) NSArray *imgArray;

@property (nonatomic,strong) NSArray *scrollDataArray;


//城市选择

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    _scrollDataArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"scrollData" ofType:@"plist"]];
    //此句隐藏navigationBar
//    [self hideNaviBar:YES];


//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if (![defaults objectForKey:@"intro_screen_viewed"]) {
//        [self hideNaviBar:YES];
//
//    }else{
    _imgArray = [NSArray arrayWithObjects:[HPAssistant imageWithContentsOfFile:@"scrolimg1"],[HPAssistant imageWithContentsOfFile:@"scrolimg2"],[HPAssistant imageWithContentsOfFile:@"scrolimg3"], nil];
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
        HPNavigationController *navController = [[HPNavigationController alloc] initWithRootViewController:citySelectVC];
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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentSize = CGSizeMake(kMainScreenWidth, 3000);
    [self.view addSubview:_tableView];

//    _tableView.tableHeaderView = [self tableViewWithHeaderView];


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
        HPNavigationController *navController = [[HPNavigationController alloc] initWithRootViewController:cityVC];
        [self presentViewController:navController animated:YES completion:nil];
    }else{

    [self.navigationController pushViewController:cityVC animated:YES];
    }

}




-(UIView *)tableViewWithHeaderView
{
    UIView *headerView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 100)];
    headerView.backgroundColor = [UIColor colorWithHexString:@"#f4f4f4"];

    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kMainScreenWidth, 100) imagesGroup:_imgArray];
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [headerView addSubview:cycleScrollView];


    return headerView;
}


-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{

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
//    if (section==5) {
//        return 5;
//    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:{
            return 180.f;
            break;
        }
        case 1:{
            return 120.f;
            break;
        }
//        case 2:{
//            return 240.f;
//            break;
//        }
//        case 3:{
//            return 140.f;
//            break;
//        }
//        case 4:{
//            return 150.f;
//            break;
//        }
//        case 5:{
//            switch (indexPath.row) {
//                case 0:
//                    return 35.f;
//                    break;
//                    
//                default:
//                    return 100.f;
//                    break;
//            }
//        }
            
        default:
            break;
    }
    return  70.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:{
            return 1.f;
            break;
        }
            
        default:
            return 5.f;
            break;
    }
    return 5.f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 5)];
    headerView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 5)];
    footerView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    return footerView;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGSize size = [_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    switch (indexPath.section) {
        case 0:{
            static NSString *cellIdentifier1 = @"CellIdentifier1";
            ScrollViewTableCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
            if (scrollCell == nil) {
                scrollCell = [[ScrollViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier1 withPlist:_scrollDataArray];
            }
            scrollCell.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
            return scrollCell;

            break;
        }
        case 1:{
            static NSString *cellIdentifier2 = @"CellIdentifier2";
            HPFamousTableCell *famousCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
            if (famousCell==nil) {
                famousCell = [[HPFamousTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
            }
            famousCell.selectionStyle = UITableViewCellSelectionStyleNone;
            famousCell.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
            famousCell.backgroundClickBlock = ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"跳转" message:@"跳转到下一页" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            };
            return famousCell;
            break;
        }
//        case 2:{
//            break;
//        }
//        case 3:{
//            break;
//        }
//        case 4:{
//            break;
//        }
//        case 5:{
//            break;
//        }
            
            
        default:
            break;
    }

    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
