//
//  LUBPerson.m
//  SecureCoding
//
//  Created by Bryan Luby on 3/21/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBPerson.h"

@implementation LUBPerson

- (NSArray *)allKeys
{
    return @[@"name",
             @"age"];
}

#pragma mark - NSSecureCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    for (NSString *key in [self allKeys]) {
        [aCoder encodeObject:[self valueForKey:key]
                      forKey:key];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        for (NSString *key in [self allKeys]) {
            [self setValue:[aDecoder decodeObjectOfClass:[self class]
                                                  forKey:key]
                    forKey:key];
        }
    }
    return self;
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

@end
