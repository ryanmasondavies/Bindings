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
