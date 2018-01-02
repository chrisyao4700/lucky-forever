//
//  FTTableViewCell.h
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 1/2/18.
//  Copyright © 2018 OD INTERNATIONAL 3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *firstBall;

@property (weak, nonatomic) IBOutlet UIButton *secondBall;
@property (weak, nonatomic) IBOutlet UIButton *thirdBall;
@property (weak, nonatomic) IBOutlet UILabel *sumLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@end
