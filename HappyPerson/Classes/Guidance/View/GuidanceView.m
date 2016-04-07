//
//  GuidanceView.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "GuidanceView.h"

@interface GuidanceView () <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIButton *doneButton;

@property (strong, nonatomic) UIView *viewOne;
@property (strong, nonatomic) UIView *viewTwo;
@property (strong, nonatomic) UIView *viewThree;
@property (strong, nonatomic) UIView *viewFour;


@end

@implementation GuidanceView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.frame];
        backgroundImageView.image = [UIImage imageNamed:@"Intro_Screen_Background"];
        [self addSubview:backgroundImageView];
        
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
    
        [self.scrollView addSubview:self.viewOne];
        [self.scrollView addSubview:self.viewTwo];
        [self.scrollView addSubview:self.viewThree];
        [self.scrollView addSubview:self.viewFour];
        
        
        //Done Button
        [self addSubview:self.doneButton];
            

    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    NSLog(@"self.scrollview.contentoffset.x is %f   pageFraction is %f  pageWidth is %f",self.scrollView.contentOffset.x,pageFraction,pageWidth);
    self.pageControl.currentPage = roundf(pageFraction);
    
}

/*!
 *    @brief  <#Description#>
 *
 *    @return <#return value description#>
 *
 *    @since <#version number#>
 */
-(UIView *)viewOne {
    if (!_viewOne) {
    
        _viewOne = [[UIView alloc] initWithFrame:self.frame];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:@"Pixifly"];
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:40.0];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewOne addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.1, self.frame.size.width*.8, self.frame.size.width)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"Intro_Screen_One"];
        [_viewOne addSubview:imageview];
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:@"Description for First Screen."];
        descriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0];
        descriptionLabel.textColor = [UIColor whiteColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewOne addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
        descriptionLabel.center = labelCenter;
        
    }
    return _viewOne;
    
}

-(UIView *)viewTwo {
    if (!_viewTwo) {
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height;
        
        _viewTwo = [[UIView alloc] initWithFrame:CGRectMake(originWidth, 0, originWidth, originHeight)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:@"DropShot"];
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:40.0];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewTwo addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.1, self.frame.size.width*.8, self.frame.size.width)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"Intro_Screen_Two"];
        [_viewTwo addSubview:imageview];
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:@"Description for Second Screen."];
        descriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0];
        descriptionLabel.textColor = [UIColor whiteColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewTwo addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
        descriptionLabel.center = labelCenter;
    }
    return _viewTwo;
    
}

-(UIView *)viewThree{
    
    if (!_viewThree) {
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height;
        
        _viewThree = [[UIView alloc] initWithFrame:CGRectMake(originWidth*2, 0, originWidth, originHeight)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:@"Shaktaya"];
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:40.0];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewThree addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.1, self.frame.size.width*.8, self.frame.size.width)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"Intro_Screen_Three"];
        [_viewThree addSubview:imageview];
        
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:@"Description for Third Screen."];
        descriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0];
        descriptionLabel.textColor = [UIColor whiteColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewThree addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
        descriptionLabel.center = labelCenter;
    }
    return _viewThree;
    
}

-(UIView *)viewFour {
    if (!_viewFour) {
    
        CGFloat originWidth = self.frame.size.width;
        CGFloat originHeight = self.frame.size.height;
        
        _viewFour = [[UIView alloc] initWithFrame:CGRectMake(originWidth*3, 0, originWidth, originHeight)];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.05, self.frame.size.width*.8, 60)];
        titleLabel.center = CGPointMake(self.center.x, self.frame.size.height*.1);
        titleLabel.text = [NSString stringWithFormat:@"Punctual"];
        titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:40.0];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment =  NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [_viewFour addSubview:titleLabel];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.1, self.frame.size.width*.8, self.frame.size.width)];
        imageview.contentMode = UIViewContentModeScaleAspectFit;
        imageview.image = [UIImage imageNamed:@"Intro_Screen_Four"];
        [_viewFour addSubview:imageview];
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.7, self.frame.size.width*.8, 60)];
        descriptionLabel.text = [NSString stringWithFormat:@"Description for Fourth Screen."];
        descriptionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0];
        descriptionLabel.textColor = [UIColor whiteColor];
        descriptionLabel.textAlignment =  NSTextAlignmentCenter;
        descriptionLabel.numberOfLines = 0;
        [descriptionLabel sizeToFit];
        [_viewFour addSubview:descriptionLabel];
        
        CGPoint labelCenter = CGPointMake(self.center.x, self.frame.size.height*.7);
        descriptionLabel.center = labelCenter;
        
    }
    return _viewFour;
    
}

-(UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        [_scrollView setDelegate:self];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setContentSize:CGSizeMake(self.frame.size.width*4, self.scrollView.frame.size.height)];
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    return _scrollView;
}

-(UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.8, self.frame.size.width, 10)];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000]];
        [_pageControl setNumberOfPages:4];
    }
    return _pageControl;
}

-(UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width*.1, self.frame.size.height*.85, self.frame.size.width*.8, 60)];
        [_doneButton setTintColor:[UIColor whiteColor]];
        [_doneButton setTitle:@"Let's Go!" forState:UIControlStateNormal];
        [_doneButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18.0]];
        [_doneButton setBackgroundColor:[UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000]];
        [_doneButton addTarget:self.delegate action:@selector(onDoneButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [_doneButton.layer setCornerRadius:5];
        [_doneButton setClipsToBounds:YES];
    }
    return _doneButton;
}

@end
