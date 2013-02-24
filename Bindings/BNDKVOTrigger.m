//
//  BNDKVOTrigger.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDKVOTrigger.h"
#import "BNDTriggerDelegate.h"

@interface BNDKVOTrigger ()
@property (copy,   nonatomic) NSString *keyPath;
@property (strong, nonatomic) id object;
@end

@implementation BNDKVOTrigger

- (id)initWithKeyPath:(NSString *)keyPath object:(id)object delegate:(id <BNDTriggerDelegate>)delegate
{
    if (self = [self init]) {
        self.keyPath  = keyPath;
        self.object   = object;
        self.delegate = delegate;
    }
    return self;
}

- (void)startFiring
{
    [[self delegate] triggerDidFire:self];
    [[self object] addObserver:self forKeyPath:[self keyPath] options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:NULL];
}

- (BOOL)haveValuesChanged:(NSDictionary *)change
{
    id oldValue = change[NSKeyValueChangeOldKey];
    id newValue = change[NSKeyValueChangeNewKey];
    return ([newValue isEqual:oldValue] == NO);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([self haveValuesChanged:change]) {
        [[self delegate] triggerDidFire:self];
    }
}

- (void)stopFiring
{
    [[self object] removeObserver:self forKeyPath:[self keyPath]];
}

@end
