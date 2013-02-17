//
//  BNDBinding.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDBinding.h"

@interface BNDBinding ()
@property (strong, nonatomic) id source;
@property (strong, nonatomic) id destination;
@property (copy, nonatomic) NSString *sourceKeyPath;
@property (copy, nonatomic) NSString *destinationKeyPath;
@end

@implementation BNDBinding

- (id)initWithSource:(id)source sourceKeyPath:(NSString *)sourceKeyPath destination:(id)destination destinationKeyPath:(NSString *)destinationKeyPath
{
    if (self = [self init]) {
        self.source = source;
        self.sourceKeyPath = sourceKeyPath;
        self.destination = destination;
        self.destinationKeyPath = destinationKeyPath;
    }
    
    return self;
}

- (void)bind
{
    [[self source] addObserver:self forKeyPath:[self sourceKeyPath] options:0 context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [[self destination] setValue:[[self source] valueForKeyPath:[self sourceKeyPath]] forKeyPath:[self destinationKeyPath]];
}

- (void)unbind
{
    [[self source] removeObserver:self forKeyPath:[self sourceKeyPath]];
}

@end
