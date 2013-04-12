// The MIT License
// 
// Copyright (c) 2013 Ryan Davies
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import "BNDTriggerDelegate.h"
@protocol BNDProperty, BNDTrigger;

/** Defines a relationship between a property on the _source_ and another on the _destination_. Triggers are used to notify the binding when the source's value changes. */
@interface BNDBinding : NSObject <BNDTriggerDelegate>

/** Initializes a binding.
 @param sourceProperty The property to observe. See @protocol(BNDProperty).
 @param destinationProperty The property to apply changes to. See @protocol(BNDProperty).
 @return An initialized instance of BNDBinding. */
- (id)initWithSourceProperty:(id <BNDProperty>)sourceProperty destinationProperty:(id <BNDProperty>)destinationProperty;

/** @param trigger The trigger to add the binding. */
 - (void)addTrigger:(id <BNDTrigger>)trigger;

/** @param trigger The trigger to remove from the binding. */
 - (void)removeTrigger:(id <BNDTrigger>)trigger;

/** Binds the destination's property to the source's. */
- (void)bind;

/** Releases the binding, allowing source's value to change without being applied to the destination. */
- (void)unbind;

/** The property to be observed for changes. */
@property (strong, nonatomic, readonly) id <BNDProperty> sourceProperty;

/** The property which changes are applied to. */
@property (strong, nonatomic, readonly) id <BNDProperty> destinationProperty;

@end
