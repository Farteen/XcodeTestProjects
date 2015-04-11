//
//  LUBBlockCollector.h
//  CollectionOfBlocks
//
//  Created by Bryan Luby on 4/25/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BasicBlock)(void);
typedef NSArray *(^ArrayBlock)(void);
typedef void(^BasicBlockWithArgument)(BOOL test);
typedef NSString *(^BlockCreateStringFromString)(NSString *oldString);
typedef void(^CompletionBlock)(id someObject, NSError *error);

@interface LUBBlockCollector : NSObject

+ (NSDictionary *)dictionaryOfBlocks;

@end
