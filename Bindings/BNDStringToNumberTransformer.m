//
//  BNDStringToNumberTransformer.m
//  Bindings
//
//  Created by Ryan Davies on 24/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

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
