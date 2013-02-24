Bindings
========

A _binding_ defines a connection between a property on one object – the _source_ – and a property on another object: the _destination_.

This pattern can simplify view controllers by entirely removing the need for glue code - code which updates views from the model or vice versa. It can also be used at the model layer, or the view layer, to enforce relationships.

Triggers
--------

Cocoa informs a client of value changes using different methods: KVO, target-action, notifications, and delegation. For this reason, a binding is made up of multiple _triggers_, where a trigger responds to any one of these methods.

The code for a simple binding might look like this:

    // Set up the environment
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    RDPersonViewController *personVC = [storyboard instantiateInitialViewController];
    personVC.person = [[Person alloc] initWithName:@"Jimmy"];
    personVC.bindings = [[BNDBindings alloc] init];
    
    // Define the source property
    BNDProperty *sourceProperty = [[BNDProperty alloc] initWithObject:[personVC person] keyPath:@"name"];
    
    // Define the destination property
    BNDProperty *destinationProperty = [[BNDProperty alloc] initWithObject:[personVC textField] keyPath:@"text"];
    
    // Create a bind from the source property to the destination property
    BNDBinding *binding = [[BNDBinding alloc] initWithSourceProperty:sourceProperty destinationProperty:destinationProperty];
    
    // Add a trigger to update the binding when KVO notifications are sent for person's name property
    BNDTrigger *trigger = [[BNDKVOTrigger alloc] initWithKeyPath:@"name" object:[personVC person] delegate:binding];
    [binding addTrigger:trigger];
    
    // Add to the VC
    [[personVC bindings] addBinding:binding];

The above code exerpt is incomplete without a reverse binding to ensure person's name matches the text field's text, however UITextField does not send KVO notifications when `[UITextField name]` is modified – it instead sends out an `UITextFieldTextDidChangeNotification`.

A trigger can update the binding when a notification is received:

    // Create a binding as normal
    BNDBinding *binding = [[BNDBinding alloc] initWithSource:[personVC textField] sourceKeyPath:@"text" destination:[personVC person] destinationKeyPath:@"name"];

    // Create a trigger and add it to the binding
    BNDTrigger *trigger = [[BNDNotificationTrigger alloc] initWithNotificationCenter:[NSNotificationCenter defaultCenter] notificationName:UITextFieldTextDidChangeNotification sender:[personVC textField] delegate:binding];
    [binding addTrigger:trigger];

    // Add it to the VC's bindings
    [[personVC bindings] addBinding:binding];

When the trigger receives a `UITextFieldTextDidChangeNotification`, it will update person's name using the new text.

Transformers
------------

Values regularly need to be converted from one format to another, especially when being passed from the view layer to the model layer. Your user interface components may recognize data in a different format to your models, for example the user enters digits into a string, and your model accepts a number. A _transformer_ stands in place of a property object, converting values as they pass through:

    ------------       ---------------       -----------       ---------------       ------------
    | Property |  -->  | Transformer |  -->  | Binding |  -->  | Transformer |  -->  | Property |
    ------------       ---------------       -----------       ---------------       ------------

Transformers can convert the value either when it is retrieved from the source or when it is assigned to the destination - it does not matter. In the following example, `destinationProperty` is predefined as a property on an object:

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    destinationProperty = [[BNDStringToNumberTransformer alloc] initWithProperty:destinationProperty numberFormatter:formatter];

`destinationProperty` can continue to be treated as if it defines a property on an object.

Transformers may be chained by initializing a transformer with another transformer in place of the property, for example:

    transformer = [[CustomTransformer alloc] initWithProperty:transformer];

Currently the only built in transformer is `BNLStringToNumberTransformer`. Suggestions and contributions are welcome.

Installation
============

To install Bindings in your project, add it to your Podfile: `pod 'Bindings', '~> 0.2.0'`.

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
