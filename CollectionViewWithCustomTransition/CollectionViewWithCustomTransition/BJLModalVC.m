//
//  BJLModalVC.m
//  CollectionViewWithCustomTransition
//
//  Created by Bryan Luby on 9/25/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLModalVC.h"

@interface BJLModalVC ()

@end

@implementation BJLModalVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIGestureRecognizer *touchGR = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(didTouch:)];
    [self.view addGestureRecognizer:touchGR];
}

- (void)didTouch:(UIGestureRecognizer *)recognizer
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
