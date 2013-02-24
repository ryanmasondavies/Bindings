SpecBegin(BNDBinding)

__block BNDBinding *binding;
__block id          mockSource;
__block id          mockDestination;
__block id          mockTrigger;

before(^{
    mockSource      = [OCMockObject niceMockForClass:[BNDValue   class]];
    mockDestination = [OCMockObject niceMockForClass:[BNDValue   class]];
    mockTrigger     = [OCMockObject niceMockForClass:[BNDTrigger class]];
    binding         = [[BNDBinding alloc] initWithSource:mockSource destination:mockDestination];
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
        [[[mockSource     expect] andReturn:@"some value"] retrieve];
        [[mockDestination expect] assign:@"some value"];
        [binding triggerDidFire:mockTrigger];
        [mockSource      verify];
        [mockDestination verify];
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
