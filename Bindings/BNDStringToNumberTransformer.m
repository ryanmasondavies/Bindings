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

#import "BNDStringToNumberTransformer.h"

@interface BNDStringToNumberTransformer ()
@property (strong, nonatomic) id <BNDProperty> property;
@property (strong, nonatomic) NSNumberFormatter *numberFormatter;
@end

@implementation BNDStringToNumberTransformer

- (id)initWithProperty:(id <BNDProperty>)property numberFormatter:(NSNumberFormatter *)numberFormatter
{
    if (self = [self init]) {
        self.property        = property;
        self.numberFormatter = numberFormatter;
    }
    return self;
}

- (void)setValue:(id)value
{
    [[self property] setValue:[[self numberFormatter] numberFromString:value]];
}

- (id)value
{
    return [[self numberFormatter] numberFromString:[[self property] value]];
}

@end
