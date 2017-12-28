//
//  CYFunction.m
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 12/27/17.
//  Copyright © 2017 OD INTERNATIONAL 3. All rights reserved.
//

#import "CYFunction.h"

@implementation CYFunction
+(NSString *) convertDateToYearString:(NSDate *) aDate{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init ];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    NSString * dateStr = [formatter stringFromDate:aDate];
    return dateStr;
}
@end
