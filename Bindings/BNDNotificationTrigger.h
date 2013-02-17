//
//  BNDNotificationTrigger.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDTrigger.h"

/** Watches for notifications. Not all objects use the KVO mechanism to inform of property changes, and instead use notifications. */
@interface BNDNotificationTrigger : BNDTrigger

/** Initializes a new instance.
 @param notificationCenter The notification center through which notifications may be received.
 @param notificationName The name of the notification to be received.
 @param sender The object which sends the notification. Optional.
 @param delegate The object to be informed when a notification is received.
 @return An initialized instance. */
- (id)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter notificationName:(NSString *)notificationName sender:(id)sender delegate:(id <BNDTriggerDelegate>)delegate;

/** The notification center through which notifications may be received. */
@property (strong, nonatomic, readonly) NSNotificationCenter *notificationCenter;

/** The name of the notification to be received. */
@property (copy,   nonatomic, readonly) NSString *notificationName;

/** The object which sends the notification. Optional. */
@property (strong, nonatomic, readonly) id sender;

@end
