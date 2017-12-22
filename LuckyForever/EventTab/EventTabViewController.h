//
//  EventTabViewController.h
//  一路发
//
//  Created by 姚远 on 12/12/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTabViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *contentTable;

@end
