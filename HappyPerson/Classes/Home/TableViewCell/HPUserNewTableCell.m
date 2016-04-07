//
//  HPUserNewTableCell.m
//  HappyPerson
//
//  Created by wei on 15/12/28.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPUserNewTableCell.h"
#import "HPUserNewArraysModel.h"
#import "HPUserNewFlowLayout.h"
#import "HPUserNewCollectionCell.h"


#define CellIdentifier @"HPUserNewCollectionCell"

typedef void(^CollectionCellClick)(NSString *toURL);



@interface HPUserNewContentView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *userNewArray;
@property (nonatomic, copy) CollectionCellClick collectionCellClick;


-(instancetype)initWithFrame:(CGRect)frame withArray:(NSMutableArray *)array;

@end

@implementation HPUserNewContentView

-(instancetype)initWithFrame:(CGRect)frame withArray:(NSMutableArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userNewArray = array;
        HPUserNewFlowLayout *flowLayout = [[HPUserNewFlowLayout alloc] init];
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        [self addSubview:collectionView];
        [collectionView registerClass:[HPUserNewCollectionCell class] forCellWithReuseIdentifier:CellIdentifier];
        
    }
    return self;
}

-(NSMutableArray *)userNewArray
{
    if (!_userNewArray) {
        _userNewArray = [[NSMutableArray alloc] init];
    }
    return _userNewArray;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HPUserNewCollectionCell *collectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    collectionCell.layer.borderColor = [UIColor colorWithHexString:@"#e5e5e5"].CGColor;
    collectionCell.layer.borderWidth = 0.5f;
    collectionCell.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    
//    collectionCell.col
    if ([_userNewArray count] > indexPath.row) {
        [collectionCell setModel:[_userNewArray objectAtIndex:indexPath.row] withRow:indexPath.row];
    }
    
    return collectionCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    if ([_userNewArray count] > indexPath.row) {
        
    
    HPUserNewArraysModel *item = [_userNewArray objectAtIndex:indexPath.row];
    if (self.collectionCellClick) {
        NSString *tplurl = item.tplurl;
        NSURLComponents *c = [NSURLComponents componentsWithString:tplurl];
        NSString *d = c.percentEncodedQuery;
        NSString *equalSign = @"=";
        if ([d containsString:equalSign]) {
            NSRange range = [d rangeOfString:equalSign];
            NSString *nextURL = [d substringFromIndex:range.location+1];
            self.collectionCellClick([NSString stringWithFormat:@"%@",nextURL]);

        }
    }
    }
    
    
}


@end

@interface HPUserNewTableCell ()

@property (nonatomic, strong) HPUserNewContentView *userContentView;



@end

@implementation HPUserNewTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withArray:(NSMutableArray *)userNewArray
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _userContentView = [[HPUserNewContentView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, 240) withArray:userNewArray];
        [self.contentView addSubview:_userContentView];
        
        WS(weakSelf);
        _userContentView.collectionCellClick = ^(NSString *toURL){
            if (weakSelf.userNewTableCellBlock) {
                weakSelf.userNewTableCellBlock(toURL);
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
