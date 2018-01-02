//
//  LotteryDetailViewController.m
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 1/2/18.
//  Copyright © 2018 OD INTERNATIONAL 3. All rights reserved.
//

#import "LotteryDetailViewController.h"

@interface LotteryDetailViewController ()

@end

@implementation LotteryDetailViewController{
    
    NSArray * lotteryList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger temp = 0;
    if (section == 0) {
        temp = 1;
    }
    if (section == 1) {
        temp = 15;
        temp = 0;
    }
    //temp = 0;
    return temp;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //Title
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
        return cell;
    }
    
    if (indexPath.section == 1) {
        //Cotent
    }
    return nil;
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
