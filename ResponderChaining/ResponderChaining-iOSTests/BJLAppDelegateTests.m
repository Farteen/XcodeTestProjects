//
//  BJLAppDelegateTests.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/9/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BJLAppDelegate.h"

@interface BJLAppDelegateTests : XCTestCase
@property (nonatomic, strong) BJLAppDelegate *appDelegate;
@end

@implementation BJLAppDelegateTests

- (void)setUp
{
    [super setUp];
    self.appDelegate = [[BJLAppDelegate alloc] init];
}

- (void)tearDown
{
    self.appDelegate = nil;
    [super tearDown];
}

- (void)testAppDelegateHasANextResponder
{
    XCTAssertNotNil([self.appDelegate nextResponder], @"App delegate should have a next responder");
}

@end
