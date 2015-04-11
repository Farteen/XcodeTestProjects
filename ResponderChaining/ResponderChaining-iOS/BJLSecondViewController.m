//
//  BJLSecondViewController.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/27/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLSecondViewController.h"

@interface BJLSecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end

@implementation BJLSecondViewController

- (void)talkToMom:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        self.mainLabel.text = [[sender layer] valueForKey:@"wow"];
    }
}

@end
