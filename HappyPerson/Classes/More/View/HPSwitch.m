//
//  HPSwitch.m
//  HappyPerson
//
//  Created by wei on 16/1/27.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPSwitch.h"



#define HPSwitchHeight 31.0f
#define HPSwitchMinWidth 61.0f
#define HPThumbSize 28.0f
@interface HPSwitch ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIView *onView;
@property (nonatomic, strong) UIView *offView;
@property (nonatomic, strong) UIView *thumbView;

@end

@implementation HPSwitch

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[self roundRect:frame]];
    if (self) {
        [self viewLayout];
    }
    return self;
}

-(CGRect)roundRect:(CGRect)frame
{
    CGRect myRect = frame;
    if (myRect.size.height > HPSwitchHeight) {
        myRect.size.height = HPSwitchHeight;
    }
    
    if (myRect.size.height < HPSwitchHeight) {
        myRect.size.height = HPSwitchHeight;
    }
    
    if (myRect.size.width < HPSwitchMinWidth) {
        myRect.size.width = HPSwitchMinWidth;
    }
    
    return myRect;
    
}

-(void)setOnColor:(UIColor *)onColor
{
    if (_onColor != onColor) {
        _onColor = onColor;
        _onView.backgroundColor = _onColor;
    }
}

-(void)setOffColor:(UIColor *)offColor
{
    if (_offColor != offColor) {
        _offColor = offColor;
        _offView.backgroundColor = _offColor;
    }
}

-(void)setThumbColor:(UIColor *)thumbColor
{
    if (_thumbColor != thumbColor) {
        _thumbColor = thumbColor;
        _thumbView.backgroundColor = _thumbColor;
    }
}


#pragma mark - switch layout
-(void)viewLayout
{
    self.backgroundColor = [UIColor clearColor];
    _onColor = [UIColor colorWithPatternImage:[HPAssistant imageWithContentsOfFile:@"bg_switch_on"]];
    _offColor = [UIColor colorWithPatternImage:[HPAssistant imageWithContentsOfFile:@"bg_switch_off"]];
    _thumbColor = [UIColor whiteColor];
    
    
    _containerView = [[UIView alloc] initWithFrame:self.bounds];
    _containerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_containerView];
    
    _onView = [[UIView alloc] initWithFrame:self.bounds];
    _onView.backgroundColor = _onColor;
    _offView = [[UIView alloc] initWithFrame:self.bounds];
    _offView.backgroundColor = _offColor;
    _thumbView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HPThumbSize, HPThumbSize)];
    _thumbView.backgroundColor = _thumbColor;
    _thumbView.layer.cornerRadius = HPThumbSize/2;
    [_containerView addSubview:_onView];
    [_containerView addSubview:_offView];
    [_containerView addSubview:_thumbView];
    
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:gesture];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.containerView.frame = self.bounds;
    
    CGFloat radius = CGRectGetHeight(self.bounds)/2;
    self.containerView.layer.cornerRadius = radius;
    self.containerView.layer.masksToBounds = YES;
    
    CGFloat margin = (CGRectGetHeight(self.bounds)-HPThumbSize)/2;
    if (!self.isOn) {
        self.onView.frame = CGRectMake(-1*CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.offView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.thumbView.frame = CGRectMake(margin, margin, HPThumbSize, HPThumbSize);
    }else{
        self.onView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.offView.frame = CGRectMake(-1*CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.thumbView.frame = CGRectMake(CGRectGetWidth(self.bounds)-margin-HPThumbSize, margin, HPThumbSize, HPThumbSize);
    }
    
}

-(void)tap:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self setOnSwitch:!_isOn];
    }
}

-(void)setOnSwitch:(BOOL)on
{
    if (_isOn == on) {
        return;
    }
    CGFloat margin = (CGRectGetHeight(self.bounds)-HPThumbSize)/2;
    if (!self.isOn) {
        self.onView.frame = CGRectMake(-1*CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.offView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.thumbView.frame = CGRectMake(margin, margin, HPThumbSize, HPThumbSize);
        
    }else{
        self.onView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.offView.frame = CGRectMake(-1*CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        self.thumbView.frame = CGRectMake(CGRectGetWidth(self.bounds)-margin-HPThumbSize, margin, HPThumbSize, HPThumbSize);
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
