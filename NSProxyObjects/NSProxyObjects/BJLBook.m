//
//  BJLBook.m
//  NSProxyObjects
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLBook.h"

@interface DumbClass : NSObject
@end

@implementation DumbClass

- (int)hack1
{
    return 1;
}

- (int)hack2
{
    return 2;
}

- (int)hack3
{
    return 3;
}

@end


@implementation BJLBook

- (id)init
{
    self = [super init];
    if (self) {
        [self doSomeDynamicStuff];
    }
    return self;
}

- (void)readBook
{
    NSLog(@"Reading the damn book...");
    NSLog(@"Class of message: %@", NSStringFromClass([self class]));
}

- (NSUInteger)numberOfPages
{
    return 300;
}

- (void)doSomeDynamicStuff
{
    NSArray *allMethodNames = @[@"hack1", @"hack2", @"hack3"];
    DumbClass *dumbObject = [[DumbClass alloc] init];
    
    NSString *randomSelString = allMethodNames[arc4random_uniform(3)];
    SEL aSel = NSSelectorFromString(randomSelString);
    NSMethodSignature *sig = [DumbClass instanceMethodSignatureForSelector:aSel];
    
    NSInvocation *invoker = [NSInvocation invocationWithMethodSignature:sig];
    [invoker setSelector:aSel];
    [invoker invokeWithTarget:dumbObject];
    
    int result;
    [invoker getReturnValue:&result];
    
    NSLog(@"Result: %i", result);
}

@end
