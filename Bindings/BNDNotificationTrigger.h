//
//  BNDNotificationTrigger.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDTrigger.h"

@interface BNDNotificationTrigger : BNDTrigger

- (id)initWithDelegate:(id <BNDTriggerDelegate>)delegate notificationCenter:(NSNotificationCenter *)notificationCenter notificationName:(NSString *)notificationName sender:(id)sender;

- (void)startFiring;
- (void)stopFiring;

@property (weak,   nonatomic, readonly) id <BNDTriggerDelegate> delegate;
@property (strong, nonatomic, readonly) NSNotificationCenter *notificationCenter;
@property (copy,   nonatomic, readonly) NSString *notificationName;
@property (strong, nonatomic, readonly) id sender;

@end
