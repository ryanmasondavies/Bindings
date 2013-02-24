//
//  BNDBinding.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDBinding.h"
#import "BNDValue.h"
#import "BNDTrigger.h"

@interface BNDBinding ()
@property (strong, nonatomic) BNDValue *source;
@property (strong, nonatomic) BNDValue *destination;
@property (strong, nonatomic) NSMutableSet *triggers;
@end

@implementation BNDBinding

- (id)initWithSource:(id)source destination:(id)destination
{
    if (self = [self init]) {
        self.source      = source;
        self.destination = destination;
        self.triggers    = [NSMutableSet set];
    }
    
    return self;
}

- (void)triggerDidFire:(BNDTrigger *)trigger
{
    [[self destination] assign:[[self source] retrieve]];
}

- (void)bind
{
    [[self triggers] makeObjectsPerformSelector:@selector(startFiring)];
}

- (void)unbind
{
    [[self triggers] makeObjectsPerformSelector:@selector(stopFiring)];
}

- (void)addTrigger:(BNDTrigger *)trigger
{
    [[self triggers] addObject:trigger];
}

- (void)removeTrigger:(BNDTrigger *)trigger
{
    [[self triggers] removeObject:trigger];
}

- (void)dealloc
{
    [self unbind];
}

@end
