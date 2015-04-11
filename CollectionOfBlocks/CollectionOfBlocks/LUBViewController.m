//
//  LUBViewController.m
//  CollectionOfBlocks
//
//  Created by Bryan Luby on 4/25/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBViewController.h"
#import "LUBBlockCollector.h"

@interface LUBViewController ()

@end

@implementation LUBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self testSomeBlocks];
    [self enumerateBlocks];
}

- (void)testSomeBlocks
{
    BasicBlock basic = [LUBBlockCollector dictionaryOfBlocks][@"basic"];
    basic();
    
    ArrayBlock array = [LUBBlockCollector dictionaryOfBlocks][@"array"];
    NSArray *anArray = array();
    NSLog(@"%@", anArray);
    
    BasicBlockWithArgument arg = [LUBBlockCollector dictionaryOfBlocks][@"basicArg"];
    BOOL test = self.view != nil;
    arg(test);
    
    BlockCreateStringFromString stringBlock = [LUBBlockCollector dictionaryOfBlocks][@"stringBlock"];
    NSLog(@"%@", stringBlock(@"this was a lowercase string"));
    
    CompletionBlock completionBlock = [LUBBlockCollector dictionaryOfBlocks][@"completionBlock"];
    
    NSError *error = nil;
    completionBlock(@"Hello", error);
    
    myBlock();
}

- (void)enumerateBlocks
{
    NSDictionary *blockDict = [LUBBlockCollector dictionaryOfBlocks];
    
    [blockDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"Key:   %@", key);
        NSLog(@"Block: %@", obj);
    }];
}

@end
