//
//  BNDBindings.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNDBinding;

/** A composite for bindings. */
@interface BNDBindings : NSObject

/** Adds a binding to the composite and activates it by calling [BNDBinding bind]. */
- (void)addBinding:(BNDBinding *)binding;

/** Removes the binding from the composite and deactivates it by calling [BNDBinding unbind]. */
- (void)removeBinding:(BNDBinding *)binding;

@end
