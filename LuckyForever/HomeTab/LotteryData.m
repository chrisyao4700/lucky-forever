//
//  LotteryData.m
//  一路发
//
//  Created by 姚远 on 12/13/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "LotteryData.h"

@implementation LotteryData
+(NSArray *) getLotteryList{
     return  @[
               @{
                   @"title":@"云南时时彩",
                   @"desc":@"全天24期",
                   @"lottery_id":@"134"
                   },
               @{
                   @"title":@"重庆时时彩",
                   @"desc":@"全天24期",
                   @"lottery_id":@"73"
                   },
               @{
                   @"title":@"天津时时彩",
                   @"desc":@"全天24期",
                   @"lottery_id":@"93"
                   },
                @{
                    @"title":@"排列3",
                    @"desc":@"1分钟1期",
                    @"lottery_id":@"16"
                    },
                @{
                    @"title":@"吉林新快3",
                    @"desc":@"全天89期",
                    @"lottery_id":@"72"
                    },
                @{
                    @"title":@"安徽快3",
                    @"desc":@"全天80期",
                    @"lottery_id":@"76"
                    },
                @{
                    @"title":@"河北快3",
                    @"desc":@"3分钟1期",
                    @"lottery_id":@"101"
                    },
                @{
                    @"title":@"福建快3",
                    @"desc":@"1分钟1期",
                    @"lottery_id":@"81"
                    },
                @{
                    @"title":@"易快3",
                    @"desc":@"全天89期",
                    @"lottery_id":@"87"
                    },
                @{
                    @"title":@"上海快3 ",
                    @"desc":@"全天80期",
                    @"lottery_id":@"105"
                    },
                @{
                    @"title":@"贵州快3",
                    @"desc":@"1分钟1期",
                    @"lottery_id":@"123"
                    },
                @{
                    @"title":@"甘肃快3",
                    @"desc":@"1分钟1期",
                    @"lottery_id":@"126"
                    }
                ];
}

@end
