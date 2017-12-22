//
//  CYCalendarHandler.m
//  一路发
//
//  Created by 姚远 on 12/14/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "CYCalendarHandler.h"

@implementation CYCalendarHandler



+(void) addCalendarEvent:(NSDictionary *) eventDict{
    EKEventStore *store = [EKEventStore new];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (!granted) { return; }
        EKEvent *event = [EKEvent eventWithEventStore:store];
        event.title = [eventDict objectForKey:@"title"];
        event.startDate = [eventDict objectForKey:@"start_date"]; //today
        event.endDate = [eventDict objectForKey:@"end_date"];  //set 1 hour meeting
        event.calendar = [store defaultCalendarForNewEvents];
        NSError *err = nil;
        [store saveEvent:event span:EKSpanThisEvent commit:YES error:&err];
        //self.savedEventId = event.eventIdentifier;  //save the event id if you want to access this later
    }];
}
@end
