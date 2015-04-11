//
//  LUBPersonTests.m
//  SecureCoding
//
//  Created by Bryan Luby on 3/21/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LUBPerson.h"

@interface LUBPersonTests : XCTestCase
@property (strong, nonatomic) LUBPerson *person;
@end

@implementation LUBPersonTests

- (void)setUp
{
    [super setUp];
    self.person = [[LUBPerson alloc] init];
}

- (void)testPersonConformsToSecureCodingProtocol
{
    XCTAssert([LUBPerson conformsToProtocol:@protocol(NSSecureCoding)],
              @"Person should conform to NSSecureCoding protocol.");
}

- (void)testPersonClassSupportsSecureCoding
{
    XCTAssert([LUBPerson supportsSecureCoding],
              @"Person class should support Secure Coding.");
}

- (void)testPersonClassOnlyAllowsSelectClasses
{
    XCTAssert([self.person conformsToProtocol:@protocol(NSSecureCoding)], @"");
}

@end
