//
//  BNDTrigger.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNDTriggerDelegate.h"

@interface BNDTrigger : NSObject

- (void)startFiring;
- (void)stopFiring;

@end
