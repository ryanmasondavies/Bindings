//
//  BNDTriggerDelegate.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNDTrigger;

@protocol BNDTriggerDelegate <NSObject>

- (void)triggerDidFire:(BNDTrigger *)trigger;

@end
