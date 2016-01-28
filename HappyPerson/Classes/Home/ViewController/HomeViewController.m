//
//  HomeViewController.m
//  HappyPerson
//
//  Created by wei on 15/6/28.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "HomeViewController.h"
#import "MyCenterViewController.h"
#import "AppDelegate.h"
#import "MYCollectionView.h"
//#import "MYCollectionReusableView.h"
#import "MYCollectionViewCell.h"
#import "CitySelectViewController.h"

#import "HPNavigationController.h"
#import "SDCycleScrollView.h"

#import "TableViewCell1.h"
#import "ScrollViewTableCell.h"
#import "HPFamousTableCell.h"
#import "HPFamousResponse.h"
#import "HPFamousModel.h"
#import "HPFamousDealsModel.h"
#import "HPUserNewResponse.h"
#import "HPUserNewArraysModel.h"
#import "HPFansLifeResponse.h"
#import "HPPreformanceResponse.h"
#import "HPHotLineResponse.h"
#import "HPRecommandResponse.h"
#import "HPUserNewTableCell.h"

#import "HPVenderClientKit.h"
#import "HPFansLifeArrayModel.h"
#import "HPFansTableCell.h"
#import "HPPerformanceArrayModel.h"
#import "HPPerformanceTableCell.h"
#import "HPRecommandModel.h"
#import "HPGuessTableCell.h"
#import "HPRecommandTableCell.h"
//#import "GuidanceView.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,SDCycleScrollViewDelegate>



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
@property (nonatomic, strong) HPFamousResponse *hpFamousResponse;
@property (nonatomic, strong) HPUserNewResponse *hpUserNewResponse;
@property (nonatomic, strong) HPFansLifeResponse *hpFansLifeResponse;
@property (nonatomic, strong) HPPreformanceResponse *hpPreformanceResponse;
@property (nonatomic, strong) HPHotLineResponse *hpHotLineResponse;

@property (nonatomic, strong) HPRecommandResponse *hpRecommadResponse;
@property (nonatomic, strong) NSMutableArray *famousArray;
@property (nonatomic, strong) HPFamousModel *famousModel;
@property (nonatomic, strong) NSMutableArray *userNewArray;
@property (nonatomic, strong) NSMutableArray *fansArray;

@property (nonatomic, strong) NSMutableArray *performanceArray;
@property (nonatomic, strong) NSMutableArray *recommandArray;



//城市选择

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _scrollDataArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"scrollData" ofType:@"plist"]];
    
    
    
    //    [];
    //此句隐藏navigationBar
    //    [self hideNaviBar:YES];
    
    
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    if (![defaults objectForKey:@"intro_screen_viewed"]) {
    //        [self hideNaviBar:YES];
    //
    //    }else{
    _imgArray = [NSArray arrayWithObjects:[HPAssistant imageWithContentsOfFile:@"scrolimg1"],[HPAssistant imageWithContentsOfFile:@"scrolimg2"],[HPAssistant imageWithContentsOfFile:@"scrolimg3"], nil];
    //tableview布局
    [self mineTableView];
    [self refreshTableView];
    
    
    
    
    
}
#pragma mark - 数组
-(NSMutableArray *)famousArray
{
    if (!_famousArray) {
        _famousArray = [[NSMutableArray alloc] init];
    }
    return _famousArray;
}

-(NSMutableArray *)userNewArray
{
    if (!_userNewArray) {
        _userNewArray = [[NSMutableArray alloc] init];
    }
    return _userNewArray;
}

-(NSMutableArray *)fansArray
{
    if (!_fansArray) {
        _fansArray = [[NSMutableArray alloc] init];
    }
    return _fansArray;
}

-(NSMutableArray *)performanceArray
{
    if (!_performanceArray) {
        _performanceArray = [[NSMutableArray alloc] init];
    }
    return _performanceArray;
}

-(NSMutableArray *)recommandArray
{
    if (!_recommandArray) {
        _recommandArray = [NSMutableArray array];
    }
    return _recommandArray;
}


#pragma mark - TableView

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
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, kMainScreenWidth, kMainScreenHeight-44-49)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentSize = CGSizeMake(kMainScreenWidth, 3000);
    //    _tableView.backgroundColor = [UIColor redColor];
