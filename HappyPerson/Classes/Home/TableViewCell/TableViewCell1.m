//
//  TableViewCell1.m
//  HappyPerson
//
//  Created by wei on 15/7/20.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "TableViewCell1.h"

@interface TableViewCell1 ()

//@property (nonatomic, strong) UIImageView *myImageView;
//@property (nonatomic, strong) UILabel *myTitleLabel;
//@property (nonatomic, strong) UILabel *myDetailLabel;

@property (nonatomic,strong) UILabel *title;
@property (nonatomic,strong) UILabel *descript;
@property (nonatomic,strong) UIImageView *picture;

@end

@implementation TableViewCell1

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        UIView *selectedView = [[UIView alloc] initWithFrame:self.contentView.bounds];
        selectedView.backgroundColor = [UIColor colorWithRed:0.043 green:0.361 blue:0.980 alpha:1.000];//#4cc2ee  #00c3f1
        self.selectedBackgroundView = selectedView;
        
        _picture = [UIImageView new];
        [_picture setImage:[UIImage imageNamed:@"about_criticism"]];
        _title = [UILabel new];
        _title.text = @"标题";
        _descript = [UILabel new];
        _descript.text = @"详情";
        UIView *lineView= [UIView new];
        lineView.backgroundColor = [UIColor lightGrayColor];
        
        
        [self.contentView addSubview:_picture];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_descript];
        [self.contentView addSubview:lineView];
        
        __weak __typeof(self) weakSelf = self;
        [_picture mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.contentView.mas_left).with.offset(10);
            make.right.equalTo(_title.mas_left).with.offset(-10);
            make.top.equalTo(weakSelf.contentView.mas_top).with.offset(10);
            //            make.bottom.equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
            make.bottom.equalTo(lineView.mas_top).with.offset(-9);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_picture.mas_right).with.offset(10);
            make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-10);
            make.top.equalTo(weakSelf.contentView.mas_top).with.offset(10);
            make.bottom.equalTo(_descript.mas_top).with.offset(-20);
        }];
        
        [_descript mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_picture.mas_right).with.offset(10);
            make.top.equalTo(_title.mas_bottom).with.offset(20);
            make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-10);
            //            make.bottom.equalTo(weakSelf.contentView.mas_bottom).with.offset(-10);
            make.bottom.equalTo(lineView.mas_top).with.offset(-9);
        }];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_picture.mas_bottom).with.offset(9);
            make.left.equalTo(weakSelf.contentView).with.offset(0);
            make.right.equalTo(weakSelf.contentView).with.offset(0);
            make.size.mas_equalTo(CGSizeMake([[UIScreen mainScreen] bounds].size.width, 0.5));
        }];
        
        
    }
    
    return self;
}

//-(void)setModel:(id)item withSection:(NSInteger)sectionIndex
//{
//    _item = item;
//    if (sectionIndex == 0) {
//        _groupImageView.image = [MYAssistant imageWithContentsOfFile:@"make_complaints_male"];
//        //判断获取的_item.filmName是否存在，长度是否大于 0
//        _groupTitleLabel.text = [NSString stringWithFormat:@"_item.filmName"];
//        _groupDetailLabel.text = [NSString stringWithFormat:@"今日发表：%@",@"_item.topic 261"];
//        
//    }else if(sectionIndex == 1){
//        _groupTitleLabel.text = [NSString stringWithFormat:@"_item.filmName"];
//        _groupDetailLabel.text = [NSString stringWithFormat:@"成员：%@ | 主题：%@",@"_item.member 1.7k",@"_item.topic 261"];
//    }else if (sectionIndex == 2){
//        _groupTitleLabel.text = [NSString stringWithFormat:@"_item.filmName"];
//        _groupDetailLabel.text = [NSString stringWithFormat:@"成员：%@ ",@"261"];
//    }
//    
//    //    if ([_item movieImg]&&[_item movieImg].length > 0) {
//    //        [_groupImageView sd_setImageWithURL:[NSURL URLWithString:[_item movieImg]] placeholderImage:[FFAssistant imageWithContentsOfFile:@"Icon"]];
//    //    }else{
//    //        [_groupImageView setImage:[FFAssistant imageWithContentsOfFile:@"Icon"]];
//    //    }
//    //    if ([_item movieName] && [_item movieName].length > 0) {
//    //        _groupTitleLabel.text = [_item movieName];
//    //    }
//    //    if ([_item movieDescription] && [_item movieDescription].length > 0) {
//    //        _groupDetailLabel.text = [_item movieDescription];
//    //    }
//    [self.contentView setNeedsDisplay];
//}
//-(id)getItem
//{
//    return _item;
//}

//UITableViewCell的默认值是(320,44),以下是在大屏上宽度的解决方法
-(void)setFrame:(CGRect)frame
{
    
    frame.size.width= kMainScreenWidth;//VIEW_WIDTH这里是屏幕竖屏时的宽
    
    [super setFrame:frame];
    
}


@end
