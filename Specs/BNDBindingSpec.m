SpecBegin(BNDBinding)

__block NSMutableDictionary *source;
__block NSString            *sourceKeyPath;
__block NSMutableDictionary *destination;
__block NSString            *destinationKeyPath;
__block BNDBinding          *binding;
__block OCMockObject        *mockTrigger;

before(^{
    sourceKeyPath = @"name";
    source = [[NSMutableDictionary alloc] initWithObjects:@[@"initial value"] forKeys:@[sourceKeyPath]];
    destinationKeyPath = @"name";
    destination = [[NSMutableDictionary alloc] initWithObjects:@[@"old value"] forKeys:@[destinationKeyPath]];
    binding = [[BNDBinding alloc] initWithSource:source sourceKeyPath:sourceKeyPath destination:destination destinationKeyPath:destinationKeyPath];
    mockTrigger = [OCMockObject niceMockForClass:[BNDTrigger class]];
});

when(@"a trigger fires", ^{
    it(@"sets the value of the destination's property to the new value", ^{
        source[sourceKeyPath] = @"new value";
        [binding triggerDidFire:(BNDTrigger *)mockTrigger];
        [[destination[destinationKeyPath] should] beEqualTo:@"new value"];
    });
});

SpecEnd
