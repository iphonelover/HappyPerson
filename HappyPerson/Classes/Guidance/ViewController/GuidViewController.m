//
//  GuidViewController.m
//  HappyPerson
//
//  Created by wei on 15/10/8.
//  Copyright (c) 2015年 shuji. All rights reserved.
//

#import "GuidViewController.h"
#import "GuidanceView.h"

@interface GuidViewController ()
@property (nonatomic, strong) GuidanceView *guidanceView;


@end

@implementation GuidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.guidanceView = [[GuidanceView alloc] initWithFrame:self.view.frame];
    self.guidanceView.delegate = self;
    self.guidanceView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.guidanceView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