//    _tableView.layer.borderWidth = 1;
//    _tableView.layer.borderColor = [UIColor redColor].CGColor;
    //    _tableView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    [self.view addSubview:_tableView];
    
    //    _tableView.tableHeaderView = [self tableViewWithHeaderView];
    
    
    _cityBtn = [CustomNaviBarView createNormalNaviBarBtnByTitle:ApplicationDelegate.locationCity target:self action:@selector(selectCity:)];
    [self setNaviBarLeftBtn:_cityBtn];
    
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
    [ApplicationDelegate.hpNavController pushViewController:v3 animated:YES];
    
    //    [self pushViewController:v3 animated:YES];
}

#pragma mark - 下拉刷新 上拉加载更多
-(void)refreshTableView{
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf switchResponseloadNewData];
    }];
    
    NSLog(@"headerview is %@",NSStringFromCGRect(self.tableView.mj_header.frame));
    // 马上进入刷新状态(自动刷新) 不加此句需要手动下拉刷新
    [self.tableView.mj_header beginRefreshing];
    
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 设置了底部inset
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 30, 0);
    NSLog(@"footerView is %@",NSStringFromCGRect(self.tableView.mj_footer.frame));
    // 忽略掉底部inset
//    self.tableView.mj_footer.ignoredScrollViewContentInsetBottom = 30;
    
    //    [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
    //#warning 自动刷新(一进入程序就下拉刷新)
    //    [self.tableView headerBeginRefreshing];
    //
    //    // 2.上拉加载更多(进入刷新状态就会调用self的footerRereshing)
    //    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
    
}

#pragma mark 下拉刷新数据
- (void)switchResponseloadNewData
{
    WS(ws)
    
    // 2秒后刷新表格UI,下拉传递的page为第一页0
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
            [self setUpFamousResponse];
//            [self setUpUserNewPreference];
            [self setUpFansResponse];
            [self setUpPreformanceResponse];
            [self setUpRecommandResponse];
            dispatch_async(dispatch_get_main_queue(), ^{
                //这个里面是主线程要做的事  可以刷新UI
                //由于数据是临时的所以刷新在每次请求里完成
//                [ws.tableView reloadData];
                
            });
        });
        
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
//    });
}

#pragma mark 上拉加载更多数据,现在上方方法里请求数据
- (void)loadMoreData
{
    //2秒后刷新表格UI,上拉传递的page为currentpage+1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.tableView reloadData];
        
        // 拿到当前的上拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
    });
}

#pragma mark - 调用请求数据接口
/*
-(void)loadFamousResponse
{
    if (self.hpFamousResponse) {
        self.hpFamousResponse.currentPage = kStartPageCount;
        [self.hpFamousResponse loadNewData];
    }
}

-(void)loadUserNewResponse
{
    if (self.hpUserNewResponse) {
        [self.hpUserNewResponse loadNewData];
    }
}

-(void)loadFansLifeResponse
{
    if (self.hpFansLifeResponse) {
        //        [self];
    }
}
*/

#pragma mark - 获取数据后的处理方法
#pragma famous
-(void)setUpFamousResponse
{
//    if (!_hpFamousResponse) {
//        _hpFamousResponse = [[HPFamousResponse alloc] init];
    
        
                //此种方法的请求 底部的footerview会叠加到上方的headerview下方，数据请求成功后footerview才会移动到下方
        //        _hpFamousResponse.responseSuccessBlock = ^(id responseData){
        //            if ([responseData isKindOfClass:[NSDictionary class]]) {
        //                if ([responseData count] > 0) {
        //                     _famousModel = [HPFamousModel objectWithKeyValues:responseData];
        //                    //下拉需要，上拉不需要这一步
        //                    [ws.famousArray removeAllObjects];
        //                    for (int i = 0; i < [_famousModel.deals count]; i++) {
        //                        HPFamousDealsModel *famousDealsModel = [HPFamousDealsModel objectWithKeyValues:ws.famousModel.deals[i]];
        //                        [ws.famousArray addObject:famousDealsModel];
        //                    }
        //                    [ws.tableView reloadData];
        //
        //                }
        //            }
        //        };
//    }
    WS(ws);

    //此种方法的请求headerview不会叠加
    [[HPVenderClientKit sharedInstance] getFamousProduct:nil withPage:nil success:^(NSDictionary *famousItems) {
        if ([famousItems count] > 0) {
            _famousModel = [HPFamousModel objectWithKeyValues:famousItems];
            //下拉需要，上拉不需要这一步
            [ws.famousArray removeAllObjects];
            for (int i = 0; i < [_famousModel.deals count]; i++) {
                HPFamousDealsModel *famousDealsModel = [HPFamousDealsModel objectWithKeyValues:ws.famousModel.deals[i]];
                [ws.famousArray addObject:famousDealsModel];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [ws.tableView reloadData];
            });
            
        }
    } failure:^(NSError *error) {
        
    }];

}

