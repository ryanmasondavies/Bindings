SpecBegin(BNDPropertySpec)

__block id        object;
__block NSString *keyPath;
__block BNDProperty *property;

before(^{
    object   = [OCMockObject niceMockForClass:[NSObject class]];
    keyPath  = @"name";
    property = [[BNDProperty alloc] initWithObject:object keyPath:keyPath];
});

it(@"retrieves the value of the property from the object", ^{
    [[[object expect] andReturn:@"John Smith"] valueForKeyPath:keyPath];
    [[[property value] should] beEqualTo:@"John Smith"];
    [object verify];
});

it(@"assigns a new value to the object", ^{
    [[object expect] setValue:@"Clive Owen" forKeyPath:keyPath];
    [property setValue:@"Clive Owen"];
    [object verify];
});

SpecEnd
