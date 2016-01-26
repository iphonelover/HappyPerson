//
//  HPButtonView.m
//  HappyPerson
//
//  Created by wei on 15/11/10.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPButtonView.h"

@implementation HPButtonView


-(instancetype)initWithFrame:(CGRect)frame withImage:(NSString *)image withTitle:(NSString *)titleStr
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-44)/2, 15, 44, 44)];
        imageView.image = [HPAssistant imageWithContentsOfFile:image];
        [self addSubview:imageView];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, frame.size.width, 20)];
        title.text = titleStr;
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont systemFontOfSize:13.f];
        [self addSubview:title];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self setBackgroundColor:[UIColor colorWithRed:227/255.0 green:227/255.0 blue:227/255.0 alpha:1.0]];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self setBackgroundColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
