//
//  LUBAppDelegate.m
//  ObjectDescriptionUtility
//
//  Created by Bryan Luby on 4/30/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBAppDelegate.h"

#import "LUBPerson.h"
#import "LUBObjectDescription.h"

@implementation LUBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    LUBPerson *person = [[LUBPerson alloc] init];
    person.name = @"Mary";
    person.age = 32;
    NSLog(@"Person: %@", person);
    
    return YES;
}

@end
