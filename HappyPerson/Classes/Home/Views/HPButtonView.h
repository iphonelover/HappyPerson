//
//  HPButtonView.h
//  HappyPerson
//
//  Created by wei on 15/11/10.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPButtonView : UIView

-(instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)title;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
