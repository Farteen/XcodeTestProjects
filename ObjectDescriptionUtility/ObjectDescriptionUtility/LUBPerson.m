//
//  LUBPerson.m
//  ObjectDescriptionUtility
//
//  Created by Bryan Luby on 4/30/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBPerson.h"
#import "LUBObjectDescription.h"

@implementation LUBPerson

- (NSString *)description
{
    return [LUBObjectDescription descriptionStringForObject:self];
}

@end
