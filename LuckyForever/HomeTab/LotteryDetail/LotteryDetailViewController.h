//
//  LotteryDetailViewController.h
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 1/2/18.
//  Copyright © 2018 OD INTERNATIONAL 3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDataSocketConnector.h"

@interface LotteryDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,AppDataSocketDelegate>
@property (weak, nonatomic) IBOutlet UITableView *contentView;
@property NSDictionary * lottery;

@property NSString * mode;
@end
