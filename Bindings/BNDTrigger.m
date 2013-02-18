//
//  BNDTrigger.m
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDTrigger.h"

@implementation BNDTrigger

- (void)startFiring
{
    [[self delegate] triggerDidFire:self];
}

- (void)stopFiring
{
}

@end
