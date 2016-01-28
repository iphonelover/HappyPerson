//
//  MyCenterViewController.m
//  HappyPerson
//
//  Created by wei on 15/7/28.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MyCenterViewController.h"
#import "MyCenterTableCell.h"
#import "SetViewController.h"
#import "MyCenterTableCell0.h"
#import "MyCenterTableCell1.h"

@interface MyCenterViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *settingTableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation MyCenterViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setNaviBarTitle:@"我的"];
    self.view.backgroundColor = [UIColor blueColor];
    
    //从plist文件里获取内容
    _dataSource = [HPAssistant arrayWithStringFromPlist:@"MyCenter.plist"];
    
    
//    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight - 64)];
    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64-49) style:UITableViewStyleGrouped];
    _settingTableView.contentOffset = CGPointMake(0, -20);
    _settingTableView.delegate = self;
    _settingTableView.dataSource = self;
    _settingTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _settingTableView.contentSize = CGSizeMake(kMainScreenWidth, 3000);
    _settingTableView.layer.borderColor = [UIColor redColor].CGColor;
    _settingTableView.layer.borderWidth = 2.f;
    _settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _settingTableView.tableHeaderView = [self tableViewWithHeaderView];
    [self.view addSubview:_settingTableView];
    
    
//    _settingTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
////        [weakSelf switchResponseloadNewData];
//    }];
    
}



#pragma mark - tableview顶部的headerView

//-(UIView *)tableViewWithHeaderView{
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 160)];
//    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [loginBtn setTitle:@"马上登陆" forState:UIControlStateNormal];
//    [loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
//    [headerView addSubview:loginBtn];
//    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//    }];
//    headerView.backgroundColor = [UIColor greenColor];
//    return headerView;
//}

#pragma mark - 登陆操作

-(void)login:(id)sender
{
    NSLog(@"跳转到登陆界面");
}


#pragma mark -
#pragma mark UITableViewDataSource and UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return  75;
            break;
        default:
            return 5;
            break;
    }
    
//    return 0.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:{
            UIImageView *noLoginView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 75)];
            noLoginView.image = [HPAssistant imageWithContentsOfFile:@"bg_login"];
            noLoginView.userInteractionEnabled = YES;
            UILabel *noLabel = [[UILabel alloc] initWithFrame:CGRectMake((kMainScreenWidth-100)/2, 15, 100, 20)];
            noLabel.textColor = [UIColor colorWithHexString:@"#666666"];
            noLabel.font = [UIFont systemFontOfSize:12.f];
            noLabel.textAlignment = NSTextAlignmentCenter;
            [noLoginView addSubview:noLabel];
            
            UIButton *noLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            noLoginBtn.frame = CGRectMake((kMainScreenWidth-100)/2, 40, 100, 30);
            [noLoginBtn setTitle:@"马上登陆" forState:UIControlStateNormal];
            [noLoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [noLoginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
            [noLoginView addSubview:noLoginBtn];
            
            return noLoginView;
            break;
        }
            
        default:
            break;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    switch (section) {
        case 4:
            return 0.f;
            break;
            
        default:
            return 5.f;
            break;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return [[_dataSource objectAtIndex:0] count];
            break;
        case 2:
            return [[_dataSource objectAtIndex:1] count];
            break;
        case 3:
            return [[_dataSource objectAtIndex:2] count];
            break;
        case 4:
            return [[_dataSource objectAtIndex:3] count];
            break;
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 60.f;
            break;
            
        default:
            return 45.f;
            break;
    }
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:{
            
            static NSString *cellIdentifier = @"CellIdentifier";
            MyCenterTableCell0 *cell = (MyCenterTableCell0 *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if (cell == nil) {
                cell = [[MyCenterTableCell0 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            return cell;

            break;
        }
            
        default:{
            
            static NSString *cellIdentifier = @"CellIdentifier";
            MyCenterTableCell1 *cell = (MyCenterTableCell1 *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            
            if (cell == nil) {
                cell = [[MyCenterTableCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }

            NSString *info;

            if (indexPath.row < [[_dataSource objectAtIndex:indexPath.row] count]) {
                info = [[_dataSource objectAtIndex:1] objectAtIndex:indexPath.row];
            }
            return cell;

            break;
        }
    }
    

    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    SetViewController *setSubVC = [[SetViewController alloc] init];
    [ApplicationDelegate.hpNavController pushViewController:setSubVC animated:YES];
//    switch (indexPath.section) {
//        case 0:
//            switch (indexPath.row) {
//                case 0:
//                    
//                    break;
//                case 1:
//                    break;
//                case 2:
//                    break;
//                default:
//                    break;
//            }
//        
//        case 1:
//            switch (indexPath.row) {
//                case 0:{
//                    
//                    break;
//                }
//                    
//                default:
//                    break;
//            }
//            
//        default:
//            break;
//    }
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
