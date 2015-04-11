//
//  BJLViewController.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/1/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLViewController.h"
#import "BJLUIResponder.h"
#import "UIApplication+ResponderChain.h"

@interface BJLViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation BJLViewController

- (UIResponder *)nextResponder
{
    static dispatch_once_t onceToken;
    static BJLSecondUIResponder *responder = nil;
    dispatch_once(&onceToken, ^{
        responder = [[BJLSecondUIResponder alloc] init];
    });
    return responder;
}

#pragma mark - Nil Targeted Actions

- (IBAction)searchITunesPressed:(id)sender
{
    [UIApp inspectResponderChainFromSender:sender];
    [UIApp sendNilTargetedAction:@selector(search_iTunes:) fromSender:self.textView];
}

- (IBAction)buttonPressed:(id)sender
{
    [UIApp inspectResponderChainFromSender:sender];
    [UIApp sendNilTargetedAction:NSSelectorFromString(@"hello:") fromSender:self.mainLabel];
    [UIApp sendNilTargetedAction:@selector(resignFirstResponder) fromSender:nil];
}

- (IBAction)findTargetPressed:(id)sender
{
    id someTarget = [self targetForAction:@selector(search_iTunes:)
                               withSender:sender];
    
    NSLog(@"Some target: %@", someTarget);
}

- (IBAction)dismissToRoot:(UIStoryboardSegue *)segue {}

@end
