//
//  GuidanceViewController.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "GuidanceViewController.h"
#import "GuidanceImage.h"
#import "GuidanceScrollView.h"

@interface GuidanceViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIButton *skipBtn;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic,weak) GuidanceScrollView *scrollView;

@property (nonatomic,copy) void(^enterBlock)();

@property (nonatomic, strong) NSArray *imageModels;



@end

@implementation GuidanceViewController



+(id)guidanceWithModels:(NSArray *)guidanceModels enterBlock:(id)enterBlock
{
    GuidanceViewController *guidVC = [[GuidanceViewController alloc] init];
    
    guidVC.imageModels= guidanceModels;
    
    guidVC.enterBlock =enterBlock;
    
    return guidVC;
}



-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    
    //初始化Scrollview
    [self setScrollView];
    
    _skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_skipBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    _skipBtn.layer.borderWidth = 1.0f;
    _skipBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [_skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _skipBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    _skipBtn.alpha = 0;
    [_skipBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_skipBtn];
    
    
    
    WS(weakSelf);
    [_skipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).with.offset(100);
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-100);
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);
        make.size.mas_equalTo(CGSizeMake(70, 30));
    }];

    
    _pageControl = [UIPageControl new];
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000]];
    [_pageControl setNumberOfPages:3];
    [self.view addSubview:_pageControl];
    
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_left).with.offset(80);
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-80);
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-100);
        make.height.mas_equalTo(@40);
    }];
    
}

#pragma mark - 是否还有下一页
-(BOOL)isNext:(UIPageControl *)pageControl
{
    return  pageControl.numberOfPages > pageControl.currentPage +1;
}

#pragma mark - 是否是最后一页
-(BOOL)isLast:(UIPageControl *)pageControl
{
    return pageControl.numberOfPages == pageControl.currentPage + 1;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    CGFloat pageWidth = CGRectGetWidth(self.view.bounds);
    
    self.pageControl.currentPage = scrollView.contentOffset.x/(scrollView.contentSize.width/3);
    NSLog(@"pageControl.currentPage %ld",(long)self.pageControl.currentPage);
//    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
//    NSLog(@"self.scrollview.contentoffset.x is %f   pageFraction is %f  pageWidth is %f",self.scrollView.contentOffset.x,pageFraction,pageWidth);
    
//    self.pageControl.currentPage = roundf(pageFraction);
    [self didChangePagesWithScrollView:scrollView];
    
}

-(void)didChangePagesWithScrollView:(UIScrollView *)pageScrollView
{
    if ([self isLast:self.pageControl]) {
        if (self.pageControl.alpha == 1) {
            self.pageControl.alpha = 0;
            [UIView animateWithDuration:0.4 animations:^{
                self.pageControl.alpha = 0;
                self.skipBtn.alpha = 1;
            }];
        }
    }else{
        if (self.pageControl.alpha == 0) {
            [UIView animateWithDuration:0.4 animations:^{
                self.skipBtn.alpha = 0;
                self.pageControl.alpha = 1;
            }];
        }
    }
}

#pragma mark - 最后一张引导页向左滑动时 进入程序主页
//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
//    if ([scrollView.panGestureRecognizer translationInView:scrollView.superview].x < 0) {
//        if (_pageControl.numberOfPages <= _pageControl.currentPage+1) {
//            [self dismiss];
//        }
//    }
//}





#pragma mark - 初始化scrollview
-(void)setScrollView{
    
    //添加scrollView
    GuidanceScrollView *scrollView = [[GuidanceScrollView alloc] init];
    
    _scrollView = scrollView;
    _scrollView.delegate =self;
    
    //添加
    [self.view addSubview:scrollView];
    
    //添加约束
    [scrollView masViewAddConstraintMakeEqualSuperViewWithInsets:UIEdgeInsetsZero];
    
    //添加图片
    [self imageViewsPrepare];
    
    }




#pragma mark - 添加照片
-(void)imageViewsPrepare{
    
    [self.imageModels enumerateObjectsUsingBlock:^(GuidanceImage *guidImage, NSUInteger idx, BOOL *stop) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        
        //设置图片
        imageV.image = guidImage.scrollViewImage;
        
        //记录tag
        imageV.tag = idx;
        NSLog(@"imageV.tag  is %ld",imageV.tag );
        
        
        
        [_scrollView addSubview:imageV];
        if(imageV.tag ==2) {
            
//                        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
//                        btn.layer.borderWidth = 1.0f;
//                        btn.layer.cornerRadius = 4.0f;
//                        [btn setTitle:@"立即体验" forState:UIControlStateNormal];
//                        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//                        [self.view addSubview:btn];
            
            
            //开启交互
            imageV.userInteractionEnabled = YES;
            
            //            //添加手势
            //            [imageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)]];
        }
    }];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
//    btn.layer.borderWidth = 1.0f;
//    btn.layer.cornerRadius = 4.0f;
//    [btn setTitle:@"立即体验" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
//    [_scrollView addSubview:btn];

}

-(void)click:(UIButton *)btn
{
    [self dismiss];
}

//-(void)gestureAction:(UITapGestureRecognizer *)tap{
//    
//    UIView *tapView = tap.view;
//    
//    //禁用
//    tapView.userInteractionEnabled = NO;
//    
//    if(UIGestureRecognizerStateEnded == tap.state) [self dismiss];
//}

-(void)dismiss{
    
    if(self.enterBlock != nil) _enterBlock();
}

@end
