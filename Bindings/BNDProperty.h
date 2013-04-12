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

/** The interface for a property, extracted so that other objects may appear to be properties. */
@protocol BNDProperty <NSObject>

/** @return The value of the property. Primitive types are converted as they are using Key Value Coding - to either NSValue or NSNumber, whichever is appropriate. */
- (id)value;

/** Uses Key Value Coding to set the value of the property.
 @param value The new value for the property. */
- (void)setValue:(id)value;

@end

/** Defines a property on an object by its key path. */
@interface BNDProperty : NSObject <BNDProperty>

/** Initializes a new property.
 @param object The object on which the property exists.
 @param keyPath The key path which leads to the value of the property.
 @return A new instance of BNDProperty. */
- (id)initWithObject:(id)object keyPath:(NSString *)keyPath;

/** The object on which the property exists. */
@property (strong, nonatomic, readonly) id object;

/** The key path which leads to the value of the property. */
@property (copy, nonatomic, readonly) NSString *keyPath;

@end
