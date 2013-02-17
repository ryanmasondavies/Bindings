//
//  BNDBinding.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNDTriggerDelegate.h"

/** Defines a strict relationship between a property on the _source_ and another on the _destination_. Triggers are used to notify the binding when the source's value changes. */
@interface BNDBinding : NSObject <BNDTriggerDelegate>

/** Initializes a binding.
 @param source The object to observe.
 @param sourceKeyPath The key path for the property to be observed on the source object.
 @param destination The object which the changes will be applied to.
 @param destinationKeyPath The key path for the property to apply the changes to. Does not need to match sourceKeyPath.
 @return An initialized instance of BNDBinding. */
- (id)initWithSource:(id)source sourceKeyPath:(NSString *)sourceKeyPath destination:(id)destination destinationKeyPath:(NSString *)destinationKeyPath;

/** @param trigger The trigger to add the binding. */
 - (void)addTrigger:(BNDTrigger *)trigger;

/** @param trigger The trigger to remove from the binding. */
 - (void)removeTrigger:(BNDTrigger *)trigger;

/** Binds the destination's property to the source's. */
- (void)bind;

/** Releases the binding, allowing source's value to change without being applied to the destination. */
- (void)unbind;

/** The source object to be observed for changes. */
@property (strong, nonatomic, readonly) id source;

/** The destination object to have changes applied to it. */
@property (strong, nonatomic, readonly) id destination;

/** The key path for the property on source to be observed. */
@property (copy, nonatomic, readonly) NSString *sourceKeyPath;

/** The key path for the property on destination to be updated. */
@property (copy, nonatomic, readonly) NSString *destinationKeyPath;

@end
