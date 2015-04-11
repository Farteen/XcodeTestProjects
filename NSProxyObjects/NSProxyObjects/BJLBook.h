//
//  BJLBook.h
//  NSProxyObjects
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJLBook : NSObject

@property (nonatomic, copy) NSArray *allMethodNames;
@property (nonatomic, copy) NSString *title;

- (void)readBook;
- (NSUInteger)numberOfPages;
- (void)doSomeDynamicStuff;

@end
