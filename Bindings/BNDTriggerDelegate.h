//
//  BNDTriggerDelegate.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol BNDTrigger;

/** Defines objects which triggers fire upon. */
@protocol BNDTriggerDelegate <NSObject>

/** Notifies an object that the trigger has been fired. See the independent implementation of triggers to find out what it means to have 'fired'.
 @param trigger The trigger which has fired. */
- (void)triggerDidFire:(id <BNDTrigger>)trigger;

@end
