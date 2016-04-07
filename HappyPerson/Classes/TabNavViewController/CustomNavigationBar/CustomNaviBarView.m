//
//  CustomNaviBarView.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//
/*
 版权属于原作者：https://github.com/jimple/CustomNavigationBar
 */

#import "CustomNaviBarView.h"

#define FLOAT_TitleSizeNormal               19.0f
#define FLOAT_TitleSizeMini                 14.0f
#define RGB_TitleNormal                     RGB(80.0f, 80.0f, 80.0f)
#define RGB_TitleMini                       [UIColor blackColor]

@interface CustomNaviBarView ()

@property (nonatomic, readonly) UIButton *m_btnBack;
@property (nonatomic, readonly) UILabel *m_labelTitle;
@property (nonatomic, readonly) UIImageView *m_imgViewBg;
@property (nonatomic, readonly) UIButton *m_btnLeft;
@property (nonatomic, readonly) UIButton *m_btnRight;
@property (nonatomic, readonly) UIView *m_centerView;
@property (nonatomic, readonly) BOOL m_bIsBlur;


@end

@implementation CustomNaviBarView

@synthesize m_btnBack = _btnBack;
@synthesize m_labelTitle = _labelTitle;
@synthesize m_imgViewBg = _imgViewBg;
@synthesize m_btnLeft = _btnLeft;
@synthesize m_btnRight = _btnRight;
@synthesize m_bIsBlur = _bIsBlur;

@synthesize m_centerView = _viewCenter;


+ (CGRect)rightBtnFrame
{
    return Rect(ScreenWidth-[[self class] barBtnSize].width, 22.0f, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
}

+ (CGSize)barBtnSize
{
    return Size(60.0f, 40.0f);
}

+ (CGSize)barSize
{
    return Size(ScreenWidth, 64.0f);
}

+ (CGRect)titleViewFrame
{
    return Rect((ScreenWidth-190)/2, 20.0f, 190.0f, 40.0f);
}

// 创建一个导航条按钮：使用默认的按钮图片。
+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action
{
    UIButton *btn = [[self class] createImgNaviBarBtnByImgNormal:@"NaviBtn_Normal" imgHighlight:@"NaviBtn_Normal_H" target:target action:action];
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [UtilityFunc label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];

    return btn;
}

// 创建一个导航条按钮：自定义按钮图片。
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action
{
    return [[self class] createImgNaviBarBtnByImgNormal:strImg imgHighlight:strImgHighlight imgSelected:strImgHighlight target:target action:action];
}
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action
{
    UIImage *imgNormal = [UIImage imageNamed:strImg];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:(strImgHighlight ? strImgHighlight : strImg)] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];

    CGFloat fDeltaWidth = ([[self class] barBtnSize].width - imgNormal.size.width)/2.0f;
    CGFloat fDeltaHeight = ([[self class] barBtnSize].height - imgNormal.size.height)/2.0f;
    fDeltaWidth = (fDeltaWidth >= 2.0f) ? fDeltaWidth/2.0f : 0.0f;
    fDeltaHeight = (fDeltaHeight >= 2.0f) ? fDeltaHeight/2.0f : 0.0f;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, fDeltaWidth, fDeltaHeight, fDeltaWidth)];

    [btn setTitleEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, -imgNormal.size.width, fDeltaHeight, fDeltaWidth)];

    return btn;
}

