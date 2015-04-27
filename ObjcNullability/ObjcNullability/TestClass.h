//
//  TestClass.h
//  Nullability
//
//  Created by Bryan Luby on 4/21/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject

- (nonnull NSString *)aMethodThatReturnsANonnullString;

- (void)aMethodThatTakesNonnullParameter:(nonnull NSString *)string;

@end
