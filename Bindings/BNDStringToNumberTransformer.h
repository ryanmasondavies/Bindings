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
#import "BNDTransformer.h"

/** Converts strings to numbers. */
@interface BNDStringToNumberTransformer : NSObject <BNDTransformer>

/** Initializes a new transformer.
 @param property The property which the transformer stores the converted value in, or reads the original value from.
 @param numberFormatter The number formatter to be used for transforming the value to and from a string.
 @return A new instance of BNDStringToNumberTransformer. */
- (id)initWithProperty:(id <BNDProperty>)property numberFormatter:(NSNumberFormatter *)numberFormatter;

/** Converts the value of property to a number. 
 @param value The string to be converted. */
- (void)setValue:(id)value;

/** @return The value of property as a number. */
- (id)value;

/** The property which contains the value to be converted. */
@property (strong, nonatomic, readonly) id <BNDProperty> property;

/** The number formatter to be used for transforming the value to and from a string. */
@property (strong, nonatomic, readonly) NSNumberFormatter *numberFormatter;

@end
