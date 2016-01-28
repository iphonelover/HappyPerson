//
//  MoreTableCell.m
//  HappyPerson
//
//  Created by wei on 16/1/26.
//  Copyright © 2016年 shuji. All rights reserved.
//

#import "MoreTableCell.h"
#import "HPSwitch.h"

@interface MoreTableCell (){
    UILabel *_title;
    UIImageView *_imgView;
    NSString *_info;
    UIView *_seperateLine;
}

@property (nonatomic, strong) HPSwitch *hpSwitch;

@end

@implementation MoreTableCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteCache:) name:@"DELETECACHE" object:nil];
        _title = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 150, 24)];
        _title.font = [UIFont systemFontOfSize:15.f];
        _title.textColor = [UIColor blackColor];
        _title.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_title];
        
        
        UIImage *image = [HPAssistant imageWithContentsOfFile:@"icon_cell_rightArrow"];

        
        CGFloat wsitchWidth = 62.0f;
        _hpSwitch = [[HPSwitch alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)-wsitchWidth-20, (CGRectGetHeight(self.bounds)-31)/2, wsitchWidth, 31)];
        _hpSwitch.hidden = YES;
        [self.contentView addSubview:_hpSwitch];
        
        
        NSString *rootPath = HPCachesPath;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        float fileSize = 0.0;
        if ([fileManager fileExistsAtPath:rootPath]) {
            NSArray *childFiles = [fileManager subpathsAtPath:rootPath];
            for (NSString *fileName in childFiles) {
                NSString *fileFullPath = [rootPath stringByAppendingPathComponent:fileName];
                fileSize += [HPAssistant fileSizeAtPath:fileFullPath];
            }
            fileSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
        }

        _cache = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.bounds)-image.size.width-90, 13, 70, 20)];
        _cache.textAlignment = NSTextAlignmentRight;
        _cache.font = [UIFont systemFontOfSize:12.f];
        _cache.textColor = [UIColor grayColor];
        _cache.text = [NSString stringWithFormat:@"%.2fM",fileSize];
        _cache.hidden = YES;
        [self.contentView addSubview:_cache];
        
        _imgView = [[UIImageView alloc] initWithImage:image];
        _imgView.frame = CGRectMake(CGRectGetWidth(self.bounds)-image.size.width-10, (CGRectGetHeight(self.bounds)-image.size.height)/2, image.size.width, image.size.height);
        [self.contentView addSubview:_imgView];
        
        _seperateLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.contentView.frame)-1, kMainScreenWidth, 1)];
        _seperateLine.backgroundColor = [UIColor colorWithHexString:@"e0e0df"];
        [self.contentView addSubview:_seperateLine];

        
        UIView *selectView = [[UIView alloc] initWithFrame:self.contentView.bounds];
        selectView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
        self.selectedBackgroundView = selectView;
        
        
        
    }
    return self;
}

-(void)setModel:(NSString *)info withSection:(NSInteger)sectionIndex withRow:(NSInteger)rowIndex
{
    _title.text = info;
    if (sectionIndex==1) {
        if (rowIndex == 0) {
            _hpSwitch.hidden = NO;
            _imgView.hidden = YES;
            [_hpSwitch addTarget:self action:@selector(switchEvent:) forControlEvents:UIControlEventValueChanged];
        }
        if (rowIndex == 4) {
            _hpSwitch.hidden = YES;
            _cache.hidden = NO;
            
        }
    }
    [self.contentView setNeedsDisplay];
    
}

-(void)deleteCache:(NSNotification *)notify
{
    NSLog(@"deleteCache");
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:HPCachesPath]) {
        NSArray *files = [fileManager subpathsAtPath:HPCachesPath];
        for (NSString *fileName in files) {
            NSString *fileFullPath = [HPCachesPath stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:fileFullPath error:nil];
        }
    }
    _cache.text = @"0.0M";
}

-(void)switchEvent:(id)sender
{
    NSLog(@"SSSSS");
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
