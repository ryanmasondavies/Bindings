//
//  BNDValue.h
//  Bindings
//
//  Created by Ryan Davies on 24/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNDValue : NSObject

- (id)initWithObject:(id)object keyPath:(NSString *)keyPath;

- (id)retrieve;
- (void)assign:(id)value;

@property (strong, nonatomic) id object;
@property (copy, nonatomic) NSString *keyPath;
@end
