//
//  MYCollectionViewCell.m
//  HappyPerson
//
//  Created by wei on 15/7/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MYCollectionViewCell.h"

@interface MYCollectionViewCell ()
{

}

@end

@implementation MYCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        
        UIView *selectBackgroundView = [[UIView alloc] initWithFrame:frame];
        selectBackgroundView.backgroundColor = [UIColor lightGrayColor];
        self.selectedBackgroundView = selectBackgroundView;
        
//        UIImage *image = [MYAssistant imageWithContentsOfFile:@"icon_homepage_aroundjourneyCategory"];
        UIImage *image = [UIImage imageNamed:@"icon_homepage_aroundjourneyCategory"];
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        
        [_imageView setImage:image];
        //        [_imageView setImage:[UIImage imageNamed:@"icon_homepage_beautyCategory"]];
//        _imageView.backgroundColor = [UIColor blueColor];
        //        [self addSubview:_imageView];
        
        //        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame)+5, CGRectGetWidth(frame), 20)];
        _textLabel = [UILabel new];
        _textLabel.font = [UIFont systemFontOfSize:14.f];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
//        _textLabel.backgroundColor = [UIColor redColor];
        _textLabel.text = @"你猜我猜";

        [self addSubview:_textLabel];
        

        WS(ws);
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.mas_left).with.offset((frame.size.width-image.size.width)/2);
            make.top.equalTo(ws.mas_top).with.offset(10);
            make.right.equalTo(ws.mas_right).with.offset(-(frame.size.width-image.size.width)/2);
            make.bottom.equalTo(_textLabel.mas_top).with.offset(-5);
            make.size.mas_equalTo(CGSizeMake(image.size.width, image.size.height));
        }];
//        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, image.size.width, image.size.height)];
                [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.mas_left).with.offset(0);
            make.top.equalTo(_imageView.mas_bottom).with.offset(5);
            make.right.equalTo(ws.mas_right).with.offset(0);
            make.bottom.equalTo(ws.mas_bottom).with.offset(-5);
        }];
        
    }
    return self;
}
-(void)setModelItem:(NSString *)item
{
//    _imageName = item;
//    [_imageView setImage:[MYAssistant imageWithContentsOfFile:_imageName]];
    
    _labelName = item;
    _textLabel.text = _labelName;
    [self setNeedsDisplay];
    
    
}

-(NSString *)getModelItem
{
    return _imageName;
}


//-(void)setmodel:(MYItem *)item
//{
//    
//    _item = item;
//    NSLog(@"_item  %@",_item);
//    //        NSLog(@"itemcount is %i",[_item count]);
//    if (_item.imgUrl && _item.imgUrl.length > 0) {
//        [imageView sd_setImageWithURL:[NSURL URLWithString:[item imgUrl]] placeholderImage:[MYAssistant imageWithContentsOfFile:@"mobilenopic"]];
//    }else{
//        [imageView setImage:[MYAssistant imageWithContentsOfFile:@"mobilenopic"]];
//    }
//    if (_item.title && _item.title.length>0) {
//        textLabel.text = _item.title;
//    }
//    NSLog(@"textlabel.text   %@",textLabel.text);
//    [self setNeedsDisplay];
//    
//}
//-(MYItem *)getItem
//{
//    return _item;
//}

- (void)updateViewsCount
{
    [self setNeedsDisplay];
}


@end
