//
//  BNDProperty.m
//  Bindings
//
//  Created by Ryan Davies on 24/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDProperty.h"

@interface BNDProperty ()
@property (strong, nonatomic) id object;
@property (copy, nonatomic) NSString *keyPath;
@end

@implementation BNDProperty

- (id)initWithObject:(id)object keyPath:(NSString *)keyPath
{
    if (self = [self init]) {
        self.object  = object;
        self.keyPath = keyPath;
    }
    return self;
}

- (id)value
{
    return [[self object] valueForKeyPath:[self keyPath]];
}

- (void)setValue:(id)value
{
    [[self object] setValue:value forKeyPath:[self keyPath]];
}

@end
