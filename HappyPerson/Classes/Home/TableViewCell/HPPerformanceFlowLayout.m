//
//  HPPerformanceFlowLayout.m
//  HappyPerson
//
//  Created by wei on 16/1/14.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "HPPerformanceFlowLayout.h"

@interface HPPerformanceFlowLayout ()

@property (nonatomic, strong) NSMutableArray *attrsArray;

@end

@implementation HPPerformanceFlowLayout

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
        
        NSInteger rows = count/2 + count%2;
        //4代表距离上下两边的距离
        CGFloat height = self.collectionView.frame.size.height-10-4-4;
        NSLog(@"self.collectionView.frame is %@",NSStringFromCGRect(self.collectionView.frame));
        //4代表距离左右两边的距离
        CGFloat width = (kMainScreenWidth-4-4)/2;
        if (i == 0) {
            CGFloat layoutX = 4;
            CGFloat layoutY = 4;
            attrs.frame = CGRectMake(layoutX, layoutY, width, height);
        }else if (i == 1){
            CGFloat layoutX = width+4;
            CGFloat layoutY = 4;
            attrs.frame = CGRectMake(layoutX, layoutY, width, height/2);
        }else if (i == 2){
            CGFloat layoutX = width+4;
            CGFloat layoutY = height/2+4;
            attrs.frame = CGRectMake(layoutX, layoutY, width, height/2);
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
    CGFloat rowWidth = kMainScreenWidth/2-4;
    return CGSizeMake(rows*rowWidth, 0);
}


@end
