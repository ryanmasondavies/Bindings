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
#import "BNDTrigger.h"
@protocol BNDTriggerDelegate;

/** Watches for notifications. Not all objects use the KVO mechanism to inform of property changes, and instead use notifications. */
@interface BNDNotificationTrigger : NSObject <BNDTrigger>

/** Initializes a new instance.
 @param notificationCenter The notification center through which notifications may be received.
 @param notificationName The name of the notification to be received.
 @param sender The object which sends the notification. Optional.
 @param delegate The object to be informed when a notification is received.
 @return An initialized instance. */
- (id)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter notificationName:(NSString *)notificationName sender:(id)sender delegate:(id <BNDTriggerDelegate>)delegate;

/** Start listening for notifications in the notificationCenter. */
- (void)startFiring;

/** Stop listening for notifications in the notificationCenter. */
- (void)stopFiring;

/** The notification center through which notifications may be received. */
@property (strong, nonatomic, readonly) NSNotificationCenter *notificationCenter;

/** The name of the notification to be received. */
@property (copy,   nonatomic, readonly) NSString *notificationName;

/** The object which sends the notification. Optional. */
@property (strong, nonatomic, readonly) id sender;

/** The object to be informed when a notification is received. */
@property (weak, nonatomic) id <BNDTriggerDelegate> delegate;

@end
