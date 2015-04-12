//
//  BJLMorpher.m
//  PolymorphMe
//
//  Created by Bryan Luby on 1/25/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLMorpher.h"

@interface BJLMorpher ()
@property (nonatomic, strong) NSString *attribute;
@end

@implementation BJLMorpher

- (id)init
{
    return [self initWithCustomString:@"unknown"];
}

- (id)initWithCustomString:(NSString *)string
{
    self = [super init];
    if (self) {
        SEL morphedSelector = NSSelectorFromString(string);
        
        if ([self respondsToSelector:morphedSelector]) {
            // SO thread on this compiler warning:
            // http://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:morphedSelector];
            #pragma clang diagnostic pop
        } else {
            [self invalid];
            NSLog(@"I don't respond to that message");
        }
    }
    return self;
}

- (void)hello
{
    _attribute = @"hello attribute";
}

- (void)goodbye
{
    _attribute = @"goodbye attribute";
}

- (void)unknown
{
    _attribute = @"unknown attribute";
}

- (void)invalid
{
    _attribute = @"invalid attribute";
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.attribute];
}

@end
