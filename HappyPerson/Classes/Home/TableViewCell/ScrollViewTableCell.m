//
//  ScrollViewTableCell.m
//  HappyPerson
//
//  Created by wei on 15/11/9.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "ScrollViewTableCell.h"
#import "HPButtonView.h"

@interface ScrollViewTableCell ()<UIScrollViewDelegate>

@property (nonatomic,strong) NSArray *imgTitleArray;
@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,strong) UIView *rightView;
@property (nonatomic,strong) UIPageControl *pageControl;

@end

@implementation ScrollViewTableCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withPlist:(NSArray *)imgAndTitleArray
{
    _imgTitleArray = imgAndTitleArray;
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIScrollView *scrollView= [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 180)];
        scrollView.delegate = self;
        scrollView.contentSize = CGSizeMake(2*kMainScreenWidth, 160);
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:scrollView];
        
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 160)];
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(kMainScreenWidth, 0, kMainScreenWidth, 160)];
        [scrollView addSubview:_leftView];
        [scrollView addSubview:_rightView];
        
        for (int i = 0; i < 16; i++) {
            if (i < 4) {
                CGRect frame = CGRectMake(i*kMainScreenWidth/4, 0, kMainScreenWidth/4, 80);
                NSString *imageStr = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:0];
                NSString *title = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:1];
                HPButtonView *buttonView = [[HPButtonView alloc] initWithFrame:frame withImage:imageStr withTitle:title];
                buttonView.tag = TAGVALUE + i;
                [_leftView addSubview:buttonView];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapButtonView:)];
                [buttonView addGestureRecognizer:tap];
            }else if (i < 8){
                CGRect frame = CGRectMake((i-4)*kMainScreenWidth/4, 80, kMainScreenWidth/4, 80);
                NSString *imageStr = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:0];
                NSString *title = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:1];
                HPButtonView *buttonView = [[HPButtonView alloc] initWithFrame:frame withImage:imageStr withTitle:title];
                buttonView.tag = TAGVALUE + i;
                [_leftView addSubview:buttonView];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapButtonView:)];
                [buttonView addGestureRecognizer:tap];
            }else if (i < 12){
                CGRect frame = CGRectMake((i-8)*kMainScreenWidth/4, 0, kMainScreenWidth/4, 80);
                NSString *imageStr = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:0];
                NSString *title = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:1];
                HPButtonView *buttonView = [[HPButtonView alloc] initWithFrame:frame withImage:imageStr withTitle:title];
                buttonView.tag = TAGVALUE + i;
                [_rightView addSubview:buttonView];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapButtonView:)];
                [buttonView addGestureRecognizer:tap];
            }else if (i < 16){
                CGRect frame = CGRectMake((i-12)*kMainScreenWidth/4, 80, kMainScreenWidth/4, 80);
                NSString *imageStr = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:0];
                NSString *title = [[[_imgTitleArray objectAtIndex:i] componentsSeparatedByString:@" "] objectAtIndex:1];
                HPButtonView *buttonView = [[HPButtonView alloc] initWithFrame:frame withImage:imageStr withTitle:title];
                buttonView.tag = TAGVALUE + i;
                [_rightView addSubview:buttonView];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapButtonView:)];
                [buttonView addGestureRecognizer:tap];
            }
        }
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((kMainScreenWidth-40)/2, 160, 40, 20)];
        _pageControl.numberOfPages = 2;
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"#07bfb3"];
        _pageControl.pageIndicatorTintColor = [UIColor grayColor];
        [self addSubview:_pageControl];
        
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, _pageControl.frame.origin.y+20, kMainScreenWidth, 10)];
        footerView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
        [self addSubview:footerView];
        
    }
    return self;
}
#pragma mark - ScrollView Delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollViewWidth = scrollView.frame.size.width;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    int page = (offsetX + scrollViewWidth/2)/scrollViewWidth;
    _pageControl.currentPage = page;
}

#pragma mark - ButtonView点击事件
-(void)onTapButtonView:(UITapGestureRecognizer *)tapGesture
{
    if (self.buttonClickBlock) {
        self.buttonClickBlock(tapGesture.view.tag);
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
