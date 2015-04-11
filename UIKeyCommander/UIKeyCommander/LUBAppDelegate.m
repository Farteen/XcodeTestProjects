//
//  LUBAppDelegate.m
//  UIKeyCommander
//
//  Created by Bryan Luby on 2/22/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBAppDelegate.h"
#import "LUBKeyboardResponder.h"

@implementation LUBAppDelegate

- (UIResponder *)nextResponder
{
    return [[LUBKeyboardResponder alloc] init];
}

@end
