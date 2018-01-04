//
//  LotteryDetailViewController.m
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 1/2/18.
//  Copyright © 2018 OD INTERNATIONAL 3. All rights reserved.
//

#import "LotteryDetailViewController.h"
#import "LotteryTestData.h"
#import "FTTableViewCell.h"
#import "LFFunctions.h"
#import "SSCTableViewCell.h"
#import "DRPLoadingSpinner.h"
@interface LotteryDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;

@end

@implementation LotteryDetailViewController{
    
    NSArray * lotteryList;
    NSDictionary * dict;
    AppDataSocketConnector * connector;
    NSString * numStrPool;
    NSArray * numberArrayPool;
    
    NSTimer * timer;
    
    NSInteger count_minute;
    NSInteger count_second;
    
    DRPLoadingSpinner * spinner;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //lotteryList = [LotteryTestData getFTList];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left-arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(didPushBack:)];
    self.title = [self.lottery objectForKey:@"title"];
    connector = [[AppDataSocketConnector alloc] initWithDelegate:self];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    spinner = [[DRPLoadingSpinner alloc] initWithFrame:CGRectMake((screenRect.size.width/2)-25, (screenRect.size.height/2)-25, 50, 50)];
    [self.view addSubview:spinner];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestLotteryDetail];
    [self configCountDownLabel];
}
-(void) requestLotteryDetail{
    [connector sendNormalRequestWithPack:@{
                                           @"lottery_id":[self.lottery objectForKey:@"lottery_id"]
                                           }
                          andServiceCode:@"" andCustomerTag:0];
}
-(IBAction)didPushBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return lotteryList?2:1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger temp = 0;
    if (section == 0) {
        temp = 1;
    }
    if (section == 1) {
        temp = lotteryList.count;
    }
    return temp;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //Title
        if ([self.mode isEqualToString:@"SSC"]) {
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ssctCell"];
            cell.userInteractionEnabled = NO;
            return cell;
        }
        if ([self.mode isEqualToString:@"FT"]) {
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            cell.userInteractionEnabled = NO;
            return cell;
        }
       
    }
    
    if (indexPath.section == 1) {
        //Cotent
        if ([self.mode isEqualToString:@"FT"]) {
            FTTableViewCell * cell = (FTTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"contentCell"];
            dict = [lotteryList objectAtIndex:indexPath.row];
            numStrPool = [dict objectForKey:@"number"];
            numberArrayPool = [numStrPool componentsSeparatedByString:@" "];
            [cell.firstBall setTitle:[numberArrayPool objectAtIndex:0] forState:UIControlStateNormal];
            [cell.secondBall setTitle:[numberArrayPool objectAtIndex:1] forState:UIControlStateNormal];
            [cell.thirdBall setTitle:[numberArrayPool objectAtIndex:2] forState:UIControlStateNormal];
            
            cell.sumLabel.text = [NSString stringWithFormat:@"%d",[LFFunctions getSumOfStringArray:numberArrayPool]];
            cell.typeLabel.text = [LFFunctions getFTIdentifyString:numberArrayPool];
            [cell.typeLabel setTextColor:[UIColor lightGrayColor]];
            if ([cell.typeLabel.text isEqualToString:@"两连号"]) {
                [cell.typeLabel setTextColor:[UIColor blueColor]];
            }
            if ([cell.typeLabel.text isEqualToString:@"三连号"]) {
                [cell.typeLabel setTextColor:[UIColor redColor]];
            }
            cell.issueLabel.text = [[dict objectForKey:@"issueno"] substringFromIndex: [[dict objectForKey:@"issueno"] length] - 2];
            cell.userInteractionEnabled = NO;
            return cell;
        }
        if ([self.mode isEqualToString:@"SSC"]) {
            SSCTableViewCell * cell = (SSCTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ssccCell"];
            cell.issueLabel.text = [[dict objectForKey:@"issueno"] substringFromIndex: [[dict objectForKey:@"issueno"] length] - 2];
            
            dict = [lotteryList objectAtIndex:indexPath.row];
            numStrPool = [dict objectForKey:@"number"];
            numberArrayPool = [numStrPool componentsSeparatedByString:@" "];
            [cell.firstBall setTitle:[numberArrayPool objectAtIndex:0] forState:UIControlStateNormal];
            [cell.secondBall setTitle:[numberArrayPool objectAtIndex:1] forState:UIControlStateNormal];
            [cell.thirdBall setTitle:[numberArrayPool objectAtIndex:2] forState:UIControlStateNormal];
            [cell.forthBall setTitle:[numberArrayPool objectAtIndex:3] forState:UIControlStateNormal];
            [cell.fifthBall setTitle:[numberArrayPool objectAtIndex:4] forState:UIControlStateNormal];
            cell.tpLabel.text = [LFFunctions getNumberIdentifyString:[numberArrayPool objectAtIndex:3]];
            cell.gpLabel.text = [LFFunctions getNumberIdentifyString:[numberArrayPool objectAtIndex:4]];
            cell.issueLabel.text = [[dict objectForKey:@"issueno"] substringFromIndex: [[dict objectForKey:@"issueno"] length] - 2];
            cell.userInteractionEnabled = NO;
            return cell;
            
        }
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 55.0;
    }
    if (indexPath.section == 1) {
        return 65.0;
    }
    return 0;
}
-(void) reloadContentView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.contentView reloadData];
    });
}

