SpecBegin(BNDKVOTrigger)

__block NSString            *keyPath;
__block NSMutableDictionary *object;
__block OCMockObject        *delegate;
__block BNDTrigger          *trigger;

before(^{
    keyPath = @"name";
    object = [NSMutableDictionary dictionaryWithObject:@"old value" forKey:keyPath];
    delegate = [OCMockObject mockForProtocol:@protocol(BNDTriggerDelegate)];
    trigger = [[BNDKVOTrigger alloc] initWithKeyPath:keyPath object:object delegate:(id <BNDTriggerDelegate>)delegate];
});

when(@"started", ^{
    before(^{
        [trigger startFiring];
    });
    
    it(@"fires when the object's property changes", ^{
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
