//
//  Person.m
//  NSProxyObjects
//
//  Created by Bryan Luby on 12/9/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "Person.h"
#import "BJLBook.h"

@implementation Person

- (SEL)selectorForCurrentState
{
    if (self.book) {
        return @selector(sayHi);
    } else {
        return @selector(sayBy);
    }
}

- (void)sayHi
{
    NSLog(@"Hi!");
}

- (void)sayBy
{
    NSLog(@"By!");
}

- (NSString *)currentName
{
    SEL currentSelector = [self currentNameSelector];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//    [self.ticketTarget performSelector: self.ticketAction withObject: self];
    return [self performSelector:currentSelector];
#pragma clang diagnostic pop
}

- (SEL)currentNameSelector
{
    return self.book ? @selector(randomNamesAThroughG) : @selector(randomNamesHThroughP);
}

- (NSString *)randomNamesAThroughG
{
    NSArray *nameArray = @[@"Adam", @"Amy", @"Becky", @"Bob"];
//    return nameArray[arc4random_uniform(nameArray.count)];
    return nameArray[random() % nameArray.count];
}

- (NSString *)randomNamesHThroughP
{
    NSArray *nameArray = @[@"Harry", @"Jane", @"Judy", @"FooBar"];
    return nameArray[random() % nameArray.count];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([self.book respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self.book];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature *signature = [super methodSignatureForSelector:sel];
    if (!signature) {
        signature = [self.book methodSignatureForSelector:sel];
    }
    
    return signature;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([self.book respondsToSelector:aSelector]) {
        return YES;
    } else {
        return NO;
    }
}

@end
