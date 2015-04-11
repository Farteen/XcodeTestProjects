//
//  Person.h
//  NSProxyObjects
//
//  Created by Bryan Luby on 12/9/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BJLBook;

@interface Person : NSObject

@property (strong, nonatomic) BJLBook *book;

- (SEL)selectorForCurrentState;

- (NSString *)currentName;

@end
