SpecBegin(BNDBinding)

__block NSMutableDictionary *source;
__block NSString            *sourceKeyPath;
__block NSMutableDictionary *destination;
__block NSString            *destinationKeyPath;
__block BNDBinding          *binding;
__block id                   mockTrigger;

before(^{
    sourceKeyPath = @"name";
    source = [[NSMutableDictionary alloc] initWithObjects:@[@"initial value"] forKeys:@[sourceKeyPath]];
    destinationKeyPath = @"name";
    destination = [[NSMutableDictionary alloc] initWithObjects:@[@"old value"] forKeys:@[destinationKeyPath]];
    binding = [[BNDBinding alloc] initWithSource:source sourceKeyPath:sourceKeyPath destination:destination destinationKeyPath:destinationKeyPath];
    mockTrigger = [OCMockObject niceMockForClass:[BNDTrigger class]];
});

when(@"bound", ^{
    it(@"starts firing triggers", ^{
        [binding addTrigger:mockTrigger];
        [[mockTrigger expect] startFiring];
        [binding bind];
        [mockTrigger verify];
    });
});

when(@"a trigger fires", ^{
    it(@"sets the value of the destination's property to the new value", ^{
        source[sourceKeyPath] = @"new value";
        [binding triggerDidFire:(BNDTrigger *)mockTrigger];
        NSAssert(destination[destinationKeyPath], @"");
        [[destination[destinationKeyPath] should] beEqualTo:@"new value"];
    });
});

when(@"unbound", ^{
    it(@"stops firing triggers", ^{
        [binding addTrigger:mockTrigger];
        [binding bind];
        [[mockTrigger expect] stopFiring];
        [binding unbind];
        [mockTrigger verify];
    });
});

SpecEnd
