//
//  CYNotificationHandler.m
//  一路发
//
//  Created by OD INTERNATIONAL 3 on 12/20/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "CYNotificationHandler.h"
#import "AppDelegate.h"

@implementation CYNotificationHandler
+(void) addEventToCoredata:(NSDictionary *) event{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* managedObjectContext = app.persistentContainer.viewContext;
    
    NSFetchRequest *request = [NotificationEvent fetchRequest];
    [request setPredicate:[NSPredicate predicateWithFormat:@"event_id == %@", [event objectForKey:@"event_id"]]];
    NSError *error = nil;
    NSArray * array = [managedObjectContext executeFetchRequest:request error:&error];
    if (array.count == 0) {
        NotificationEvent * ne = (NotificationEvent *)[NSEntityDescription insertNewObjectForEntityForName:@"NotificationEvent" inManagedObjectContext:managedObjectContext];
        ne.event_id = [event objectForKey:@"event_id"];
        ne.isActive = YES;
        ne.cdate = [NSDate date];
        ne.webLink = [event objectForKey:@"url"];
        ne.message = [event objectForKey:@"message"];
        NSLog(@"Added event to Coredata(0): %@",ne);
    }
    
    if (array.count == 1) {
        NotificationEvent * ne = array[0];
        ne.event_id = [event objectForKey:@"event_id"];
        ne.isActive = YES;
        ne.cdate = [NSDate date];
        ne.webLink = [event objectForKey:@"url"];
        ne.message = [event objectForKey:@"message"];
        NSLog(@"Added event to Coredata(1): %@",ne);
    }
    if (array.count > 1) {
        for (NotificationEvent * aNE in array) {
            [managedObjectContext deleteObject:aNE];
        }
        NotificationEvent * ne = (NotificationEvent *)[NSEntityDescription insertNewObjectForEntityForName:@"NotificationEvent" inManagedObjectContext:managedObjectContext];
        ne.event_id = [event objectForKey:@"event_id"];
        ne.isActive = YES;
        ne.cdate = [NSDate date];
        ne.webLink = [event objectForKey:@"url"];
        ne.message = [event objectForKey:@"message"];
        NSLog(@"Added event to Coredata(?): %@",ne);
    }
    NSError * s_error;
    
    
    [managedObjectContext save:&s_error];
}
+(void) inactivateEventInCoredata:(NSDictionary *) event{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* managedObjectContext = app.persistentContainer.viewContext;
    NSFetchRequest *request = [NotificationEvent fetchRequest];
    [request setPredicate:[NSPredicate predicateWithFormat:@"event_id == %@", [event objectForKey:@"event_id"]]];
    NSError *error = nil;
    NSArray * array = [managedObjectContext executeFetchRequest:request error:&error];
    if (array.count == 1) {
        NotificationEvent * ne = array[0];
        ne.isActive = NO;
    }
    if (array.count > 1) {
        for (NotificationEvent * aNE in array) {
            [managedObjectContext deleteObject:aNE];
        }
        NotificationEvent * ne = (NotificationEvent *)[NSEntityDescription insertNewObjectForEntityForName:@"NotificationEvent" inManagedObjectContext:managedObjectContext];
        ne.event_id = [event objectForKey:@"event_id"];
        ne.isActive = YES;
        ne.cdate = [NSDate date];
        ne.webLink = [event objectForKey:@"url"];
        ne.message = [event objectForKey:@"message"];
    }
    NSError * s_error;
    [managedObjectContext save:&s_error];
}
+(NotificationEvent *) getLastActiveEvent{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* managedObjectContext = app.persistentContainer.viewContext;
    NSFetchRequest *request = [NotificationEvent fetchRequest];
    [request setPredicate:[NSPredicate predicateWithFormat:@"isActive == %@", [NSNumber numberWithBool:NO]]];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"cdate"
                                                                   ascending:NO];
    [request setSortDescriptors:@[sortDescriptor]];
    NSError *error = nil;
    NSArray * array = [managedObjectContext executeFetchRequest:request error:&error];
    
    if (array>0) {
        return [array lastObject];
    }else{
        return nil;
    }
}

+(NSArray *) getLastTenEvents{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* managedObjectContext = app.persistentContainer.viewContext;
    NSFetchRequest *request = [NotificationEvent fetchRequest];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"cdate"
                                                                   ascending:NO];
    [request setSortDescriptors:@[sortDescriptor]];
    [request setFetchLimit:10];
    
    NSError *error = nil;
    NSArray * array = [managedObjectContext executeFetchRequest:request error:&error];
    return array;

}
+(NSDictionary *) configEventDict:(NSDictionary *) userInfo{
    return @{
             @"event_id":[userInfo objectForKey:@"id"],
             @"url":(NSString *)[userInfo objectForKey:@"url"]?(NSString *)[userInfo objectForKey:@"url"]:@"www.google.com",
             @"message":[[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] objectForKey:@"body"]?[[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] objectForKey:@"body"]:@"Push Message"
             };
}

@end
