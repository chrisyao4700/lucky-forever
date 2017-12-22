//
//  DiscoverData.m
//  一路发
//
//  Created by 姚远 on 12/13/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "DiscoverData.h"

@implementation DiscoverData
+(NSArray *) getDiscoverData{
    return @[@{
                 @"subtitle":@"大红鹰彩票网",
                 @"sites":[DiscoverData getLotterySites]
                 },
             @{
                 @"subtitle":@"大红鹰贵宾会",
                 @"sites":[DiscoverData getHonorGuestSites]
                 },
             @{
                 @"subtitle":@"大红鹰葡京会",
                 @"sites":[DiscoverData getPutinSites]
                 }];
}

+(NSArray *) getLotterySites{
    return @[
             @{
                 @"siteName":@"彩票网一站",
                 @"pageURL":@"https://www.dhycp99.com/dhyLoginWeb/app/home?ref=2daca3"
                 },
             @{
                 @"siteName":@"彩票网二站",
                 @"pageURL":@"https://www.dhycp88.com/dhyLoginWeb/app/home"
                 },
             @{
                 @"siteName":@"彩票网三站",
                 @"pageURL":@"https://www.dhycp66.com/dhyLoginWeb/app/home"
                 },
             @{
                 @"siteName":@"彩票网四站",
                 @"pageURL":@"https://www.dhycp11.com/dhyLoginWeb/app/home?ref=6cf69b"
                 },
             @{
                 @"siteName":@"彩票网五站",
                 @"pageURL":@"https://www.dhycp22.com/dhyLoginWeb/app/home?ref=4beeac"
                 },
             @{
                 @"siteName":@"彩票网六站",
                 @"pageURL":@"https://www.dhycp33.com/dhyLoginWeb/app/home?ref=756514"
                 }
             ];
}

+(NSArray *) getHonorGuestSites{
    return @[
             @{
                 @"siteName":@"贵宾会一站",
                 @"pageURL":@"http://3344dhygw.com/m/new/#/home"
                 },
             @{
                 @"siteName":@"贵宾会二站",
                 @"pageURL":@"http://3355dhygw.com/m/new/#/home"
                 },
             @{
                 @"siteName":@"贵宾会三站",
                 @"pageURL":@"http://3366dhy.com/m/new/#/home"
                 },
             @{
                 @"siteName":@"贵宾会四站",
                 @"pageURL":@"http://3377dhygw.com/m/new/#/home"
                 },
             @{
                 @"siteName":@"贵宾会五站",
                 @"pageURL":@"http://3388dhygw.com/m/new/#/home"
                 },
             @{
                 @"siteName":@"贵宾会六站",
                 @"pageURL":@"http://4400dhygw.com/m/new/#/home"
                 }
             ];
}
+(NSArray *) getPutinSites{
    return @[
             @{
                 @"siteName":@"葡京会一站",
                 @"pageURL":@"http://m.dhy5517.com/Register"
                 },
             @{
                 @"siteName":@"葡京会二站",
                 @"pageURL":@"http://m.dhy5516.com/Register"
                 },
             @{
                 @"siteName":@"葡京会三站",
                 @"pageURL":@"http://m.dhy5518.com/Register"
                 },
             @{
                 @"siteName":@"葡京会四站",
                 @"pageURL":@"http://m.dhy5519.com/Register"
                 },
             @{
                 @"siteName":@"葡京会五站",
                 @"pageURL":@"http://m.dhy5520.com/Register"
                 },
             @{
                 @"siteName":@"葡京会六站",
                 @"pageURL":@"http://m.dhy5513.com/Register"
                 }
             ];
}
@end
