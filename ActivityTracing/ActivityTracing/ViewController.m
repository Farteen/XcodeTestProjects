//
//  ViewController.m
//  ActivityTracing
//
//  Created by Bryan Luby on 12/9/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "ViewController.h"
#import <os/activity.h>
#import <os/trace.h>

@implementation ViewController

- (IBAction)buttonPressed:(id)sender
{
    os_activity_initiate("test activity", OS_ACTIVITY_FLAG_DETACHED, ^{
        os_trace("function version test");
        os_activity_set_breadcrumb("test activity");
    });

    // Or

    os_activity_t anActivity = os_activity_start("cool", OS_ACTIVITY_FLAG_DETACHED);
    os_trace("macro version test");
    os_trace_with_payload("test payload", ^(xpc_object_t xDict) {
        //
    });
    os_trace_error("Test");
    os_trace_error_with_payload("eh", ^(xpc_object_t xDict) {
        xpc_dictionary_set_string(xDict, "someKey", "hello");
    });
    os_activity_set_breadcrumb("cool");
    os_activity_end(anActivity);
    abort();
}

@end
