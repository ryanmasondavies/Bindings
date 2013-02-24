//
//  BNDBinding.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNDTriggerDelegate.h"
@class BNDValue;

/** Defines a strict relationship between a property on the _source_ and another on the _destination_. Triggers are used to notify the binding when the source's value changes. */
@interface BNDBinding : NSObject <BNDTriggerDelegate>

/** Initializes a binding.
 @param source The value to observe. See BNDValue.
 @param destination The value to apply changes to. See BNDValue.
 @return An initialized instance of BNDBinding. */
- (id)initWithSource:(id)source destination:(id)destination;

/** @param trigger The trigger to add the binding. */
 - (void)addTrigger:(BNDTrigger *)trigger;

/** @param trigger The trigger to remove from the binding. */
 - (void)removeTrigger:(BNDTrigger *)trigger;

/** Binds the destination's property to the source's. */
- (void)bind;

/** Releases the binding, allowing source's value to change without being applied to the destination. */
- (void)unbind;

/** The value to be observed for changes. */
@property (strong, nonatomic, readonly) BNDValue *source;

/** The value to have changes applied to it. */
@property (strong, nonatomic, readonly) BNDValue *destination;

@end
