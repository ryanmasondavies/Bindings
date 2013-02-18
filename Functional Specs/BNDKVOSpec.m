SpecBegin(BNDKVOSpec)

__block BNDBindings         *bindings;
__block NSMutableDictionary *source;
__block NSMutableDictionary *destination;
__block NSString            *sourceKeyPath;
__block NSString            *destinationKeyPath;

before(^{
    bindings           = [[BNDBindings alloc] init];
    source             = [NSMutableDictionary dictionary];
    destination        = [NSMutableDictionary dictionary];
    sourceKeyPath      = @"name";
    destinationKeyPath = @"first name";
    
    [source setObject:@"Jimmy" forKey:sourceKeyPath];
    [destination setObject:@"Fred" forKey:destinationKeyPath];
    
    BNDBinding *binding = [[BNDBinding alloc] initWithSource:source sourceKeyPath:sourceKeyPath destination:destination destinationKeyPath:destinationKeyPath];
    BNDTrigger *trigger = [[BNDKVOTrigger alloc] initWithKeyPath:sourceKeyPath object:source delegate:binding];
    
    [binding addTrigger:trigger];
    [bindings addBinding:binding];
});

it(@"performs an initial update to ensure values always match", ^{
    [[destination[destinationKeyPath] should] beEqualTo:@"Jimmy"];
});

it(@"updates the destination's property when the source's changes", ^{
    source[sourceKeyPath] = @"Bobby";
    [[destination[destinationKeyPath] should] beEqualTo:@"Bobby"];
});

SpecEnd
