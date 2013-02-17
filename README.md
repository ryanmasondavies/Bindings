Bindings
========

Bindings is an iOS library inspired by Cocoa Bindings.

A binding defines a connection between a value on one object – the _source_ – and a value on another object: the _destination_. The destination's value will be updated whenever the source's changes.

This pattern can simplify view controllers by entirely removing the need for glue code - code which updates views from the model or vice versa. It can also be used at the model layer to enforce relationships.

The code for a simple binding might look like this:

    // Set up the environment
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    RDPersonViewController *personVC = [storyboard instantiateInitialViewController];
    personVC.person = [[Person alloc] initWithName:@"Jimmy"];
    
    // Create a bind between person's name attribute and the text field's text
    // ensuring that the text field will always display the person's name
    BNDBinding *binding = [[BNDBinding alloc] initWithSource:[personVC person] sourceKeyPath:@"name" destination:[personVC textField] destinationKeyPath:@"text"];
    
    // Add to the VC
    personVC.bindings = [[BNDBindings alloc] initWithBinding:binding];

Certain elements of UIKit do not necessarily adhere to key-value observing, and opt for the target-action pattern, delegation, or notifications.

For this purpose, a binding may be encapsulated within a _trigger_. A trigger can be treated in the same way as a binding, and will respond to the same methods. It is responsible for triggering an update to the bind whenever necessary - most often in the event of a notification.

UITextField, for example, does not send KVO notifications when `[UITextField name]` is modified – it instead sends out an UITextFieldTextDidChangeNotification. A trigger can listen for notifications from a specific text field and tell the binding to update accordingly.

Following on from the above code exerpt, a bind can be added to update the person's name when the text field's content is changed:

    // Create a binding as normal
    BNDBinding *triggeredBinding = [[BNDBinding alloc] initWithSource:[personVC textField] sourceKeyPath:@"text" destination:[personVC person] destinationKeyPath:@"name"];

    // Wrap it in a notification trigger
    triggeredBinding = [[BNDNotificationTrigger alloc] initWithBinding:triggeredBinding notificationCenter:[NSNotificationCenter defaultCenter] notificationName:UITextFieldTextDidChangeNotification sender:[personVC textField]];

    // Add it to the VC's bindings
    [[personVC bindings] addBinding:triggeredBinding];

When the trigger receives a UITextFieldTextDidChangeNotification, it will update person's name using the new text.

Installation
============

To install Bindings in your project, add it to your Podfile: `pod 'Bindings', '~> 0.1.0'`.

License
=======

    Copyright (c) 2013 Ryan Davies

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.
