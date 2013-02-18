SpecBegin(BNDKVOTrigger)

__block NSString            *keyPath;
__block NSMutableDictionary *object;
__block OCMockObject        *delegate;
__block BNDTrigger          *trigger;

before(^{
    keyPath = @"name";
    object = [NSMutableDictionary dictionaryWithObject:@"old value" forKey:keyPath];
    delegate = [OCMockObject niceMockForProtocol:@protocol(BNDTriggerDelegate)];
    trigger = [[BNDKVOTrigger alloc] initWithKeyPath:keyPath object:object delegate:(id <BNDTriggerDelegate>)delegate];
});

when(@"started", ^{
    it(@"fires once to assign the initial value", ^{
        [[delegate expect] triggerDidFire:trigger];
        [trigger startFiring];
        [delegate verify];
    });
    
    it(@"fires when the object's property changes", ^{
        [trigger startFiring];
        [[delegate expect] triggerDidFire:trigger];
        [object setValue:@"new value" forKey:keyPath];
        [delegate verify];
    });
});

when(@"stopped", ^{
    before(^{
        [trigger startFiring];
        [trigger stopFiring];
    });
    
    it(@"does not fire when the object's property changes", ^{
        [[delegate reject] triggerDidFire:OCMOCK_ANY];
        [object setValue:@"new value" forKey:keyPath];
        [delegate verify];
    });
});

SpecEnd
