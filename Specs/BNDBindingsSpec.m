SpecBegin(BNDBindings)

__block BNDBindings *bindings;
__block id           mockBinding;

before(^{
    bindings    = [[BNDBindings alloc] init];
    mockBinding = [OCMockObject niceMockForClass:[BNDBinding class]];
});

it(@"activates bindings as they are added", ^{
    [[mockBinding expect] bind];
    [bindings addBinding:mockBinding];
    [mockBinding verify];
});

it(@"deactivates bindings as they are removed", ^{
    [bindings addBinding:mockBinding];
    [[mockBinding expect] unbind];
    [bindings removeBinding:mockBinding];
    [mockBinding verify];
});

SpecEnd
