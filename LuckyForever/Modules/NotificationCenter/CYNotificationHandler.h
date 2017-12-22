//
//  CYNotificationHandler.h
//  一路发
//
//  Created by OD INTERNATIONAL 3 on 12/20/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotificationEvent+CoreDataClass.h"
@interface CYNotificationHandler : NSObject

+(void) addEventToCoredata:(NSDictionary *) event;
+(void) inactivateEventInCoredata:(NSDictionary *) event;
+(NotificationEvent *) getLastActiveEvent;
+(NSDictionary *) configEventDict:(NSDictionary *) userInfo;
+(NSArray *) getLastTenEvents;
@end
