//
//  BNDProperty.h
//  Bindings
//
//  Created by Ryan Davies on 24/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Defines a property on an object by its key path. */
@interface BNDProperty : NSObject

/** Initializes a new property.
 @param object The object on which the property exists.
 @param keyPath The key path which leads to the value of the property.
 @return A new instance of BNDProperty. */
- (id)initWithObject:(id)object keyPath:(NSString *)keyPath;

/** @return The value of the property. Primitive types are converted as they are using Key Value Coding - to either NSValue or NSNumber, whichever is appropriate. */
- (id)value;

/** Uses Key Value Coding to set the value of the property.
 @param value The new value for the property. */
- (void)setValue:(id)value;

/** The object on which the property exists. */
@property (strong, nonatomic, readonly) id object;

/** The key path which leads to the value of the property. */
@property (copy, nonatomic, readonly) NSString *keyPath;

@end
