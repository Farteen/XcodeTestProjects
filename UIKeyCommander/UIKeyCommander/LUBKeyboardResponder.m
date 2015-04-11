//
//  LUBKeyboardResponder.m
//  UIKeyCommander
//
//  Created by Bryan Luby on 2/22/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBKeyboardResponder.h"

@implementation LUBKeyboardResponder

- (void)doStuff
{
    NSLog(@"This is ... keyboardy");
}

- (NSArray *)keyCommands
{
    UIKeyCommand *aKeyCommand = [UIKeyCommand keyCommandWithInput:@"7"
                                                    modifierFlags:UIKeyModifierShift
                                                           action:@selector(doStuff)];
    
    return @[aKeyCommand];
}

@end
