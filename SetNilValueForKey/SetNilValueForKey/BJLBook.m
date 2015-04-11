//
//  BJLBook.m
//  SetNilValueForKey
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLBook.h"

@implementation BJLBook

- (void)setNilValueForKey:(NSString *)key
{
    if ([key isEqualToString:@"year"]) {
        self.year = 2000;
    } else if ([key isEqualToString:@"copiesSold"]) {
        self.copiesSold = 1000;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
