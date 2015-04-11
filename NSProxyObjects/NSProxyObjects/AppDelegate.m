//
//  AppDelegate.m
//  NSProxyObjects
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "AppDelegate.h"
#import "MessageInterceptor.h"
#import "BJLBook.h"
#import "Person.h"

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self performInterception];
    [self doAnotherInterception];
    return YES;
}

- (void)performInterception
{
    BJLBook *newBook = [[BJLBook alloc] init];
    [newBook readBook];
    
    id interceptor = [[MessageInterceptor alloc] initWithTarget:newBook];
    [interceptor readBook];
    
    NSMutableString *newString = [NSMutableString string];
    [interceptor setCurrentTarget:newString];
    
    [interceptor appendString:@"Hello"];
    
    NSLog(@"String: %@", newString);
    NSLog(@"Intercepted messages: %@", [interceptor interceptedMessages]);
}

- (void)doAnotherInterception
{
    id newPerson = [[Person alloc] init];
    
    SEL coolSelector = [newPerson selectorForCurrentState];
    SuppressPerformSelectorLeakWarning([newPerson performSelector:coolSelector]);
    
    NSLog(@"Current Name: %@", [newPerson currentName]);
    
    BJLBook *newBook = [[BJLBook alloc] init];
    [newPerson setBook:newBook];
    
    NSLog(@"Current Name: %@", [newPerson currentName]);
    
    coolSelector = [newPerson selectorForCurrentState];
    SuppressPerformSelectorLeakWarning([newPerson performSelector:coolSelector]);
    
    [newPerson readBook];
    NSUInteger bookPages = [newPerson numberOfPages];
    NSLog(@"Pages: %@", @(bookPages));
}

@end
