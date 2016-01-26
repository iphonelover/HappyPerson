//
//  SetViewController.m
//  HappyPerson
//
//  Created by wei on 15/10/21.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "SetViewController.h"
#import "SetTableCell.h"

@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

@property (nonatomic, strong) UIButton *m_btnNaviLeft;
@property (nonatomic, strong) UITableView *settingTableView;
@property (nonatomic, strong) NSArray *dataSource;


@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ApplicationDelegate.hpTabController.customTabBar.hidden = YES;

    // Do any additional setup after loading the view.
    [self setNaviBarTitle:@"设置"];
     _m_btnNaviLeft = [CustomNaviBarView createImgNaviBarBtnByImgNormal:@"navi_back_normal" imgHighlight:@"navi_back_select" target:self action:@selector(backAction)];
    [self setNaviBarLeftBtn:_m_btnNaviLeft];
    
    _dataSource = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SetList" ofType:@"plist"]];
    
    _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64) style:UITableViewStyleGrouped];
    _settingTableView.delegate = self;
    _settingTableView.dataSource = self;
    _settingTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _settingTableView.contentSize = CGSizeMake(kMainScreenWidth, 3000);
    _settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_settingTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    ApplicationDelegate.hpTabController.customTabBar.hidden = NO;
}

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_dataSource count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:{
           return [[_dataSource objectAtIndex:0] count];
            break;
        }
        case 1:{
            return [[_dataSource objectAtIndex:1] count];
            break;
        }
        case 2:{
            return [[_dataSource objectAtIndex:2] count];
            break;
        }
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
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
    SetTableCell *cell = (SetTableCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    
    NSString *info;
    if (cell == nil) {
        cell = [[SetTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
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
            break;
        }
        case 2:{
            if (indexPath.row < [[_dataSource objectAtIndex:2] count]) {
                info = [[_dataSource objectAtIndex:2] objectAtIndex:indexPath.row];
            }
            break;
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
    switch (indexPath.row) {
        case 0:{
            
            break;
        }
        case 1:{
            NSString *rootPath = HPCachesPath;
            NSFileManager *fileManager = [NSFileManager defaultManager];
            float fileSize = 0.0;
            if ([fileManager fileExistsAtPath:rootPath]) {
                NSArray *childFiles = [fileManager subpathsAtPath:rootPath];
                for (NSString *fileName in childFiles) {
                    NSString *fileFullPath = [rootPath stringByAppendingPathComponent:fileName];
                    fileSize = [HPAssistant fileSizeAtPath:fileFullPath];
                }
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"清理缓存" message:[NSString stringWithFormat:@"%.2fM,你确定清理缓存吗?",fileSize] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alertView show];
                alertView.tag = 10001;
            }
            break;
        }
        case 2:{
            
        }
            
        default:
            break;
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 10001) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if ([fileManager fileExistsAtPath:HPCachesPath]) {
            NSArray *files = [fileManager subpathsAtPath:HPCachesPath];
            for (NSString *fileName in files) {
                NSString *fileFullPath = [HPCachesPath stringByAppendingPathComponent:fileName];
                [fileManager removeItemAtPath:fileFullPath error:nil];
            }
        }
    }
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
