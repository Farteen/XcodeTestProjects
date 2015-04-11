//
//  UIApplication+ResponderChain.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/2/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "UIApplication+ResponderChain.h"

@implementation UIApplication (ResponderChain)

- (void)sendNilTargetedAction:(SEL)action fromSender:(id)sender
{
    [[UIApplication sharedApplication] sendAction:action
                                               to:nil
                                             from:sender
                                         forEvent:nil];
}

- (void)inspectResponderChainFromSender:(id)sender
{
    if ([sender isKindOfClass:[UIResponder class]]) {
        NSMutableArray *responderChain = [NSMutableArray array];
        [responderChain insertObject:sender atIndex:0];
        
        while ((sender = [sender nextResponder])) {
            if ([sender nextResponder]) {
                [responderChain insertObject:[sender nextResponder] atIndex:0];
            }
        }
        
        NSLog(@"Responder Chain:");
        for (id obj in [responderChain copy]) {
            NSLog(@"%@\n***", obj);
        }
    }
}

@end
