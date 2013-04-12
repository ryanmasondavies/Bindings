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

#import "BNDKVOTrigger.h"
#import "BNDTriggerDelegate.h"

@interface BNDKVOTrigger ()
@property (copy,   nonatomic) NSString *keyPath;
@property (strong, nonatomic) id object;
@end

@implementation BNDKVOTrigger

- (id)initWithKeyPath:(NSString *)keyPath object:(id)object delegate:(id <BNDTriggerDelegate>)delegate
{
    if (self = [self init]) {
        self.keyPath  = keyPath;
        self.object   = object;
        self.delegate = delegate;
    }
    return self;
}

- (void)startFiring
{
    [[self delegate] triggerDidFire:self];
    [[self object] addObserver:self forKeyPath:[self keyPath] options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:NULL];
}

- (BOOL)haveValuesChanged:(NSDictionary *)change
{
    id oldValue = change[NSKeyValueChangeOldKey];
    id newValue = change[NSKeyValueChangeNewKey];
    return ([newValue isEqual:oldValue] == NO);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([self haveValuesChanged:change]) {
        [[self delegate] triggerDidFire:self];
    }
}

- (void)stopFiring
{
    [[self object] removeObserver:self forKeyPath:[self keyPath]];
}

@end
