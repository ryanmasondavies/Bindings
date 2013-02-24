SpecBegin(BNDBinding)

__block BNDBinding *binding;
__block id          mockSourceProperty;
__block id          mockDestinationProperty;
__block id          mockTrigger;

before(^{
    mockSourceProperty      = [OCMockObject niceMockForClass:[BNDProperty class]];
    mockDestinationProperty = [OCMockObject niceMockForClass:[BNDProperty class]];
    mockTrigger = [OCMockObject niceMockForProtocol:@protocol(BNDTrigger)];
    binding     = [[BNDBinding alloc] initWithSourceProperty:mockSourceProperty destinationProperty:mockDestinationProperty];
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
        [[[mockSourceProperty     expect] andReturn:@"some value"] value];
        [[mockDestinationProperty expect] setValue:@"some value"];
        [binding triggerDidFire:mockTrigger];
        [mockSourceProperty      verify];
        [mockDestinationProperty verify];
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
