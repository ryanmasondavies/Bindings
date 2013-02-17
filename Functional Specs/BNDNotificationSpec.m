NSString * const BNDNotificationModelNameDidChange = @"BNDNotificationModelNameDidChange";

@interface BNDNotificationModel : NSObject
@property (strong, nonatomic) NSString *name;
@end

@implementation BNDNotificationModel

- (void)setName:(NSString *)name
{
    _name = name;
    [[NSNotificationCenter defaultCenter] postNotificationName:BNDNotificationModelNameDidChange object:self];
}

@end

SpecBegin(BNDNotificationSpec)

it(@"listens for notifications to update the destination's property", ^{
    BNDBindings          *bindings;
    BNDNotificationModel *source;
    NSMutableDictionary  *destination;
    NSString             *sourceKeyPath;
    NSString             *destinationKeyPath;
    
    bindings           = [[BNDBindings alloc] init];
    source             = [[BNDNotificationModel alloc] init];
    destination        = [NSMutableDictionary dictionary];
    sourceKeyPath      = @"name";
    destinationKeyPath = @"first name";
    
    [source setValue:@"Jimmy" forKey:sourceKeyPath];
    [destination setObject:@"Fred" forKey:destinationKeyPath];
    
    BNDBinding *binding = [[BNDBinding alloc] initWithSource:source sourceKeyPath:sourceKeyPath destination:destination destinationKeyPath:destinationKeyPath];
    BNDTrigger *trigger = [[BNDNotificationTrigger alloc] initWithNotificationCenter:[NSNotificationCenter defaultCenter] notificationName:BNDNotificationModelNameDidChange sender:source delegate:binding];
    [binding addTrigger:trigger];
    [bindings addBinding:binding];
    
    [source setValue:@"Bobby" forKey:sourceKeyPath];
    NSAssert(destination[destinationKeyPath], @"");
    [[destination[destinationKeyPath] should] beEqualTo:@"Bobby"];
});

SpecEnd
