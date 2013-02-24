//
//  BNDBinding.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDBinding.h"
#import "BNDProperty.h"
#import "BNDTrigger.h"

@interface BNDBinding ()
@property (strong, nonatomic) BNDProperty *sourceProperty;
@property (strong, nonatomic) BNDProperty *destinationProperty;
@property (strong, nonatomic) NSMutableSet *triggers;
@end

@implementation BNDBinding

- (id)initWithSourceProperty:(BNDProperty *)sourceProperty destinationProperty:(BNDProperty *)destinationProperty
{
    if (self = [self init]) {
        self.sourceProperty      = sourceProperty;
        self.destinationProperty = destinationProperty;
        self.triggers            = [NSMutableSet set];
    }
    
    return self;
}

- (void)triggerDidFire:(id <BNDTrigger>)trigger
{
    [[self destinationProperty] setValue:[[self sourceProperty] value]];
}

- (void)bind
{
    [[self triggers] makeObjectsPerformSelector:@selector(startFiring)];
}

- (void)unbind
{
    [[self triggers] makeObjectsPerformSelector:@selector(stopFiring)];
}

- (void)addTrigger:(id <BNDTrigger>)trigger
{
    [[self triggers] addObject:trigger];
}

- (void)removeTrigger:(id <BNDTrigger>)trigger
{
    [[self triggers] removeObject:trigger];
}

- (void)dealloc
{
    [self unbind];
}

@end
