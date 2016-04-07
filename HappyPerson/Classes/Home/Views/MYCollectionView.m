//
//  MYCollectionView.m
//  HappyPerson
//
//  Created by wei on 15/7/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MYCollectionView.h"
#import "MYFlowLayoutCollection.h"

@implementation MYCollectionView
- (id)initWithFrame:(CGRect)frame withFlowLayout:(UICollectionViewFlowLayout*)flowLayout
{
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


@end
