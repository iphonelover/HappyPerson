//
//  HPPerformanceTableCell.m
//  HappyPerson
//
//  Created by wei on 16/1/12.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPPerformanceTableCell.h"
#import "HPPerformanceArrayModel.h"
#import "HPPerformanceFlowLayout.h"
#import "HPPerformanceCollectionCell.h"
#import "HPPerformanceCollectionCellTwo.h"



#define CellIdentifier @"CellIdentifier1"
#define CellIdentifier2 @"CellIdentifier2"

typedef void(^PerformanceViewBlock)(NSString *toURL);

@interface HPPerformanceView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *performanceArray;
@property (nonatomic, copy) PerformanceViewBlock performanceViewBlock;


@end


@implementation HPPerformanceView


-(instancetype)initWithFrame:(CGRect)frame withArray:(NSMutableArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.performanceArray = array;
        HPPerformanceFlowLayout *flowLayout = [[HPPerformanceFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        [self addSubview:collectionView];
        [collectionView registerClass:[HPPerformanceCollectionCell class] forCellWithReuseIdentifier:CellIdentifier];
        [collectionView registerClass:[HPPerformanceCollectionCellTwo class] forCellWithReuseIdentifier:CellIdentifier2];
        
    }
    return self;
}

-(NSMutableArray *)performanceArray
{
    if (!_performanceArray) {
        _performanceArray = [[NSMutableArray alloc] init];
    }
    return _performanceArray;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        HPPerformanceCollectionCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        collectionCell.layer.borderColor = [UIColor colorWithHexString:@"#ffffff"].CGColor;
        collectionCell.layer.borderWidth = 2.0f;
        collectionCell.backgroundColor = [UIColor colorWithHexString:@"#f9f9f9"];
        
        //    collectionCell.col
        if ([_performanceArray count] > indexPath.row) {
            [collectionCell setModel:[_performanceArray objectAtIndex:indexPath.row]];
        }
        return collectionCell;
    }else{
        HPPerformanceCollectionCellTwo *collectionCellTwo = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier2 forIndexPath:indexPath];
        collectionCellTwo.layer.borderColor = [UIColor colorWithHexString:@"#ffffff"].CGColor;
        collectionCellTwo.layer.borderWidth = 2.0f;
        collectionCellTwo.backgroundColor = [UIColor colorWithHexString:@"#f9f9f9"];
        
        //    collectionCell.col
        if ([_performanceArray count] > indexPath.row) {
            [collectionCellTwo setModel:[_performanceArray objectAtIndex:indexPath.row]];
        }
        return collectionCellTwo;

    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if ([_performanceArray count] > indexPath.row) {
        
        
        HPPerformanceArrayModel *item = [_performanceArray objectAtIndex:indexPath.row];
        if (self.performanceViewBlock) {
            NSString *tplurl = item.tpurl;
            NSURLComponents *c = [NSURLComponents componentsWithString:tplurl];
            NSString *d = c.percentEncodedQuery;
            NSString *equalSign = @"=";
            if ([d containsString:equalSign]) {
                NSRange range = [d rangeOfString:equalSign];
                NSString *nextURL = [d substringFromIndex:range.location+1];
                self.performanceViewBlock([NSString stringWithFormat:@"%@",nextURL]);
                
            }
        }
    }
    
    
}


@end

@interface HPPerformanceTableCell ()

@property (nonatomic, strong) HPPerformanceView *preformanceView;

@end


@implementation HPPerformanceTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withArray:(NSMutableArray *)array
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        //        [self performanceLayoutWithArray:performanceArray];
        
        _preformanceView = [[HPPerformanceView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 170) withArray:array];
        [self.contentView addSubview:_preformanceView];
        
        WS(weakSelf);
        _preformanceView.performanceViewBlock = ^(NSString *toURL){
            if (weakSelf.collectionCellBlock) {
                weakSelf.collectionCellBlock(toURL);
            }
        };
        WS(ws)
        UIView *footerView = [UIView new];
        footerView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
        //        footerView.backgroundColor = [UIColor yellowColor];
        
        //        footerView.layer.borderWidth = 1;
        //        footerView.layer.borderColor = [UIColor yellowColor].CGColor;
        [self.contentView addSubview:footerView];
        
        [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(0);
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(0);
            make.height.equalTo(@10);
        }];
        
    }
    return self;
}


-(void)setFrame:(CGRect)frame
{
    
    frame.size.width= kMainScreenWidth;//VIEW_WIDTH这里是屏幕竖屏时的宽
    
    
    [super setFrame:frame];
    
}


@end
