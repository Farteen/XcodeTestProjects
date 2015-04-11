//
//  BJLUIResponderTests.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/9/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BJLUIResponder.h"

@interface BJLUIResponderTests : XCTestCase

@end

@implementation BJLUIResponderTests

- (void)setUp
{
    [super setUp];

}

- (void)tearDown
{

    [super tearDown];
}

- (void)testBJLSecondUIResponderHasANextResponder
{
    BJLSecondUIResponder *secondResponder = [[BJLSecondUIResponder alloc] init];
    XCTAssertNotNil([secondResponder nextResponder], @"Should have a next responder");
}

- (void)testResponderObjectInheritsFromUIResponder
{
    BJLSecondUIResponder *secondResponder = [[BJLSecondUIResponder alloc] init];
    XCTAssertTrue([secondResponder isKindOfClass:[UIResponder class]], @"Should inherit from UIResponder");
}

- (void)testBJLLastUIResponderShouldNotHaveANextResponder
{
    BJLLastUIResponder *lastResponder = [[BJLLastUIResponder alloc] init];
    XCTAssertNil([lastResponder nextResponder], @"Should not have a next responder");
}

@end
