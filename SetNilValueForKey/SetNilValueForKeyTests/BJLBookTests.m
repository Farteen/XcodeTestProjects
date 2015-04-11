//
//  BJLBookTests.m
//  SetNilValueForKey
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BJLBook.h"

@interface BJLBookTests : XCTestCase
@property (strong, nonatomic) BJLBook *book;
@end

@implementation BJLBookTests

- (void)setUp
{
    [super setUp];
    self.book = [[BJLBook alloc] init];
}

- (void)tearDown
{
    self.book = nil;
    [super tearDown];
}

- (void)testBookExists
{
    XCTAssertNotNil(self.book, @"Book should not be nil");
}

- (void)testBookGetsProperDefaultYearWhenItsNil
{
    [self.book setValue:nil forKey:@"year"];
    
    NSUInteger desiredDefaultYear = 2000;
    XCTAssertEqual(desiredDefaultYear, self.book.year, @"Book should have proper default data when property is not set");
}

- (void)testBookGetsProperDefaultCopiesSoldWhenItsSetToNil
{
    [self.book setValue:nil forKey:@"copiesSold"];
    
    NSUInteger desiredDefaultSales = 1000;
    XCTAssertEqual(desiredDefaultSales, self.book.copiesSold, @"Book should have proper default data when property is not set");
}

@end
