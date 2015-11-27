//
//  HPTableBarController.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//
#import "HPTableBarController.h"
#import "UIImage+WB.h"
#import "HPTabBar.h"
#import "HPNavigationController.h"
#import "MainViewController.h"
#import "NearbyViewController.h"
#import "MyCenterViewController.h"
#import "MessageViewController.h"
@interface HPTableBarController ()<HPTabbarDekegate>

@end

@implementation HPTableBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    
    ApplicationDelegate.hpTabController.customTabBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    
    // 初始化tabbar
    [self setupTabBar];
    
    
    
    // 初始化所以子控制器
//    [self setupAllChildViewControls];
}


- (void)setupTabBar
{
    HPTabBar *customTabBar = [[HPTabBar alloc]init];
    customTabBar.delegate = self;
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}



// tabbar代理方法 点击了哪个
- (void)tabBar:(HPTabBar *)tabBar didSelectedButtonfrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
    
}

- (void)setupAllChildViewControls
{
    MainViewController *life = [[MainViewController alloc]init];
    NearbyViewController *news = [[NearbyViewController alloc]init];
    news.view.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    MessageViewController *msg = [[MessageViewController alloc] init];
    MyCenterViewController *mys = [[MyCenterViewController alloc] init];
    
    [self addChildViewControl:life title:@"首页" imageName:@"tabbar_home_os7" selectedImageName:@"tabbar_home_selected_os7"];
    [self addChildViewControl:news title:@"分类" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    [self addChildViewControl:msg title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    [self addChildViewControl:mys title:@"我的" imageName:@"tabbar_profile_os7" selectedImageName:@"tabbar_profile_selected_os7"];
    //跳转的时候隐藏系统自带的tabbar
//    life.hidesBottomBarWhenPushed = YES;
//    news.hidesBottomBarWhenPushed = YES;
//    msg.hidesBottomBarWhenPushed = YES;
//    mys.hidesBottomBarWhenPushed = YES;
    
}

/**
 *  添加子控制器
 *
 *  @param childVc           子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 被选中图片
 */
- (void)addChildViewControl:(CustomViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题图片
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    // 添加到导航控制器
    HPNavigationController *childVcNav = [[HPNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:childVcNav];
    
    childVcNav.view.backgroundColor = [UIColor blueColor];
    // 添加自定义item
    [self.customTabBar addButtonWithItem:childVc.tabBarItem];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
