//
//  CYCalendarHandler.m
//  一路发
//
//  Created by 姚远 on 12/14/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "CYCalendarHandler.h"
#import "AppDelegate.h"
#import "CYFunction.h"
@implementation CYCalendarHandler



+(void) addCalendarEvent:(NSDictionary *) eventDict{
    
    if ([CYCalendarHandler shouldAddEventForTodayWithTitle:[eventDict objectForKey:@"title"]] == YES) {
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
            NSLog(@"%@", event.eventIdentifier);
            [CYCalendarHandler addCalendarEventToCoredata:@{
                                                            @"title":[eventDict objectForKey:@"title"],
                                                            @"event_id":event.eventIdentifier
                                                            }];
            //self.savedEventId = event.eventIdentifier;  //save the event id if you want to access this later
        }];
    }else{
        NSLog(@"Add Event Fail, ALREADY ADDED");
    }
    
}
+(BOOL) shouldAddEventForTodayWithTitle:(NSString *) title{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* managedObjectContext = app.persistentContainer.viewContext;
    NSFetchRequest *request = [CalendarEvent fetchRequest];
    [request setPredicate:[NSPredicate predicateWithFormat:@"(title == %@) AND (cdate < %@) AND (cdate > %@) ", title,[NSDate date], [NSDate dateWithTimeIntervalSinceNow:-(60.0f*60.0f*24.0f)]]];
    NSError *error = nil;
    NSArray * array = [managedObjectContext executeFetchRequest:request error:&error];
    
    //NSLog(@"SHOULD ADD EVENT %ld", (long)array.count);
    if (array.count == 0) {
        return YES;
    }else{
        return NO;
    }
}

+(void) addCalendarEventToCoredata:(NSDictionary *) event{
    dispatch_async(dispatch_get_main_queue(), ^{
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        NSManagedObjectContext* managedObjectContext = app.persistentContainer.viewContext;
        
        NSFetchRequest *request = [CalendarEvent fetchRequest];
        [request setPredicate:[NSPredicate predicateWithFormat:@"event_id == %@", [event objectForKey:@"event_id"]]];
        NSError *error = nil;
        NSArray * array = [managedObjectContext executeFetchRequest:request error:&error];
        if (array.count == 0) {
            CalendarEvent * ce = (CalendarEvent *)[NSEntityDescription insertNewObjectForEntityForName:@"CalendarEvent" inManagedObjectContext:managedObjectContext];
            ce.event_id = [event objectForKey:@"event_id"];
            //ce.isActive = YES;
            ce.title = [event objectForKey:@"title"];
            ce.cdate = [NSDate date];
            
            NSLog(@"Added event to Coredata(0): %@",ce);
        }
        if (array.count == 1) {
            CalendarEvent * ce = array[0];
            ce.event_id = [event objectForKey:@"event_id"];
            ce.cdate = [NSDate date];
            ce.title = [event objectForKey:@"title"];
            NSLog(@"Added event to Coredata(1): %@",ce);
        }
        if (array.count > 1) {
            for (CalendarEvent * aCE in array) {
                [managedObjectContext deleteObject:aCE];
            }
            CalendarEvent * ce = (CalendarEvent *)[NSEntityDescription insertNewObjectForEntityForName:@"CalendarEvent" inManagedObjectContext:managedObjectContext];
            ce.event_id = [event objectForKey:@"event_id"];
            ce.cdate = [NSDate date];
            ce.title = [event objectForKey:@"title"];
            NSLog(@"Added event to Coredata(?): %@",ce);
        }
        NSError * s_error;
        [managedObjectContext save:&s_error];
    });
    
}


@end
