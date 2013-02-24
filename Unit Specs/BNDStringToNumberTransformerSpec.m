SpecBegin(BNDStringToNumberTransformer)

__block id property;
__block id numberFormatter;
__block id <BNDTransformer> transformer;

before(^{
    property        = [OCMockObject niceMockForClass:[BNDProperty       class]];
    numberFormatter = [OCMockObject niceMockForClass:[NSNumberFormatter class]];
    transformer     = [[BNDStringToNumberTransformer alloc] initWithProperty:property numberFormatter:numberFormatter];
});

it(@"converts the new value of a property to a number before setting it", ^{
    [[[numberFormatter expect] andReturn:@100] numberFromString:@"100"];
    [[property expect] setValue:@100];
    [transformer setValue:@"100"];
    [property verify];
    [numberFormatter verify];
});

it(@"converts the property's value to a number when retrieved", ^{
    [[[property expect] andReturn:@"100"] value];
    [[[numberFormatter expect] andReturn:@100] numberFromString:@"100"];
    id result = [transformer value];
    NSAssert(result, @"");
    [[result should] beEqualTo:@100];
});

SpecEnd
