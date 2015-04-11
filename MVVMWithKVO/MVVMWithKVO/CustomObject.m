//
//  CustomObject.m
//  MVVMWithKVO
//
//  Created by Bryan Luby on 2/22/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "CustomObject.h"

@interface CustomObject ()
@property (strong, nonatomic) NSMutableDictionary *arbitraryKeyValuePairs;
@end

@implementation CustomObject

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if (!self.arbitraryKeyValuePairs) {
        self.arbitraryKeyValuePairs = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    
    self.arbitraryKeyValuePairs[key] = value;
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSArray *allKeys = [self.arbitraryKeyValuePairs allKeys];
    
    if ([allKeys containsObject:key]) {
        return self.arbitraryKeyValuePairs[key];
    } else {
        return [super valueForUndefinedKey:key];
    }
}

- (IBAction)doCoolStuff:(id)sender
{
    NSLog(@"Wow %@", sender);
    
    id someTarget = [sender targetForAction:@selector(doCoolStuff:) withSender:nil];
    NSLog(@"some target: %@", someTarget);
    
    //    NSLog(@"Value of my custom key: %@", [self valueForKey:@"testKey"]);
    
//    [[UIApplication sharedApplication] sendAction:NSSelectorFromString(@"updateCustomColor")
//                                               to:nil
//                                             from:sender
//                                         forEvent:nil];
    
    
}

@end