#pragma userNewPreference

-(void)setUpUserNewPreference
{
    /*
     if (!_hpUserNewResponse) {
     _hpUserNewResponse = [[HPUserNewResponse alloc] init];
     WS(ws);
     _hpUserNewResponse.responseSuccessBlock = ^(id responseData){
     if ([responseData isKindOfClass:[NSArray class]]) {
     if ([responseData count]>0) {
     [ws.userNewArray removeAllObjects];
     for (int i = 0; i<[responseData count]; i++) {
     HPUserNewArraysModel *userNewArrayModel = responseData[i];
     [ws.userNewArray addObject:userNewArrayModel];
     }
     [ws.tableView reloadData];
     }
     }
     };
     }*/
    
    WS(ws);
    [[HPVenderClientKit sharedInstance] getUserNewPreference:nil success:^(NSArray *preferenceItems) {
        if ([preferenceItems count]>0) {
            [ws.userNewArray removeAllObjects];
            for (int i = 0; i<[preferenceItems count]; i++) {
                HPUserNewArraysModel *userNewArrayModel = [HPUserNewArraysModel objectWithKeyValues:preferenceItems[i]];
                [ws.userNewArray addObject:userNewArrayModel];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [ws.tableView reloadData];
            });
        }
    } failure:^(NSError *error) {
        
    }];
}
#pragma FansArray

-(void)setUpFansResponse
{
    WS(ws);
    [[HPVenderClientKit sharedInstance] getFanLife:nil success:^(NSArray *fanLifeItems) {
        [ws.fansArray removeAllObjects];
        //        [weakSelf.fansArray addObjectsFromArray:fanLifeItems];
        for (int i = 0; i<[fanLifeItems count]; i++) {
            HPFansLifeArrayModel *fansArrayModel = [HPFansLifeArrayModel objectWithKeyValues:fanLifeItems[i]];
            [ws.fansArray addObject:fansArrayModel];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [ws.tableView reloadData];
        });
    } failure:^(NSError *error) {
        
    }];
}
#pragma performanceArray

