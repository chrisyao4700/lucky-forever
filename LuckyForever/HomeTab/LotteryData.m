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
                    @"title":@"大发快3",
                    @"desc":@"1分钟1期",
                    @"websitePage":@"https://chart.ydniu.com/trend/k3bj/"
                    },
                @{
                    @"title":@"北京快3",
                    @"desc":@"全天89期",
                    @"websitePage":@"https://chart.ydniu.com/trend/k3bj/"
                    },
                @{
                    @"title":@"安徽快3",
                    @"desc":@"全天80期",
                    @"websitePage":@"https://www.ydniu.com/lottery/k3ah.aspx"
                    },
                @{
                    @"title":@"天津时时彩",
                    @"desc":@"3分钟1期",
                    @"websitePage":@"https://www.888c6.com/history?gameUniqueId=HF_TJSSC"
                    },
                @{
                    @"title":@"重庆时时彩",
                    @"desc":@"1分钟1期",
                    @"websitePage":@"https://zst.cjcp.com.cn/shdd/chongqingssc-ww.html"
                    },
                @{
                    @"title":@"新疆时时彩",
                    @"desc":@"全天89期",
                    @"websitePage":@"https://zst.cjcp.com.cn/cjwssc_3xing/view/ssc_qujian-xjssc.html"
                    },
                @{
                    @"title":@"大发六合彩",
                    @"desc":@"全天80期",
                    @"websitePage":@"https://yz7288.com/?yz__bskk_com"
                    },
                @{
                    @"title":@"香港六合彩",
                    @"desc":@"1分钟1期",
                    @"website":@"https://lt.groom88.net/member/lt/"
                    },
                @{
                    @"title":@"北京PK10",
                    @"desc":@"1分钟1期",
                    @"websitePage":@"https://lt.groom88.net/charon/#/game/bjpk?playway=general"
                    },
                @{
                    @"title":@"北京快乐8",
                    @"desc":@"全天89期",
                    @"websitePage":@"http://lt.groom88.net/charon/#/game/bjkn?playway=multi_choose"
                    },
                @{
                    @"title":@"江西11选5",
                    @"desc":@"全天80期",
                    @"websitePage":@"https://lt.groom88.net/charon/#/game/jxe5?playway=general"
                    },
                @{
                    @"title":@"更多彩种",
                    @"desc":@" ",
                    @"websitePage":@"https://google.com"
                    }
                ];
}

@end
