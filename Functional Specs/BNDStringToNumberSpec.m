SpecBegin(BNDStringToNumber)

__block BNDBindings         *bindings;
__block NSMutableDictionary *source;
__block NSMutableDictionary *destination;
__block BNDProperty         *sourceProperty;
__block BNDProperty         *destinationProperty;
__block NSNumberFormatter   *numberFormatter;
__block id <BNDTransformer>  transformer;
__block BNDBinding          *binding;
__block id <BNDTrigger>      trigger;

before(^{
    bindings            = [[BNDBindings alloc] init];
    source              = [NSMutableDictionary dictionary];
    destination         = [NSMutableDictionary dictionary];
    sourceProperty      = [[BNDProperty alloc] initWithObject:source keyPath:@"name"];
    destinationProperty = [[BNDProperty alloc] initWithObject:destination keyPath:@"name"];
    numberFormatter     = [[NSNumberFormatter alloc] init];
    
    [source setObject:@"Jimmy" forKey:@"name"];
    [destination setObject:@"Fred" forKey:@"name"];
});

when(@"in place of the source property", ^{
    before(^{
        transformer = [[BNDStringToNumberTransformer alloc] initWithProperty:sourceProperty numberFormatter:numberFormatter];
        binding     = [[BNDBinding alloc] initWithSourceProperty:transformer destinationProperty:destinationProperty];
        trigger     = [[BNDKVOTrigger alloc] initWithKeyPath:@"name" object:source delegate:binding];
        
        [binding addTrigger:trigger];
        [bindings addBinding:binding];
    });
    
    it(@"converts the string value of the source property to a number using the given formatter", ^{
        source[@"name"] = @"250";
        NSAssert(destination[@"name"], @"");
        [[destination[@"name"] should] beEqualTo:@250];
    });
});

when(@"in place of the destination property", ^{
    before(^{
        transformer = [[BNDStringToNumberTransformer alloc] initWithProperty:destinationProperty numberFormatter:numberFormatter];
        binding     = [[BNDBinding alloc] initWithSourceProperty:sourceProperty destinationProperty:transformer];
        trigger     = [[BNDKVOTrigger alloc] initWithKeyPath:@"name" object:source delegate:binding];
        
        [binding addTrigger:trigger];
        [bindings addBinding:binding];
    });
    
    it(@"converts the string value of the source property to a number using the given formatter", ^{
        source[@"name"] = @"250";
        NSAssert(destination[@"name"], @"");
        [[destination[@"name"] should] beEqualTo:@250];
    });
});

SpecEnd
