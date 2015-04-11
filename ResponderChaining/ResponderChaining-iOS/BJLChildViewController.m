//
//  BJLChildViewController.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/27/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLChildViewController.h"

@interface BJLChildViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation BJLChildViewController

- (void)talkToSon:(id)sender
{
    // Will not work. 
    if ([sender isKindOfClass:[UIButton class]]) {
        self.label.text = [[sender titleLabel] text];
    }
}

@end
