SpecBegin(BNDNotificationTrigger)

__block NSNotificationCenter *notificationCenter;
__block NSString             *notificationName;
__block NSObject             *sender;
__block OCMockObject         *delegate;
__block BNDTrigger           *trigger;

before(^{
    notificationCenter = [[NSNotificationCenter alloc] init];
    notificationName = @"SomeNotification";
    sender = [[NSObject alloc] init];
    delegate = [OCMockObject mockForProtocol:@protocol(BNDTriggerDelegate)];
    trigger = [[BNDNotificationTrigger alloc] initWithNotificationCenter:notificationCenter notificationName:notificationName sender:sender delegate:(id <BNDTriggerDelegate>)delegate];
});

when(@"started", ^{
    before(^{
        [trigger startFiring];
    });
    
    it(@"fires when the notification is received from the sender", ^{
        [[delegate expect] triggerDidFire:trigger];
        [notificationCenter postNotificationName:notificationName object:sender];
        [delegate verify];
    });

    it(@"does not fire when the notification is received from an object other than the sender", ^{
        [[delegate reject] triggerDidFire:OCMOCK_ANY];
        [notificationCenter postNotificationName:notificationName object:[NSObject new]];
        [delegate verify];
    });
});

when(@"stopped", ^{
    before(^{
        [trigger startFiring];
        [trigger stopFiring];
    });
    
    it(@"does not fire when the notification is received from the sender", ^{
        [[delegate reject] triggerDidFire:OCMOCK_ANY];
        [notificationCenter postNotificationName:notificationName object:sender];
        [delegate verify];
    });
});

SpecEnd
