SpecBegin(BNDNotificationSpec)

__block BNDBindings          *bindings;
__block NSMutableDictionary  *source;
__block NSMutableDictionary  *destination;
__block NSString             *sourceKeyPath;
__block NSString             *destinationKeyPath;
__block NSNotificationCenter *notificationCenter;
__block NSString             *notificationName;

before(^{
    bindings           = [[BNDBindings alloc] init];
    source             = [NSMutableDictionary dictionary];
    destination        = [NSMutableDictionary dictionary];
    sourceKeyPath      = @"name";
    destinationKeyPath = @"first name";
    notificationCenter = [[NSNotificationCenter alloc] init];
    notificationName   = @"SomeNotification";
    
    [source setValue:@"Jimmy" forKey:sourceKeyPath];
    [destination setObject:@"Fred" forKey:destinationKeyPath];
    
    BNDProperty *sourceProperty = [[BNDProperty alloc] initWithObject:source keyPath:sourceKeyPath];
    BNDProperty *destinationProperty = [[BNDProperty alloc] initWithObject:destination keyPath:destinationKeyPath];
    BNDBinding *binding = [[BNDBinding alloc] initWithSourceProperty:sourceProperty destinationProperty:destinationProperty];
    id <BNDTrigger> trigger = [[BNDNotificationTrigger alloc] initWithNotificationCenter:notificationCenter notificationName:notificationName sender:source delegate:binding];
    
    [binding addTrigger:trigger];
    [bindings addBinding:binding];
});

it(@"performs an initial update to ensure values always match", ^{
    [[destination[destinationKeyPath] should] beEqualTo:@"Jimmy"];
});

it(@"updates the destination's value when a notification is received", ^{
    [source setValue:@"Bobby" forKey:sourceKeyPath];
    [notificationCenter postNotificationName:notificationName object:source];
    NSAssert(destination[destinationKeyPath], @"");
    [[destination[destinationKeyPath] should] beEqualTo:@"Bobby"];
});

it(@"does not update until a notification is sent", ^{
    [source setValue:@"Bobby" forKey:sourceKeyPath];
    NSAssert(destination[destinationKeyPath], @"");
    [[destination[destinationKeyPath] shouldNot] beEqualTo:@"Bobby"];
});

SpecEnd
