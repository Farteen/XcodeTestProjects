//
//  UIApplication+ResponderChain.h
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/2/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (ResponderChain)

- (void)sendNilTargetedAction:(SEL)action fromSender:(id)sender;
- (void)inspectResponderChainFromSender:(id)sender;

@end
