//
//  LotteryDetailViewController.m
//  一路发
//
//  Created by 姚远 on 12/12/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "LotteryDetailViewController.h"
//#import "HMSegmentedControl.h"
@interface LotteryDetailViewController ()

@end

@implementation LotteryDetailViewController{
    CGSize screeSize;
    __weak IBOutlet HMSegmentedControl *segmentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screeSize = [[UIScreen mainScreen] bounds].size;
    [segmentView setSectionTitles:@[@"今日开奖", @"昨日开奖", @"前日开奖", @"更多查询"]];
//    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"今日开奖", @"昨日开奖", @"前日开奖", @"更多查询"]];
//    segmentedControl.frame = CGRectMake(0, 10,screeSize.width, 60);
    [segmentView addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:segmentedControl];
    // Do any additional setup after loading the view.
}
-(IBAction)segmentedControlChangedValue:(id)sender{
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.strURL]]];
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
