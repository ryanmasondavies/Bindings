SpecBegin(BNDKVOSpec)

it(@"listens for KVO events to update the destination's property", ^{
    BNDBindings         *bindings;
    NSMutableDictionary *source;
    NSMutableDictionary *destination;
    NSString            *sourceKeyPath;
    NSString            *destinationKeyPath;
    
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
    
    source[sourceKeyPath] = @"Bobby";
    [[destination[destinationKeyPath] should] beEqualTo:@"Bobby"];
});

SpecEnd
