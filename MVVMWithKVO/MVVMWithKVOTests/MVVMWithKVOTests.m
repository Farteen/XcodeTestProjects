//
//  MVVMWithKVOTests.m
//  MVVMWithKVOTests
//
//  Created by Bryan Luby on 10/27/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PersonViewModel.h"

@interface MVVMWithKVOTests : XCTestCase
@property (strong, nonatomic) PersonViewModel *personViewModel;
@end

@implementation MVVMWithKVOTests

- (void)setUp
{
    [super setUp];
    self.personViewModel = [[PersonViewModel alloc] init];
}

- (void)tearDown
{
    self.personViewModel = nil;
    [super tearDown];
}

- (void)testPersonModelExists
{
    XCTAssertNotNil(self.personViewModel, @"personViewModel should not be nil");
}

- (void)testPersonViewModelInitialCurrentNameIsMary
{
    XCTAssertEqualObjects(self.personViewModel.currentName, @"Mary", @"Initial name should be set to Mary");
}

- (void)testPersonViewModelCurrentNameChange
{
    NSString *initialName = self.personViewModel.currentName; // Mary
    [self.personViewModel pickRandomName:nil];
    NSString *nameAfterChange = self.personViewModel.currentName;
    XCTAssertNotEqualObjects(initialName, nameAfterChange, @"Name should be different from initial name");
}

@end
