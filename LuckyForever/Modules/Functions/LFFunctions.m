//
//  LFFunctions.m
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 1/2/18.
//  Copyright © 2018 OD INTERNATIONAL 3. All rights reserved.
//

#import "LFFunctions.h"

@implementation LFFunctions
+(int) getSumOfStringArray:(NSArray *) list{
    int temp = 0;
    
    for (NSString * str in list) {
        temp += str.intValue?str.intValue:0;
    }
    return temp;
}
+(NSString *) getNumberIdentifyString:(NSString *) str{
    int num = str.intValue;
    NSString * temp = @"";
    
    if (num%2 ==0) {
        //偶数
        if (num< 6) {
            temp = @"小双";
        }else{
            temp = @"大双";
        }
    }else{
        //奇数
        if (num < 6) {
            temp = @"小单";
        }else{
            temp = @"大单";
        }
        
    }
    return temp;
}
+(NSString *) getFTIdentifyString:(NSArray *) list{
    NSMutableArray * tempList = [[NSMutableArray alloc] init];
    NSString * temp = @"";
    int sameCount = 0;
    for (NSString * num in list) {
        for (NSString * hasNum in tempList) {
            if ([num isEqualToString:hasNum])  {
                sameCount ++;
            }
        }
        [tempList addObject:num];
    }
    if (sameCount == 0) {
        temp = @"三不同";
    }
    if (sameCount == 1) {
        temp = @"两连号";
    }
    if (sameCount > 1){
        temp = @"三连号";
    }
    return temp;
    
    
}
@end
