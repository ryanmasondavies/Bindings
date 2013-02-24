//
//  BNDStringToNumberTransformer.h
//  Bindings
//
//  Created by Ryan Davies on 24/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

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
