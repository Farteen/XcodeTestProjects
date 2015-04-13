//
//  HelperObject.m
//  ObjectsInIB
//
//  Created by Bryan Luby on 11/10/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "HelperObject.h"

@interface HelperObject ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *borderedViews;

@end

@implementation HelperObject

- (void)applyBorders
{
    for (UIView *aView in self.borderedViews) {
        aView.layer.borderColor = [UIColor blackColor].CGColor;
        aView.layer.borderWidth = 2;
        aView.layer.cornerRadius = 3.0;
        aView.backgroundColor = [UIColor lightGrayColor];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
