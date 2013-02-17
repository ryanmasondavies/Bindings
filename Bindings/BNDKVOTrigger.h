//
//  BNDKVOTrigger.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "BNDTrigger.h"

@interface BNDKVOTrigger : BNDTrigger

- (id)initWithKeyPath:(NSString *)keyPath object:(id)object delegate:(id <BNDTriggerDelegate>)delegate;

@property (copy,   nonatomic, readonly) NSString *keyPath;
@property (strong, nonatomic, readonly) id object;

@end
