//
//  LUBBlockCollector.m
//  CollectionOfBlocks
//
//  Created by Bryan Luby on 4/25/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBBlockCollector.h"

@implementation LUBBlockCollector

+ (NSDictionary *)dictionaryOfBlocks
{
    return @{@"basic": basic,
             @"basic2": basic2,
             @"array": array,
             @"basicArg": basicArg,
             @"stringBlock": stringBlock,
             @"completionBlock": completionBlock};
}

static BasicBlock basic = ^(void) {
    NSLog(@"Hello world");
};

static BasicBlock basic2 = ^(void) {
    NSLog(@"Cool");
};

static ArrayBlock array = ^(void) {
    return @[@"Hello"];
};

static BasicBlockWithArgument basicArg = ^(BOOL test) {
    if (test) {
        NSLog(@"It works");
    } else {
        NSLog(@"It doesn't work");
    }
};

static BlockCreateStringFromString stringBlock = ^(NSString *oldString) {
    return [oldString capitalizedString];
};

static CompletionBlock completionBlock = ^(id someObject, NSError *error) {
    if (error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    } else {
        NSLog(@"%@", someObject);
    }
};

@end
