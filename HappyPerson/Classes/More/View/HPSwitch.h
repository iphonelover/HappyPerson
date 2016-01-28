//
//  HPSwitch.h
//  HappyPerson
//
//  Created by wei on 16/1/27.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPSwitch : UIControl

@property (nonatomic, assign) BOOL isOn;
@property (nonatomic, strong) UIColor *thumbColor;
@property (nonatomic, strong) UIColor *onColor;
@property (nonatomic, strong) UIColor *offColor;


-(void)setOnSwitch:(BOOL)on;


@end
