//
//  BNDTrigger.h
//  Bindings
//
//  Created by Ryan Davies on 17/02/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNDTriggerDelegate.h"

/** A trigger fires when the observed value on the binding's source changes. The most common mechanism used to notify an object of a property value change is KVO, however it is not consistently used, especially in UIKit. A trigger may use other means: notifications, delegation, or the target-action pattern. These different methods are encapsulated as subclasses of BNDTrigger. */
@interface BNDTrigger : NSObject

/** Start observing the source property through whatever means. */
- (void)startFiring;

/** Stop observing the source property. */
- (void)stopFiring;

/** The object to be informed of changes to the source property. */
@property (weak, nonatomic) id <BNDTriggerDelegate> delegate;

@end
