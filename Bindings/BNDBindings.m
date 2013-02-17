//
//  BNDBindings.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDBindings.h"
#import "BNDBinding.h"

@interface BNDBindings ()
@property (strong, nonatomic) NSMutableSet *bindings;
@end

@implementation BNDBindings

- (id)init
{
    if (self = [super init]) {
        self.bindings = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addBinding:(BNDBinding *)binding
{
    [[self bindings] addObject:binding];
    [binding bind];
}

- (void)removeBinding:(BNDBinding *)binding
{
    [[self bindings] removeObject:binding];
    [binding unbind];
}

@end
