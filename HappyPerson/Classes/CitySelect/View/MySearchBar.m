//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//
#import "MySearchBar.h"
@implementation MySearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIColor *color = [UIColor colorWithRed:255/255.0 green:128/255.0 blue:0.0 alpha:1];
        [self changeBarTextfieldWithColor: color bgImageName: kBgTextFieldImageName];
        [self changeBarCancelButtonWithColor:[UIColor whiteColor] bgImageName: @"myEditNormal"];
    }
    return self;
}

- (void)changeBarTextfieldWithColor:(UIColor *)color bgImageName:(NSString *)bgImageName
{
    self.tintColor=color;
    
    UITextField *textField;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 6.1f) {
        for (UIView *subv in self.subviews) {
            for (UIView* view in subv.subviews) {
                if ([view isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
                    textField = (UITextField*)view;
                    textField.layer.borderWidth=1;
                    textField.layer.cornerRadius=6;
                    textField.layer.borderColor=color.CGColor;
                    UIImage *image = [UIImage imageNamed:kBgTextFieldImageName];
                    [textField setBackgroundColor:[UIColor clearColor]];
                    //UIImage *image = UIImage image
                    [textField setBackground:image];
                    break;
                }
            }
        }
    }else{
        for (UITextField *subv in self.subviews) {
            if ([subv isKindOfClass:[UITextField class]]) {
                textField = (UITextField*)subv;
                UIImage *image = [UIImage imageNamed:kBgTextFieldImageName];
                [textField setBackgroundColor:[UIColor clearColor]];
                //UIImage *image = UIImage image
                [textField setBackground:image];
                break;
            }
        }
    }
    
    // 设置文本框背景
    NSArray *subs = self.subviews;
    if ([[[UIDevice currentDevice] systemVersion] floatValue]  > 6.1f) { // ios 7
        for (int i = 0; i < [subs count]; i++) {
            UIView* subv = (UIView*)[self.subviews objectAtIndex:i];
            for (UIView* subview in subv.subviews) {
                if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
                {
                    [subview setHidden:YES];
                    [subview removeFromSuperview];
                    break;
                }
            }
        }
    }else{
        for (int i = 0; i < [subs count]; i++) {
            UIView* subv = (UIView*)[self.subviews objectAtIndex:i];
            if ([subv isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [subv removeFromSuperview];
                break;
            }
        }
    }
    
    //    searchBarBgImage
    //    [CWImage imageWithFileName: bgImageName scale:2 edgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
   
}

- (void)changeBarCancelButtonWithColor:(UIColor *)textColor bgImageName:(NSString *)bgImageName
{
    for (UIView *searchbuttons in self.subviews)
    {
        
        if ([searchbuttons isKindOfClass:[UIButton class]]) // ios7以下
        {
            UIButton *cancelButton = (UIButton*)searchbuttons;
            cancelButton.enabled = YES;
            [cancelButton setTitleColor:textColor forState:UIControlStateNormal];
            [cancelButton setTitleColor:textColor forState:UIControlStateSelected];
            if (bgImageName)
            {
                [cancelButton setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
                [cancelButton setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateSelected];
            }
            break;
        }
    }
}

@end
