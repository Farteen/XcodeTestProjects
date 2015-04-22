//
//  LUBObjectDescriptionTests.m
//  ObjectDescriptionUtility
//
//  Created by Bryan Luby on 4/30/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LUBObjectDescription.h"
#import "LUBPerson.h"

@interface LUBObjectDescriptionTests : XCTestCase

@property (nonatomic, strong) LUBPerson *person;

@end

@implementation LUBObjectDescriptionTests

- (void)setUp
{
    [super setUp];

    self.person = [[LUBPerson alloc] init];
}

- (void)tearDown
{
    self.person = nil;

    [super tearDown];
}

- (void)testPassingNilObjectDoesNotThrowException
{
    XCTAssertNoThrow([LUBObjectDescription descriptionStringForObject:nil],
                     @"Should not throw an exception when object is nil");
}

- (void)testNilObjectReturnsNilDescriptionString
{
    XCTAssertNil([LUBObjectDescription descriptionStringForObject:nil],
                 @"Description should be nil when object is nil");
}

@end
