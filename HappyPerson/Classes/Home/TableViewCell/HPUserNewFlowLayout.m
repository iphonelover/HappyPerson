//
//  HPFlowLayout.m
//  HappyPerson
//
//  Created by wei on 16/1/8.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPUserNewFlowLayout.h"

@interface HPUserNewFlowLayout ()

@property (nonatomic, strong) NSMutableArray *attrsArray;

@end

@implementation HPUserNewFlowLayout

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}


-(void)prepareLayout
{
    [super prepareLayout];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //通过attrs设置没给cell里面的属性 例如frame
        UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        //计算有几行，一行里有2列
        NSInteger rows = count/2 + count%2;
        CGFloat height = self.collectionView.frame.size.height/rows;
        CGFloat width = kMainScreenWidth;
        if (i == 0) {
            CGFloat layoutX = 0;
            CGFloat layoutY = 0;
            attrs.frame = CGRectMake(layoutX, layoutY, width, height);
        }else if (i == 1){
            CGFloat layoutX = 0;
            CGFloat layoutY = height;
            attrs.frame = CGRectMake(layoutX, layoutY, width/2, height);
        }else if (i == 2){
            CGFloat layoutX = width/2;
            CGFloat layoutY = height;
            attrs.frame = CGRectMake(layoutX, layoutY, width/2, height);
        }else if (i == 3){
            CGFloat layoutX = 0;
            CGFloat layoutY = height*2;
            attrs.frame = CGRectMake(layoutX, layoutY, width/2, height);
        }else if (i == 4){
            CGFloat layoutX = width/2;
            CGFloat layoutY = height*2;
            attrs.frame = CGRectMake(layoutX, layoutY, width/2, height);
        }
        
        [self.attrsArray addObject:attrs];

    }
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attrsArray;
}

-(CGSize)collectionViewContentSize
{
    int count = (int)[self.collectionView numberOfItemsInSection:0];
    
    //2表示每行最多两列
    int rows = count/2+count%2;
    CGFloat rowH = 80;
    return CGSizeMake(0, rows*rowH);
}

@end
