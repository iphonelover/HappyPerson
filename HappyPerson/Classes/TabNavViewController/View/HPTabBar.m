//
//  WBTabbar.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "HPTabBar.h"
#import "UIImage+WB.h"
#import "HPTabBarButton.h"

@interface HPTabBar()
@property (nonatomic, weak) UIButton *selectButton;
@property (nonatomic, strong) NSMutableArray *arrButton;
@end
@implementation HPTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        if (!ios7) {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
    }
    return self;
}


- (NSMutableArray *)arrButton
{
    if (_arrButton == nil) {
        _arrButton = [NSMutableArray array];
    }
    return _arrButton;
}

- (void)addButtonWithItem:(UITabBarItem *)item
{
    // 创建按钮
    HPTabBarButton *button = [[HPTabBarButton alloc]init];
    [self addSubview:button];
    [self.arrButton addObject:button];
    
    button.item = item;
    // 点击监听
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
    
    if (self.arrButton.count == 1) {
        [self clickButton:button];
    }
}

- (void)clickButton:(UIButton *)button
{
    // 通知代理点击了哪个
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonfrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonfrom:self.selectButton.tag to:button.tag];
    }
    // 点击按钮状态改变
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
}

// 子视图布局
- (void)layoutSubviews
{
    [super layoutSubviews];
//    CGFloat w = self.frame.size.width;
    
    // 按钮的frame数据
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = kMainScreenWidth/self.subviews.count;
    CGFloat buttonY = 0;
//    CGFloat buttonY = 15;//由于tabbar是自定义的高度由原来的49变成了64，因此y坐标由0变成了15
    
    for (int index = 0; index<self.arrButton.count; index++) {
        // 1.取出按钮
        HPTabBarButton *button = self.arrButton[index];
        
        // 2.设置按钮的frame
        CGFloat buttonX = index * buttonW;

        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        // 3.绑定tag
        button.tag = index;
    }
}

@end
