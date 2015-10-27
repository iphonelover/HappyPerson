//
//  AdScrollView.m
//  广告循环滚动效果
//
//  Created by QzydeMac on 14/12/20.
//  Copyright (c) 2014年 Qzy. All rights reserved.
//

#import "AdView.h"

#define UISCREENWIDTH  _adScrollView.bounds.size.width//广告的宽度
#define UISCREENHEIGHT  _adScrollView.bounds.size.height//广告的高度

#define HIGHT _adScrollView.bounds.origin.y //由于_pageControl是添加进父视图的,所以实际位置要参考,滚动视图的y坐标

static CGFloat const chageImageTime = 3.0;

static NSUInteger centerImageIndex = 1;//记录中间图片的下标,开始总是为1
static NSUInteger leftImageIndex = 0;
static NSUInteger rightImageIndex = 2;
@interface AdView ()
{
    //广告的label
    UILabel * _adLabel;
    //循环滚动的三个视图
    UIImageView * _leftImageView;
    UIImageView * _centerImageView;
    UIImageView * _rightImageView;
    //循环滚动的周期时间
    NSTimer * _moveTime;
    //用于确定滚动式由人导致的还是计时器到了,系统帮我们滚动的,YES,则为系统滚动,NO则为客户滚动(ps.在客户端中客户滚动一个广告后,这个广告的计时器要归0并重新计时)
    BOOL _isTimeUp;
    //为每一个图片添加一个广告语(可选)
    UILabel * _leftAdLabel;
    UILabel * _centerAdLabel;
    UILabel * _rightAdLabel;
}

@property (retain,nonatomic,readonly) UIImageView * leftImageView;
@property (retain,nonatomic,readonly) UIImageView * centerImageView;
@property (retain,nonatomic,readonly) UIImageView * rightImageView;

@end

@implementation AdView

#pragma mark - 自由指定广告所占的frame

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _adScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _adScrollView.bounces = NO;
        _adScrollView.showsHorizontalScrollIndicator = NO;
        _adScrollView.showsVerticalScrollIndicator = NO;
        _adScrollView.pagingEnabled = YES;
        _adScrollView.contentOffset = CGPointMake(UISCREENWIDTH, 0);
        _adScrollView.contentSize = CGSizeMake(UISCREENWIDTH * 3, UISCREENHEIGHT);
        _adScrollView.delegate = self;
        
        //该句是否执行会影响pageControl的位置,如果该应用上面有导航栏,就是用该句,否则注释掉即可
//        _adScrollView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
        
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, UISCREENHEIGHT)];
        [_adScrollView addSubview:_leftImageView];
        _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH, 0, UISCREENWIDTH, UISCREENHEIGHT)];
        [_adScrollView addSubview:_centerImageView];
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(UISCREENWIDTH*2, 0, UISCREENWIDTH, UISCREENHEIGHT)];
        [_adScrollView addSubview:_rightImageView];
        
        
        
        
    
        _moveTime = [NSTimer scheduledTimerWithTimeInterval:chageImageTime target:self selector:@selector(animalMoveImage) userInfo:nil repeats:YES];
        _isTimeUp = NO;
        
        _adScrollView.backgroundColor = [UIColor orangeColor];
        [self addSubview:_adScrollView];
    }
    return self;
}

+ (id)adScrollViewWithFrame:(CGRect)frame ImageNameArray:(NSArray *)imageNameArray pageControlShowStyle:(UIPageControlShowStyle)PageControlShowStyle
{
    AdView * adView = [[AdView alloc]initWithFrame:frame];
    
    [adView setImageNameArray:imageNameArray];
    
    [adView setPageControlShowStyle:PageControlShowStyle];
    
    return adView;
}

#pragma mark - 设置广告所使用的图片(名字)
- (void)setImageNameArray:(NSArray *)imageNameArray
{
    _imageNameArray = imageNameArray;
    
    _leftImageView.image = [UIImage imageNamed:_imageNameArray[0]];
    _centerImageView.image = [UIImage imageNamed:_imageNameArray[1]];
    _rightImageView.image = [UIImage imageNamed:_imageNameArray[2]];
}

