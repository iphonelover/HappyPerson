//
//  MYFlowLayoutCollection.m
//  HappyPerson
//
//  Created by wei on 15/7/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MYFlowLayoutCollection.h"

@implementation MYFlowLayoutCollection

-(void)prepareLayout
{
    [super prepareLayout];
    //    self.itemSize = kFilterItemSize;
    //    self.sectionInset = UIEdgeInsetsMake(0.f, 10.0, 0.0, 10.0);
    //    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    //    self.headerReferenceSize = CGSizeMake(50.f, 40.f);
    //    self.footerReferenceSize = CGSizeMake(kApplecationScreenWidth, 20.f);
    
    self.itemSize = CGSizeMake(kMainScreenWidth/4, kMainScreenWidth/4);//item大小
    self.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);//设置section的边距
    self.minimumInteritemSpacing = -5;//item间距(最小值)
    self.minimumLineSpacing = 5;//行间距（最小值）
    
//    self.headerReferenceSize = CGSizeMake(300, 10);
    
    
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributesArray = [NSArray array];
    NSMutableArray* attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
//    for (UICollectionViewLayoutAttributes *attr in attributes) {
//        NSLog(@"%@", NSStringFromCGRect([attr frame]));
//    }
    NSLog(@"attributes is %lu",(unsigned long)[attributes count]);
    //从第二个循环到最后一个
    for(int i = 1; i < [attributes count]; ++i) {
        //当前attributes
        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
        //上一个attributes
        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
        //我们想设置的最大间距，可根据需要改
        NSInteger maximumSpacing = 0;
        //前一个cell的最右边
        NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        //如果当前一个cell的最右边加上我们想要的间距加上当前cell的宽度依然在contentSize中，我们改变当前cell的原点位置
        //不加这个判断的后果是，UICollectionView只显示一行，原因是下面所有cell的x值都被加到第一行最后一个元素的后面了
        if(origin + maximumSpacing + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width) {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = origin + maximumSpacing;
            currentLayoutAttributes.frame = frame;
            [attributesArray arrayByAddingObject:currentLayoutAttributes];
        }
    }
    return attributesArray;
}


@end
