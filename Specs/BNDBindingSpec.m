SpecBegin(BNDBinding)

__block NSMutableDictionary *source;
__block NSMutableDictionary *destination;

before(^{
    source = [[NSMutableDictionary alloc] initWithObjects:@[@"initial value"] forKeys:@[@"name"]];
    destination = [[NSMutableDictionary alloc] initWithObjects:@[@"ancillary value"] forKeys:@[@"name"]];
});

when(@"bound", ^{
    when(@"the source property changes", ^{
        it(@"sets the value of the destination's property to the new value", ^{
            BNDBinding *binding = [[BNDBinding alloc] initWithSource:source sourceKeyPath:@"name" destination:destination destinationKeyPath:@"name"];
            [binding bind];
            [source setValue:@"new value" forKey:@"name"];
            NSAssert(destination[@"name"], @"");
            [[destination[@"name"] should] beEqualTo:@"new value"];
        });
    });
});

when(@"unbound", ^{
    when(@"the source property changes", ^{
        it(@"does not set the value of the destination's property to the new value", ^{
            BNDBinding *binding = [[BNDBinding alloc] initWithSource:source sourceKeyPath:@"name" destination:destination destinationKeyPath:@"name"];
            [binding bind];
            [binding unbind];
            [source setValue:@"new value" forKey:@"name"];
            NSAssert(destination[@"name"], @"");
            [[destination[@"name"] shouldNot] beEqualTo:@"new value"];
        });
    });
});

SpecEnd
