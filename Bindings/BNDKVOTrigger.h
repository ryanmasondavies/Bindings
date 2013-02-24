//
//  BNDKVOTrigger.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNDTrigger.h"
@protocol BNDTriggerDelegate;

/** Uses the KVO mechanism to be informed of changes to the source's property. */
@interface BNDKVOTrigger : NSObject <BNDTrigger>

/** Initializes a new instance.
 @param keyPath The key path for the property to be observed.
 @param object The object which the property belongs to.
 @param delegate The object to be informed of changes.
 @return An initialized instance. */
- (id)initWithKeyPath:(NSString *)keyPath object:(id)object delegate:(id <BNDTriggerDelegate>)delegate;

/** Start observing the property using Key-Value Observing. */
- (void)startFiring;

/** Stop observing the property. */
- (void)stopFiring;

/** The key path for the property to be observed. */
@property (copy,   nonatomic, readonly) NSString *keyPath;

/** The object which the property belongs to. */
@property (strong, nonatomic, readonly) id object;

/** The object to be informed of changes to the value. */
@property (weak, nonatomic) id <BNDTriggerDelegate> delegate;

@end
