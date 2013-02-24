SpecBegin(BNDValueSpec)

__block id        object;
__block NSString *keyPath;
__block BNDValue *value;

before(^{
    object  = [OCMockObject niceMockForClass:[NSObject class]];
    keyPath = @"name";
    value   = [[BNDValue alloc] initWithObject:object keyPath:keyPath];
});

it(@"retrieves the value from the object", ^{
    [[[object expect] andReturn:@"John Smith"] valueForKeyPath:keyPath];
    id retrieved = [value retrieve];
    NSAssert(retrieved, @"");
    [[retrieved should] beEqualTo:@"John Smith"];
    [object verify];
});

it(@"assigns a new value to the object", ^{
    [[object expect] setValue:@"Clive Owen" forKeyPath:keyPath];
    [value assign:@"Clive Owen"];
    [object verify];
});

SpecEnd
