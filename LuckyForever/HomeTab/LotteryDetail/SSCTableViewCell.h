//
//  SSCTableViewCell.h
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 1/3/18.
//  Copyright © 2018 OD INTERNATIONAL 3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *issueLabel;
@property (weak, nonatomic) IBOutlet UIButton *firstBall;
@property (weak, nonatomic) IBOutlet UIButton *secondBall;
@property (weak, nonatomic) IBOutlet UIButton *thirdBall;
@property (weak, nonatomic) IBOutlet UIButton *forthBall;
@property (weak, nonatomic) IBOutlet UIButton *fifthBall;
@property (weak, nonatomic) IBOutlet UILabel *tpLabel;
@property (weak, nonatomic) IBOutlet UILabel *gpLabel;

@end
