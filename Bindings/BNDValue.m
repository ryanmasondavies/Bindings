//
//  BNDValue.m
//  Bindings
//
//  Created by Ryan Davies on 24/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDValue.h"

@implementation BNDValue

- (id)initWithObject:(id)object keyPath:(NSString *)keyPath
{
    if (self = [self init]) {
        self.object  = object;
        self.keyPath = keyPath;
    }
    return self;
}

- (id)retrieve
{
    return [[self object] valueForKeyPath:[self keyPath]];
}

- (void)assign:(id)value
{
    [[self object] setValue:value forKeyPath:[self keyPath]];
}

@end
