//
//  BNDNotificationTrigger.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDTrigger.h"

@interface BNDNotificationTrigger : BNDTrigger

- (id)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter notificationName:(NSString *)notificationName sender:(id)sender delegate:(id <BNDTriggerDelegate>)delegate;

- (void)startFiring;
- (void)stopFiring;

@property (strong, nonatomic, readonly) NSNotificationCenter *notificationCenter;
@property (copy,   nonatomic, readonly) NSString *notificationName;
@property (strong, nonatomic, readonly) id sender;

@end
