//
//  AppDelegate.m
//  GlobalKeyEvents
//
//  Created by Bryan Luby on 1/4/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong, nonatomic) id eventHandler;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Go into system prefs > Accessibility and grant access to Xcode. Otherwise key downs won't register.
    NSDictionary *options = @{(__bridge_transfer NSString *)kAXTrustedCheckOptionPrompt: @YES};
    AXIsProcessTrustedWithOptions((__bridge CFDictionaryRef)options);
    
    self.eventHandler = [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask handler:^(NSEvent *event) {
        NSLog(@"Event: %@", event);
    }];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    [NSEvent removeMonitor:self.eventHandler];
}

@end
