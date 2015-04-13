//
//  ViewController.m
//  ObjectsInIB
//
//  Created by Bryan Luby on 11/10/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "ViewController.h"

#import "HelperObject.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HelperObject *helper;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.helper applyBorders];
}

@end
