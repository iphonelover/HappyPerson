//
//  UITableView+HPTableView.m
//  HappyPerson
//
//  Created by wei on 15/11/4.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "UITableView+HPTableView.h"

@implementation UITableView (HPTableView)

+(UITableView *)initWithTableVieFrame:(CGRect)frame withDelegate:(id)delegate
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight-64)];
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.contentSize = CGSizeMake(kMainScreenWidth, 2000);
    return tableView;
}

@end
