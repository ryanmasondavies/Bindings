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
@protocol BNDTriggerDelegate;

/** A trigger fires when the observed value on the binding's source changes. The most common mechanism used to notify an object of a property value change is KVO, however it is not consistently used, especially in UIKit. A trigger may use other means: notifications, delegation, or the target-action pattern. These different methods are encapsulated as subclasses of BNDTrigger. */
@protocol BNDTrigger <NSObject>

/** Start observing the property through whatever means. */
- (void)startFiring;

/** Stop observing the property. */
- (void)stopFiring;

/** The object to be informed of changes to the property. */
@property (weak, nonatomic) id <BNDTriggerDelegate> delegate;

@end