-(void)setUpPreformanceResponse
{
    WS(ws);
    [[HPVenderClientKit sharedInstance] getPerformance:nil success:^(NSArray *performanceItems) {
        [ws.performanceArray removeAllObjects];
        for (int i = 0; i < [performanceItems count]; i++) {
            HPPerformanceArrayModel *performanceArrayModel = [HPPerformanceArrayModel objectWithKeyValues:performanceItems[i]];
            [ws.performanceArray addObject:performanceArrayModel];
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [ws.tableView reloadData];
        });
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma recommandArray

-(void)setUpRecommandResponse
{
    WS(ws);
    [[HPVenderClientKit sharedInstance] getRecommand:nil success:^(NSArray *recommandItems) {
        [self.recommandArray removeAllObjects];
        for (int i = 0; i < [recommandItems count]; i++) {
            HPRecommandModel *recommandModel = [HPRecommandModel objectWithKeyValues:recommandItems[i]];
            [ws.recommandArray addObject:recommandModel];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [ws.tableView reloadData];
        });
//        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:5];
//        [ws.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//        
//        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:5];
//        [ws.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
    } failure:^(NSError *error) {
        
    }];
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
    if (section==5) {
        return _recommandArray.count+1;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:{
            if ([_scrollDataArray count]>0) {
                return 190.f;
            }else{
                return 0.f;
            }
            break;
        }
        case 1:{
            if ([_famousArray count]>0) {
                return 130.f;
            }else{
                return 0.f;
            }
            break;
        }
        case 2:{
            if ([_userNewArray count] > 0) {
                return 250.f;
            }else{
                return 0.f;
            }
            break;
        }
        case 3:{
            if ([_fansArray count] > 0) {
                return 150.f;
            }else{
                return 0.f;
            }
            break;
        }
        case 4:{
            if ([_performanceArray count] > 0) {
                return 170.f;
            }else{
                return 0.f;
            }
            break;
        }
        case 5:{
            if ([_recommandArray count]>0) {
                
                switch (indexPath.row) {
                    case 0:
                        return 35.f;
                        break;
                        
                    default:
                        return 100.f;
                        break;
                }
            }else{
                return 0.f;
            }
        }
            
        default:
            //            return 70;
            break;
    }
    return  0.f;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:{
            static NSString *cellIdentifier0 = @"CellIdentifier0";
            ScrollViewTableCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier0];
            if (scrollCell == nil) {
                scrollCell = [[ScrollViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier0 withPlist:_scrollDataArray];
            }
            
            scrollCell.selectionStyle = UITableViewCellSelectionStyleNone;
            //            scrollCell.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
            return scrollCell;
            
            break;
        }
        case 1:{
            if ([_famousArray count] > 0 ) {
                
            
            static NSString *cellIdentifier1 = @"CellIdentifier1";
            HPFamousTableCell *famousCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
            if (famousCell==nil) {
                famousCell = [HPFamousTableCell cellWithTableView:tableView];
            }
            famousCell.backgroundClickBlock = ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"跳转" message:@"跳转到下一页" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            };
                
                
                [famousCell setModel:_famousArray];
            famousCell.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
            
            return famousCell;
            
            }else{
                static NSString *cellIndentifier = @"CellIdentifier11";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
                }
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
                return cell;
            }
            break;

        }
        case 2:{
            if ([_userNewArray count] > 0) {
                
            
            
            //可以写入数据库
            static NSString *cellIdentifier2 = @"CellIdentifier2";
            
            HPUserNewTableCell *userNewCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
            
            if (!userNewCell) {
                if ([_userNewArray count]>indexPath.row) {
                    userNewCell = [[HPUserNewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2 withArray:_userNewArray];
                    userNewCell.userNewTableCellBlock = ^(NSString *toURL){
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"跳转" message:toURL delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
                        [alert show];
                    };
                }
                else{
                    userNewCell = [[HPUserNewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
                }
                
            }
            
            userNewCell.selectionStyle = UITableViewCellSelectionStyleNone;
            //            userNewCell.backgroundColor = [UIColor purpleColor];
            
            return userNewCell;
            
            break;
            }
        }
        case 3:{
            if ([_fansArray count] > 0) {
                
            
            static NSString *cellIdentifier3 = @"CellIdentifier3";
            HPFansTableCell *fansTableCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier3];
            if (!fansTableCell) {
                fansTableCell = [[HPFansTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier3];
            }
            if ([_fansArray count] > indexPath.row) {
                
                
                HPFansLifeArrayModel *model = [_fansArray objectAtIndex:indexPath.row];
                [fansTableCell setFansModel:model];
            }
            
            return fansTableCell;
            break;
            }
        }
        case 4:{
            if ([_performanceArray count] > 0) {
                
                if ([_performanceArray count]>indexPath.row) {
                    
                

            static NSString *cellIdentifier4 = @"CellIdentifier4";
            HPPerformanceTableCell *performanceCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier4];
            if (!performanceCell) {
                performanceCell = [[HPPerformanceTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier4 withArray:_performanceArray];
            }
                        //            performanceCell.backgroundColor = [UIColor redColor];
            performanceCell.selectionStyle = UITableViewCellSelectionStyleNone;
            return performanceCell;
            break;
                }
            }
        }
        case 5:{
            static NSString *cellIdentifier51 = @"CellIdentifier51";
            static NSString *cellIdentifier52 = @"CellIdentifier52";
            
            switch (indexPath.row) {
                case 0:{
                    HPGuessTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier51];
                    if (!cell) {
                        cell = [[HPGuessTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier51];
                    }
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                        return cell;
                    break;
                }
                    
                default:{
                    HPRecommandTableCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier52];
                    if (!cell1) {
                        cell1 = [[HPRecommandTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier52];
                        
                    }
                    cell1.selectionStyle = UITableViewCellSelectionStyleNone;

                    if ([_recommandArray count] >0) {
                        HPRecommandModel *recommandModel = [_recommandArray objectAtIndex:indexPath.row-1];
                        [cell1 setModel:recommandModel];
                    }
                    return cell1;

                    break;
                }
            }
                    
            break;
        }
            
            
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
