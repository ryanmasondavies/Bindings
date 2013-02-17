//
//  BNDBinding.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNDTriggerDelegate.h"

@interface BNDBinding : NSObject <BNDTriggerDelegate>

- (id)initWithSource:(id)source sourceKeyPath:(NSString *)sourceKeyPath destination:(id)destination destinationKeyPath:(NSString *)destinationKeyPath;

@property (strong, nonatomic, readonly) id source;
@property (strong, nonatomic, readonly) id destination;
@property (copy, nonatomic, readonly) NSString *sourceKeyPath;
@property (copy, nonatomic, readonly) NSString *destinationKeyPath;

@end
