//
//  MoreViewController.m
//  HappyPerson
//
//  Created by wei on 15/6/29.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreTableCell.h"

@interface MoreViewController ()
{
    NSMutableArray *_moreArray;
}

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //隐藏导航条
//    [self hideNaviBar:YES];
//    self.view.backgroundColor = [UIColor greenColor];
    [self setNaviBarTitle:@"更多"];
    
    _moreArray = [[NSMutableArray alloc] init];
    _moreArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"MoreList" ofType:@"plist"]];
    
    [self tableViewLayout];
    
}

#pragma mark - TableView
-(void)tableViewLayout
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64-49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.contentSize = CGSizeMake(kMainScreenWidth, 3000);
    _tableView.backgroundColor = [UIColor colorWithHexString:@"#f0efed"];
    [self.view addSubview:_tableView];
    
}

#pragma mark - TableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10.0f;
    }
    return 5.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 10.f;
    }
    return 5.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[_moreArray objectAtIndex:0] count];
    }else if (section == 1){
        return [[_moreArray objectAtIndex:1] count];
    }else if (section == 2){
        return [[_moreArray objectAtIndex:2] count];
    }else {
        return [[_moreArray objectAtIndex:3] count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"MoreCellIdentifier";
    MoreTableCell *moreCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!moreCell) {
        moreCell = [[MoreTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [moreCell setModel:[[_moreArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] withSection:indexPath.section withRow:indexPath.row];
    return moreCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:{
            switch (indexPath.row) {
                case 0:
                    //扫一扫
                    break;
                    
                default:
                    break;
            }
            break;
        }
        case 1:{
            switch (indexPath.row) {
                case 0:
                    
                    break;
                case 1:{
                    break;
                }
                case 2:{
                    break;
                }
                case 3:{
                    break;
                }
                case 4:{
                    //发送通知，Cell里接收通知
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"DELETECACHE" object:nil];
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case 2:{
            break;
        }case 3:{
            break;
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