+(UIView *)createSegmentControlLeftBntByTitle:(NSString *)leftTitle rightBntByTitle:(NSString *)rightTitle target:(id)target actionLeft:(SEL)actionL actionRight:(SEL)actionR
{
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.tag = 10001;
    btnLeft.frame = CGRectMake(25, 2, [[self class]barBtnSize].width, [[self class] barBtnSize].height);
    [btnLeft addTarget:target action:actionL forControlEvents:UIControlEventTouchUpInside];
    [btnLeft setTitle:leftTitle forState:UIControlStateNormal];
    [btnLeft setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnLeft setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
//    [btnLeft setTitleColor:[UIColor blueColor] forState:(UIControlStateSelected|UIControlStateHighlighted)];
    btnLeft.titleLabel.font = [UIFont systemFontOfSize:14.0f];

    [UtilityFunc label:btnLeft.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];


    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRight.tag = 10002;
    btnRight.frame = CGRectMake(btnLeft.frame.origin.x+btnLeft.frame.size.width+20, 2, [[self class]barBtnSize].width, [[self class] barBtnSize].height);
    [btnRight addTarget:target action:actionR forControlEvents:UIControlEventTouchUpInside];
    [btnRight setTitle:rightTitle forState:UIControlStateNormal];
    [btnRight setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnRight setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    btnRight.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [UtilityFunc label:btnRight.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];

    UIView *centerView = [[UIView alloc] init];
    [centerView addSubview:btnLeft];
    [centerView addSubview:btnRight];

    return  centerView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        _bIsBlur = (IsiOS7Later && Is4Inch);

        [self initUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self initUI];
}

- (void)initUI
{
    self.backgroundColor = [UIColor clearColor];

    // 默认左侧显示返回按钮
    _btnBack = [[self class] createImgNaviBarBtnByImgNormal:@"NaviBtn_Back" imgHighlight:@"NaviBtn_Back_H" target:self action:@selector(btnBack:)];

    _labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _labelTitle.backgroundColor = [UIColor clearColor];
    _labelTitle.textColor = [UIColor blackColor];
    _labelTitle.font = [UIFont systemFontOfSize:FLOAT_TitleSizeNormal];
    _labelTitle.textAlignment = NSTextAlignmentCenter;

    _imgViewBg = [[UIImageView alloc] initWithFrame:self.bounds];
    // resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)
    _imgViewBg.image = [[UIImage imageNamed:@"bar_navigation_64"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    _imgViewBg.alpha = 0.98f;

    _labelTitle.frame = [[self class] titleViewFrame];
    _imgViewBg.frame = self.bounds;

    [self addSubview:_imgViewBg];
    [self addSubview:_labelTitle];

    [self setLeftBtn:_btnBack];
}

- (void)setTitle:(NSString *)strTitle
{
    [_labelTitle setText:strTitle];
}

- (void)setLeftBtn:(UIButton *)btn
{
    if (_btnLeft)
    {
        [_btnLeft removeFromSuperview];
        _btnLeft = nil;
    }else{}

    _btnLeft = btn;
    if (_btnLeft)
    {
        _btnLeft.frame = Rect(2.0f, 22.0f, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
        [self addSubview:_btnLeft];
    }else{}
}

- (void)setRightBtn:(UIButton *)btn
{
    if (_btnRight)
    {
        [_btnRight removeFromSuperview];
        _btnRight = nil;
    }else{}

    _btnRight = btn;
    if (_btnRight)
    {
        _btnRight.frame = [[self class] rightBtnFrame];
        [self addSubview:_btnRight];
    }else{}
}

- (void)setCustomBtn:(UIButton *)btn rect:(CGRect)rect
{
    btn.frame = rect;
    [self addSubview:btn];
}

- (void)btnBack:(id)sender
{
    if (self.m_viewCtrlParent)
    {
        [self.m_viewCtrlParent.navigationController popViewControllerAnimated:YES];
    }else{APP_ASSERT_STOP}
}

- (void)showCoverView:(UIView *)view
{
    [self showCoverView:view animation:NO];
}
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation
{
    if (view)
    {
        [self hideOriginalBarItem:YES];

        [view removeFromSuperview];

        view.alpha = 0.4f;
        [self addSubview:view];
        if (bIsAnimation)
        {
            [UIView animateWithDuration:0.2f animations:^()
             {
                 view.alpha = 1.0f;
             }completion:^(BOOL f){}];
        }
        else
        {
            view.alpha = 1.0f;
        }
    }else{APP_ASSERT_STOP}
}

- (void)showCoverViewOnTitleView:(UIView *)view
{
    if (view)
    {
        if (_labelTitle)
        {
            _labelTitle.hidden = YES;
        }else{}

        [view removeFromSuperview];
        view.frame = _labelTitle.frame;

        [self addSubview:view];
    }else{APP_ASSERT_STOP}
}

- (void)hideCoverView:(UIView *)view
{
    [self hideOriginalBarItem:NO];
    if (view && (view.superview == self))
    {
        [view removeFromSuperview];
    }else{}
}

#pragma mark -
- (void)hideOriginalBarItem:(BOOL)bIsHide
{
    if (_btnLeft)
    {
        _btnLeft.hidden = bIsHide;
    }else{}
    if (_btnBack)
    {
        _btnBack.hidden = bIsHide;
    }else{}
    if (_btnRight)
    {
        _btnRight.hidden = bIsHide;
    }else{}
    if (_labelTitle)
    {
        _labelTitle.hidden = bIsHide;
    }else{}
}


- (void)setCenterView:(UIView *)centerView
{
    if (_viewCenter)
    {
        [_viewCenter removeFromSuperview];
        _viewCenter = nil;
    }else{}

    _viewCenter = centerView;
    if (_viewCenter)
    {
        _viewCenter.frame = [[self class] titleViewFrame];
        [self addSubview:_viewCenter];
    }else{}
}








@end
