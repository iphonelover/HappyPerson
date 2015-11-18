//
//  HPFamousTableCell.m
//  HappyPerson
//
//  Created by wei on 15/11/11.
//  Copyright © 2015年 shuji. All rights reserved.
//

#import "HPFamousTableCell.h"

@interface HPFamousTableCell ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation HPFamousTableCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //上方的小图
        UIImage *topImage = [HPAssistant imageWithContentsOfFile:@"main_famous"];
        UIImageView *topImageView = [UIImageView new];
        topImageView.image = topImage;
        [self addSubview:topImageView];
        
        WS(ws);
        [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(20);
            make.top.equalTo(ws).with.offset(7);
            make.size.mas_equalTo(CGSizeMake(78, 25));
        }];
        // imagViewAndLabel
        for (int i = 0; i < 3; i++) {
            //UIImageView和UILabel的背景
            UIView *backgroundView = [UIView new];
            backgroundView.tag = TAGVALUE+10+i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
            [backgroundView addGestureRecognizer:tap];
            [self addSubview:backgroundView];
            
            //上方的UIImageView
            UIImageView *topImageView = [UIImageView new];
            topImageView.tag = TAGVALUE+20+i;
            topImageView.contentMode = UIViewContentModeScaleAspectFit;
            [backgroundView addSubview:topImageView];
            
            //间隔UIView 小竖线
            UIView *seperateLine = [[UIView alloc] initWithFrame:CGRectMake(i*kMainScreenWidth/3-1, 45, 0.5, 65)];
            seperateLine.backgroundColor = [UIColor grayColor];
            [self addSubview:seperateLine];
            
            //下方的UILabel,new old
            
            UILabel *downNewLabel = [UILabel new];
            downNewLabel.tag = TAGVALUE+30+i;
            downNewLabel.textColor = [UIColor orangeColor];
            downNewLabel.textAlignment = NSTextAlignmentRight;
            [backgroundView addSubview:downNewLabel];
            
            UILabel *downOldLabel = [UILabel new];
            downOldLabel.tag = TAGVALUE+40+i;
            downOldLabel.textColor = [UIColor greenColor];
            downOldLabel.font = [UIFont systemFontOfSize:12.f];
            [backgroundView addSubview:downOldLabel];
            
            [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(backgroundView).with.offset(0);
                make.top.equalTo(backgroundView).with.offset(0);
                make.size.mas_equalTo(CGSizeMake(kMainScreenWidth/3, 50));
                make.bottom.equalTo(downNewLabel.mas_top).with.offset(0);
            }];
            
            [downNewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(backgroundView).with.offset(0);
                make.top.equalTo(topImageView.mas_bottom).with.offset(0);
                make.right.equalTo(downOldLabel.mas_left).with.offset(-5);
                make.size.mas_equalTo(CGSizeMake(backgroundView.frame.size.width/2, 30));
            }];
            
            [downOldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(downNewLabel.mas_right).with.offset(5);
                make.top.equalTo(topImageView.mas_bottom).with.offset(0);
                make.size.mas_equalTo(CGSizeMake(backgroundView.frame.size.width/2-5, 30));
            }];
            
        }
    }
    return self;
}

-(void)setModel:(id)item
{
    
}

-(id)getItem
{
    return nil;
}

-(void)tapView:(UITapGestureRecognizer *)tapGesture
{
    if (self.backgroundClickBlock) {
        self.backgroundClickBlock();
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