#pragma mark - 设置每个对应广告对应的广告语
//- (void)setAdTitleArray:(NSArray *)adTitleArray withShowStyle:(AdTitleShowStyle)adTitleStyle
//{
//    _adTitleArray = adTitleArray;
//    
//    if(adTitleStyle == AdTitleShowStyleNone)
//    {
//        return;
//    }
//    
//    _leftAdLabel = [[UILabel alloc]init];
//    _centerAdLabel = [[UILabel alloc]init];
//    _rightAdLabel = [[UILabel alloc]init];
//    
//    
//    _leftAdLabel.frame = CGRectMake(10, UISCREENHEIGHT - 40, UISCREENWIDTH, 20);
//    [_leftImageView addSubview:_leftAdLabel];
//    _centerAdLabel.frame = CGRectMake(10, UISCREENHEIGHT - 40, UISCREENWIDTH, 20);
//    [_centerImageView addSubview:_centerAdLabel];
//    _rightAdLabel.frame = CGRectMake(10, UISCREENHEIGHT - 40, UISCREENWIDTH, 20);
//    [_rightImageView addSubview:_rightAdLabel];
//    
//    if (adTitleStyle == AdTitleShowStyleLeft) {
//        _leftAdLabel.textAlignment = NSTextAlignmentLeft;
//        _centerAdLabel.textAlignment = NSTextAlignmentLeft;
//        _rightAdLabel.textAlignment = NSTextAlignmentLeft;
//    }
//    else if (adTitleStyle == AdTitleShowStyleCenter)
//    {
//        _leftAdLabel.textAlignment = NSTextAlignmentCenter;
//        _centerAdLabel.textAlignment = NSTextAlignmentCenter;
//        _rightAdLabel.textAlignment = NSTextAlignmentCenter;
//    }
//    else
//    {
//        _leftAdLabel.textAlignment = NSTextAlignmentRight;
//        _centerAdLabel.textAlignment = NSTextAlignmentRight;
//        _rightAdLabel.textAlignment = NSTextAlignmentRight;
//    }
//    
//    
//    
//    _leftAdLabel.text = _adTitleArray[0];
//    _centerAdLabel.text = _adTitleArray[1];
//    _rightAdLabel.text = _adTitleArray[2];
//    
//}


#pragma mark - 创建pageControl,指定其显示样式
- (void)setPageControlShowStyle:(UIPageControlShowStyle)PageControlShowStyle
{
    if (PageControlShowStyle == UIPageControlShowStyleNone) {
        return;
    }
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = _imageNameArray.count;
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    if (PageControlShowStyle == UIPageControlShowStyleLeft)
    {
        _pageControl.frame = CGRectMake(0, UISCREENHEIGHT - 20, 20*_pageControl.numberOfPages, 20);
        
        NSLog(@"%f",UISCREENHEIGHT - 20);
    }
    else if (PageControlShowStyle == UIPageControlShowStyleCenter)
    {
        _pageControl.frame = CGRectMake(0, 0, 20*_pageControl.numberOfPages, 20);
        _pageControl.center = CGPointMake(UISCREENWIDTH/2.0, UISCREENHEIGHT - 10);
    }
    else
    {
        _pageControl.frame = CGRectMake( UISCREENWIDTH - 20*_pageControl.numberOfPages, UISCREENHEIGHT - 20, 20*_pageControl.numberOfPages, 20);
    }
    _pageControl.currentPage = 0;
    
    _pageControl.enabled = NO;
    
    [self addSubview:_pageControl];
}

#pragma mark - 计时器到时,系统滚动图片
- (void)animalMoveImage
{
    
    [_adScrollView setContentOffset:CGPointMake(UISCREENWIDTH * 2, 0) animated:YES];
    _isTimeUp = NO;
    [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
}

#pragma mark - 图片停止时,调用该函数使得滚动视图复用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_adScrollView.contentOffset.x == 0)
    {
        centerImageIndex = centerImageIndex - 1;
        leftImageIndex = leftImageIndex - 1;
        rightImageIndex = rightImageIndex - 1;
        
        if (leftImageIndex == -1) {
            leftImageIndex = _imageNameArray.count-1;
        }
        else if (centerImageIndex == -1)
        {
            centerImageIndex = _imageNameArray.count-1;
        }
        else if (rightImageIndex == -1)
        {
            rightImageIndex = _imageNameArray.count-1;
        }
    }
    else if(_adScrollView.contentOffset.x == UISCREENWIDTH * 2)
    {
        centerImageIndex = centerImageIndex + 1;
        leftImageIndex = leftImageIndex + 1;
        rightImageIndex = rightImageIndex + 1;
        
        if (leftImageIndex == _imageNameArray.count) {
            leftImageIndex = 0;
        }
        else if (centerImageIndex == _imageNameArray.count)
        {
            centerImageIndex = 0;
        }
        else if (rightImageIndex == _imageNameArray.count)
        {
            rightImageIndex = 0;
        }
    }
    else
    {
        return;
    }
    
    _leftImageView.image = [UIImage imageNamed:_imageNameArray[leftImageIndex]];
    
    _centerImageView.image = [UIImage imageNamed:_imageNameArray[centerImageIndex]];
    
    _rightImageView.image = [UIImage imageNamed:_imageNameArray[rightImageIndex]];
    
    _pageControl.currentPage = leftImageIndex;
    
    //有时候只有在右广告标签的时候才需要加载
    if (_adTitleArray)
    {
        if (leftImageIndex<=_adTitleArray.count-1) {
            _leftAdLabel.text = _adTitleArray[leftImageIndex];
        }
        
        if (centerImageIndex<=_adTitleArray.count-1) {
            _centerAdLabel.text = _adTitleArray[centerImageIndex];
        }
        
        if (rightImageIndex<=_adTitleArray.count-1) {
            _rightAdLabel.text = _adTitleArray[rightImageIndex];
        }
    }
    _adScrollView.contentOffset = CGPointMake(UISCREENWIDTH, 0);
    
    //手动控制图片滚动应该取消那个三秒的计时器
    if (!_isTimeUp) {
        [_moveTime setFireDate:[NSDate dateWithTimeIntervalSinceNow:chageImageTime]];
    }
    _isTimeUp = NO;
}
@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

