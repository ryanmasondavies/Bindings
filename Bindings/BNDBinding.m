//
//  BNDBinding.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDBinding.h"
#import "BNDTrigger.h"

@interface BNDBinding ()
@property (strong, nonatomic) id source;
@property (strong, nonatomic) id destination;
@property (copy, nonatomic) NSString *sourceKeyPath;
@property (copy, nonatomic) NSString *destinationKeyPath;
@property (strong, nonatomic) NSMutableSet *triggers;
@end

@implementation BNDBinding

- (id)initWithSource:(id)source sourceKeyPath:(NSString *)sourceKeyPath destination:(id)destination destinationKeyPath:(NSString *)destinationKeyPath
{
    if (self = [self init]) {
        self.source             = source;
        self.sourceKeyPath      = sourceKeyPath;
        self.destination        = destination;
        self.destinationKeyPath = destinationKeyPath;
        self.triggers           = [NSMutableSet set];
    }
    
    return self;
}

- (void)triggerDidFire:(BNDTrigger *)trigger
{
    [[self destination] setValue:[[self source] valueForKey:[self sourceKeyPath]] forKey:[self destinationKeyPath]];
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
