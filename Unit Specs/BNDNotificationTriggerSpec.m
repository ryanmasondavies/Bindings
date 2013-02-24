SpecBegin(BNDNotificationTrigger)

__block NSNotificationCenter *notificationCenter;
__block NSString             *notificationName;
__block NSObject             *sender;
__block id                    delegate;
__block id <BNDTrigger>       trigger;

before(^{
    notificationCenter = [[NSNotificationCenter alloc] init];
    notificationName   = @"SomeNotification";
    sender             = [[NSObject alloc] init];
    delegate           = [OCMockObject niceMockForProtocol:@protocol(BNDTriggerDelegate)];
    trigger            = [[BNDNotificationTrigger alloc] initWithNotificationCenter:notificationCenter notificationName:notificationName sender:sender delegate:delegate];
});

when(@"started", ^{
    it(@"fires once to assign the initial value", ^{
        [[delegate expect] triggerDidFire:trigger];
        [trigger startFiring];
        [delegate verify];
    });
    
    it(@"fires when the notification is received from the sender", ^{
        [trigger startFiring];
        [[delegate expect] triggerDidFire:trigger];
        [notificationCenter postNotificationName:notificationName object:sender];
        [delegate verify];
    });

    it(@"does not fire when the notification is received from an object other than the sender", ^{
        [trigger startFiring];
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
