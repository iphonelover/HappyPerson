//
//  HPTabBarButton.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "HPTabBarButton.h"

// 图标比例
#define HPTabBarButtonImageRatio 0.6

@interface HPTabBarButton()
@end
@implementation HPTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        UIColor *titleColor = (ios7 ? [UIColor blackColor]:[UIColor whiteColor]);
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
//        if (!ios7) {
//            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
//        }
    }
    return self;
}

#pragma mark - 重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted{
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}




- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageH = self.frame.size.height * HPTabBarButtonImageRatio;
    CGFloat imageW = self.frame.size.width;
    return CGRectMake(0, 0, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = self.frame.size.height * HPTabBarButtonImageRatio;
    CGFloat titleW = self.frame.size.width;
    CGFloat titleH = self.frame.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}


@end
