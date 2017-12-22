//
//  AppDelegate.m
//  一路发
//
//  Created by 姚远 on 12/11/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "AppDelegate.h"
#import "CYNotificationHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
    
    //NSLog(@"%@",launchOptions);
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSString * token = [NSString stringWithFormat:@"%@", deviceToken];
    //Format token as you need:
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    NSLog(@"deviceToken:\n %@", token);
    
    //NSLog(@"Get Last %@", [CYNotificationHandler getLastActiveEvent]);
    //NSLog(@"Get Last ten %@",[CYNotificationHandler getLastTenEvents]);
    for (NotificationEvent * event in [CYNotificationHandler getLastTenEvents]) {
        NSLog(@"%@",event);
    }
   
}


-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    //NSLog(@"I am assumed back end");
    
//    ne.event_id = [event objectForKey:@"event_id"];
//    ne.isActive = YES;
//    ne.cdate = [NSDate date];
//    ne.webLink = [event objectForKey:@"url"];
//    ne.message = [event objectForKey:@"message"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [CYNotificationHandler addEventToCoredata:[CYNotificationHandler configEventDict:userInfo]];
        NSLog(@"%@",userInfo);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:([(NSString *)[userInfo objectForKey:@"url"] containsString:@"http"])?[userInfo objectForKey:@"url"]:[NSString stringWithFormat:@"http://%@",[userInfo objectForKey:@"url"]]]options:@{} completionHandler:^(BOOL success){
            
        }];
    });
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    //[UNUserNotificationCenter currentNotificationCenter] get
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
//    [[UNUserNotificationCenter currentNotificationCenter] getDeliveredNotificationsWithCompletionHandler:^(NSArray<UNNotification *> * _Nonnull notifications){
//        //NSLog(@"I AM ON ROOT NOFITICATION %@",notifications.description);
//        //NSLog(@"I am here! Count: %d",notifications.count);
//        NSLog(@"Delivered Notification");
//        if (notifications.count>0) {
//            for (UNNotification *nt in notifications) {
//               // NSLog(@"\nNotification Printed:\n%@",);
//            }
//        }
//    }];
//    [[UNUserNotificationCenter currentNotificationCenter] getPendingNotificationRequestsWithCompletionHandler:^(NSArray<UNNotificationRequest *> * _Nonnull requests){
//        NSLog(@"Pending Notification");
//        if (requests.count>0) {
//            for (UNNotificationRequest * request in requests) {
//                NSLog(@"%@",request.description);
//            }
//        }
//    }];
    
    //  [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
    //NSLog(@"Hellow World! \n%@",application.description);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"LuckyForever"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
