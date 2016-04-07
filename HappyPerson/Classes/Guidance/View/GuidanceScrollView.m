//
//  GuidanceScrollView.m
//  HappyPerson
//
//  Created by wei on 15/6/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//


#import "GuidanceScrollView.h"

@implementation GuidanceScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //视图准备
        [self viewPrepare];
    }
    
    return self;
}



#pragma mark - 视图准备
-(void)viewPrepare{
    
    //开启分页
    self.pagingEnabled = YES;
    
    //隐藏各种条
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    //取消boundce
    self.bounces = NO;
}


/*
 
 layoutSubviews在以下情况下会被调用：
 
 1、init初始化不会触发layoutSubviews
 
 但是是用initWithFrame 进行初始化时，当rect的值不为CGRectZero时,也会触发
 
 2、addSubview会触发layoutSubviews
 
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
 
 4、滚动一个UIScrollView会触发layoutSubviews
 
 5、旋转Screen会触发父UIView上的layoutSubviews事件
 
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
 */


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    __block CGRect frame = self.bounds;
    
    __block NSUInteger count = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subView, NSUInteger idx, BOOL *stop) {
        
        if([subView isKindOfClass:[UIImageView class]]){
            
            CGFloat frameX = frame.size.width * idx;
            
            frame.origin.x = frameX;
            
            subView.frame = frame;
            
            count ++;
        }
    }];
    
    self.contentSize = CGSizeMake(frame.size.width * count, 0);
}

@end
