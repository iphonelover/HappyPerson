//
//  KLTableBarController.m
//  KnowingLife
//
//  Created by tanyang on 14/10/26.
//  Copyright (c) 2014年 tany. All rights reserved.
//

#import "KLTableBarController.h"
#import "UIImage+WB.h"
#import "WBTabBar.h"
#import "KLNavigationController.h"
//#import "KLNewsViewController.h"
//#import "KLMoreViewController.h"
//#import "ProductCollectionController.h"
//#import "CSStickyHeaderFlowLayout.h"
//#import "KLGroupBuyController.h"
//#import "KLNewsMenuController.h"
#import "MainViewController.h"
#import "NearbyViewController.h"
#import "MyCenterViewController.h"
#import "MessageViewController.h"
//
@interface KLTableBarController ()<WBTabbarDekegate>

@end

@implementation KLTableBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UITabBar class]]) {
            [child removeFromSuperview];
        }
    }
    
    ApplicationDelegate.xwTabBarController.customTabBar.hidden = NO;
    
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UITabBar class]]) {
            [view removeFromSuperview];
        }
    }
    
    // 初始化tabbar
    [self setupTabBar];
    
    
    
    // 初始化所以子控制器
    [self setupAllChildViewControls];
}



- (void)setupTabBar
{
    WBTabBar *customTabBar = [[WBTabBar alloc]initWithFrame:CGRectMake(0, kMainScreenHeight-64, kMainScreenWidth, 64)];
    customTabBar.delegate = self;
//    customTabBar.frame = self.tabBar.bounds;
//    CGFloat height = 64;
//    self.tabBar.frame = CGRectMake(0, kMainScreenHeight-64, kMainScreenWidth, 64);
//    self.tabBar.backgroundColor = [UIColor redColor];
//    [self.tabBar addSubview:customTabBar];
    self.tabBar.hidden = YES;
    self.customTabBar = customTabBar;
    [self.view addSubview:self.customTabBar];
}


// tabbar代理方法 点击了哪个
- (void)tabBar:(WBTabBar *)tabBar didSelectedButtonfrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
    
    if (to == 3) { // 点击更多
        //[self.home refreshData];
        // 传递数据
//        self.more.weatherInfo = self.life.weatherInfo;
    }
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
    life.hidesBottomBarWhenPushed = YES;
    news.hidesBottomBarWhenPushed = YES;
    msg.hidesBottomBarWhenPushed = YES;
    mys.hidesBottomBarWhenPushed = YES;
    
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
//    childVc.title = title;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    NSLog(@"tabBarItem.title %@",childVc.tabBarItem.title);
    // 添加到导航控制器
    KLNavigationController *childVcNav = [[KLNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:childVcNav];
    
    childVcNav.view.backgroundColor = [UIColor blueColor];
    // 添加自定义item
    [self.customTabBar addButtonWithItem:childVc.tabBarItem];
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
