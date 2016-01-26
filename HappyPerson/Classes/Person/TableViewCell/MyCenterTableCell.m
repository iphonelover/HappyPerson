//
//  MyCenterTableCell.m
//  HappyPerson
//
//  Created by wei on 15/7/28.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "MyCenterTableCell.h"


#define kSetMenuTextFont [UIFont systemFontOfSize:15.f]
#define kSetMenuTextColor [UIColor blackColor]
#define kSetMenuTextMaxWidth  kMainScreenWidth-60
#define kSetMenuTextAndIconIndent 30
#define kSetTableWidth kMainScreenWidth

/*
@interface SettingCellContentView : UIView
{
    MyCenterTableCell *_settingCell;
    
}

@end


@implementation SettingCellContentView

-(id)initWithFrame:(CGRect)frame withSettingCell:(MyCenterTableCell *)cell
{
    self = [super initWithFrame:frame];
    if (self) {
        _settingCell = cell;
        self.backgroundColor = [UIColor clearColor];;
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    NSString *info = [_settingCell getInfo];
    if (info && info.length > 0) {
        CGFloat iconIndent = 10.f;
        NSArray *imgAndText = [info componentsSeparatedByString:@" "];
        UIImage *img = [UIImage imageNamed:[imgAndText objectAtIndex:1]];
        NSString *text = [NSString stringWithFormat:@"%@",[imgAndText objectAtIndex:0]];
        
        CGFloat indentMargin = 0.f;
        [img drawAtPoint:CGPointMake(iconIndent, (CGRectGetHeight(rect)-img.size.height)/2)];
        NSAttributedString *attString = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: kSetMenuTextFont,NSForegroundColorAttributeName:kSetMenuTextColor}];
        CGSize textSize = [attString boundingRectWithSize:CGSizeMake(kSetMenuTextMaxWidth, [kSetMenuTextFont lineHeight]) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) context:NULL].size;
        [attString drawWithRect:CGRectMake(iconIndent+indentMargin+img.size.width+kSetMenuTextAndIconIndent, (CGRectGetHeight(rect)-textSize.height)/2+3, textSize.width, textSize.height) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:NULL];
        if (!_settingCell.selected) {
            UIImage *line = [UIImage imageWithName:@"line"];
            [line drawInRect:CGRectMake(0, (CGRectGetHeight(rect)-line.size.height)+3, kSetTableWidth, line.size.height)];
        }
    }
}

@end
 */

@interface MyCenterTableCell (){
    NSString *_info;
//    SettingCellContentView *_cellContentView;
}

@end
@implementation MyCenterTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        _cellContentView = [[SettingCellContentView alloc] initWithFrame:CGRectMake(0, 0, kMainScreenWidth, kCellContentViewHeight) withSettingCell:self];
//        [self.contentView addSubview:_cellContentView];
//        
//        UIView *selectView = [[UIView alloc] initWithFrame:_cellContentView.frame];
//        selectView.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
//        self.selectedBackgroundView = selectView;
    }
    
    return self;
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
//    [_cellContentView setNeedsDisplay];
}

-(void)setModel:(NSString *)info
{
    _info = info;
//    [_cellContentView setNeedsDisplay];
}

-(NSString *)getInfo
{
    return _info;
}


@end