-(void)dataSocketWillStartRequestWithTag:(NSInteger)tag andCustomerTag:(NSInteger)c_tag{
    [spinner startAnimating];
}
-(void)dataSocketDidGetResponseWithTag:(NSInteger)tag andCustomerTag:(NSInteger)c_tag{
    
    [spinner stopAnimating];
}
-(void)datasocketDidReceiveNormalResponseWithDict:(NSDictionary *)resultDic andCustomerTag:(NSInteger)c_tag{
    //NSLog(@"%@",resultDic.description);
    lotteryList = [resultDic objectForKey:@"results"];
    [self reloadContentView];
}
-(void)dataSocketErrorWithTag:(NSInteger)tag andMessage:(NSString *)message andCustomerTag:(NSInteger)c_tag{
    
}

-(int) getRandomMinutes{
    int minute = 0;
    if ([self.mode isEqualToString:@"FT"]) {
        minute = arc4random_uniform(3);
    }
    if ([self.mode isEqualToString:@"SSC"]){
        minute = arc4random_uniform(59);
    }
    return minute;
}
-(int) getRandomSecond{
    int second = arc4random_uniform(59);
    return second;
}
-(void) configCountDownLabel{
    count_minute = (NSInteger)[self getRandomMinutes];
    count_second = (NSInteger)[self getRandomSecond];
    NSString * minuteStr = (count_minute < 10)?[NSString stringWithFormat:@"0%ld",(long)count_minute]:[NSString stringWithFormat:@"%ld",(long)count_minute];
    NSString * secondStr = (count_second < 10)?[NSString stringWithFormat:@"0%ld",(long)count_second]:[NSString stringWithFormat:@"%ld",(long)count_second];
    [self updateCountDownLabelWithString:[NSString stringWithFormat:@"00:%@:%@",minuteStr,secondStr]];
    [timer invalidate];
    timer = nil;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownTimerDidFire) userInfo:nil repeats:YES];
}
-(void) updateCountDownLabel{
    NSString * minuteStr = (count_minute < 10)?[NSString stringWithFormat:@"0%ld",(long)count_minute]:[NSString stringWithFormat:@"%ld",(long)count_minute];
    NSString * secondStr = (count_second < 10)?[NSString stringWithFormat:@"0%ld",(long)count_second]:[NSString stringWithFormat:@"%ld",(long)count_second];
    [self updateCountDownLabelWithString:[NSString stringWithFormat:@"00:%@:%@",minuteStr,secondStr]];
}
-(void) countDownTimerDidFire{
    if (count_minute == 0 && count_second == 0) {
        //Count Down Fire;
        [self configCountDownLabel];
        [self requestLotteryDetail];
    }else if (count_second == 0 && count_minute > 0) {
        count_second = 59;
        count_minute--;
        [self updateCountDownLabel];
    }else{
        count_second--;
        [self updateCountDownLabel];
    }
}
-(void) updateCountDownLabelWithString:(NSString *) str{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.countDownLabel.text = str;
    });
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
