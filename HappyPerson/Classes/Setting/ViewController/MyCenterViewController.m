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
    _dataSource = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MyInterface" ofType:@"plist"]];
    
    
//    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight - 64)];
    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64) style:UITableViewStyleGrouped];
    _settingTableView.delegate = self;
    _settingTableView.dataSource = self;
    _settingTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _settingTableView.contentSize = CGSizeMake(kMainScreenWidth, 3000);
    _settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _settingTableView.tableHeaderView = [self tableViewWithHeaderView];
    [self.view addSubview:_settingTableView];
    
}



#pragma mark - tableview顶部的headerView

-(UIView *)tableViewWithHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 160)];
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"马上登陆" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    headerView.backgroundColor = [UIColor greenColor];
    return headerView;
}

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
            return  20;
            break;
        case 1:
            return 20;
        default:
//            return 20;
            break;
    }
    
    return 0.f;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [[_dataSource objectAtIndex:0] count];
            break;
        case 1:
            return [[_dataSource objectAtIndex:1] count];
        default:
            break;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  44.f;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
//    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    MyCenterTableCell *cell = (MyCenterTableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    NSString *info;
    if (cell == nil) {
        cell = [[MyCenterTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:{
            if (indexPath.row < [[_dataSource objectAtIndex:0] count]) {
                info = [[_dataSource objectAtIndex:0] objectAtIndex:indexPath.row];
            }
            break;
        }
            
        case 1:{
            if (indexPath.row < [[_dataSource objectAtIndex:1] count]) {
                info = [[_dataSource objectAtIndex:1] objectAtIndex:indexPath.row];
            }
        }
        default:
            break;
    }
    
    [cell setModel:info];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    SetViewController *setSubVC = [[SetViewController alloc] init];
    [self.navigationController pushViewController:setSubVC animated:YES];
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
