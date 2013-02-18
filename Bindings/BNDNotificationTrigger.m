//
//  BNDNotificationTrigger.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDNotificationTrigger.h"

@interface BNDNotificationTrigger ()
@property (strong, nonatomic) NSNotificationCenter *notificationCenter;
@property (copy,   nonatomic) NSString *notificationName;
@property (strong, nonatomic) id sender;
@end

@implementation BNDNotificationTrigger

- (id)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter notificationName:(NSString *)notificationName sender:(id)sender delegate:(id<BNDTriggerDelegate>)delegate
{
    if (self = [self init]) {
        self.notificationCenter = notificationCenter;
        self.notificationName   = notificationName;
        self.sender             = sender;
        self.delegate           = delegate;
    }
    return self;
}

- (void)startFiring
{
    [super startFiring];
    [[self notificationCenter] addObserver:self selector:@selector(fire) name:[self notificationName] object:[self sender]];
}

- (void)fire
{
    [[self delegate] triggerDidFire:self];
}

- (void)stopFiring
{
    [[self notificationCenter] removeObserver:self];
}

@end
