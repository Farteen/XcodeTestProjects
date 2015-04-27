//
//  TestClass.m
//  Nullability
//
//  Created by Bryan Luby on 4/21/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass

- (nonnull NSString *)aMethodThatReturnsANonnullString
{
    // No compiler warning for this!
    return nil;
}

- (void)aMethodThatTakesNonnullParameter:(nonnull NSString *)string
{
    
}

@end

@interface SomeOtherClass : NSObject

@end

@implementation SomeOtherClass

- (void)test
{
    TestClass *anInstance = [[TestClass alloc] init];
    // Correctly gives a compiler warning.
    [anInstance aMethodThatTakesNonnullParameter:nil];
}

@end