//
//  SecondViewController.m
//  MVVMWithKVO
//
//  Created by Bryan Luby on 2/22/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *borderedLabel;
@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    id someColor = [self.borderedLabel.layer valueForKey:@"lub_borderColor"];
    NSLog(@"value of myKey: %@", [self.borderedLabel.layer valueForKey:@"myKey"]);
//    NSLog(@"value of vcKey: %@", [self valueForKey:@"vcKey"]);
    
//    [self setValue:[UIColor redColor] forKey:@"myColorKey"];
}

- (void)updateCustomColor
{
//    self.view.backgroundColor = (UIColor *)[self valueForKey:@"myColorKey"];
}

@end

@implementation CALayer (NibAccess)

- (void)setLub_borderColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

- (UIColor *)lub_borderColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
