//
//  CYCalendarHandler.h
//  一路发
//
//  Created by 姚远 on 12/14/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
#import "CalendarEvent+CoreDataClass.h"
@interface CYCalendarHandler : NSObject
+(void) addCalendarEvent:(NSDictionary *) eventDict;
+(BOOL) shouldAddEventForTodayWithTitle:(NSString *) title;
+(void) addCalendarEventToCoredata:(NSDictionary *) event;
@end
