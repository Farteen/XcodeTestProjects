//
//  MessageInterceptor.m
//  NSProxyObjects
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

@interface BJLStealthClass : NSObject
@end

@implementation BJLStealthClass

- (void)readBook
{
    NSLog(@"Reading the book...");
    NSLog(@"Class of message: %@", NSStringFromClass([self class]));
}

@end

#import "MessageInterceptor.h"

@interface MessageInterceptor ()
@end

@implementation MessageInterceptor

- (id)initWithTarget:(id)aTarget
{
    if (self) {
        _currentTarget = aTarget;
        _interceptedMessages = [NSMutableArray array];
    }
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSString *message = NSStringFromSelector([invocation selector]);
    [self.interceptedMessages addObject:message];
    
    // Test to see if proxied object responds to selector
    if ([self.currentTarget respondsToSelector:[invocation selector]]) {
        [invocation invokeWithTarget:self.currentTarget];
    } else {
        [super forwardInvocation:invocation];
    }
    
    // Or test the message?
    if ([message isEqualToString:@"readBook"]) {
        BJLStealthClass *stealthClass = [[BJLStealthClass alloc] init];
        [invocation invokeWithTarget:stealthClass];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    return [self.currentTarget methodSignatureForSelector:sel];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([self.currentTarget respondsToSelector:aSelector]) {
        return YES;
    } else {
        return NO;
    }
}

@end
