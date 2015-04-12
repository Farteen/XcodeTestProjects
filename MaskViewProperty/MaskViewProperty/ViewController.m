//
//  ViewController.m
//  MaskViewProperty
//
//  Created by Bryan Luby on 3/25/15.
//  Copyright (c) 2015 Bryan Luby. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *backgroundView;

@end

@implementation ViewController

- (void)maskWithUIView
{
    self.backgroundView.maskView = [[UIImageView alloc] initWithImage:[self maskImage]];
}

- (void)maskWithCALayer
{
    CALayer *maskLayer = [CALayer layer];
    UIImage *maskImage = [self maskImage];
    maskLayer.contents = (id)maskImage.CGImage;
    maskLayer.frame = CGRectMake(0, 0, maskImage.size.width, maskImage.size.height);

    self.backgroundView.layer.mask = maskLayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [self maskWithCALayer];
    [self maskWithUIView];
}

- (IBAction)buttonPressed:(id)sender
{
    NSTimeInterval animationDuration = 1.0;

    [UIView animateWithDuration:animationDuration animations:^{
        self.backgroundView.maskView.bounds = CGRectMake(0, 0, 2000, 2000);
//        self.backgroundView.maskView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:animationDuration animations:^{
            self.backgroundView.maskView.bounds = [self imageRect];
//            self.backgroundView.maskView.alpha = 1.0;
        }];
    }];
}

- (UIImage *)maskImage
{
    return [UIImage imageNamed:@"maskImage"];
}

- (CGRect)imageRect
{
    CGSize imageSize = [self maskImage].size;
    return CGRectMake(0, 0, imageSize.width, imageSize.height);
}

@end
