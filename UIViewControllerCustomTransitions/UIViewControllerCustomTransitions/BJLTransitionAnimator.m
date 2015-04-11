//
//  BJLTransitionAnimator.m
//  UIViewControllerCustomTransitions
//
//  Created by Bryan Luby on 10/5/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

static const CGFloat SmallVCWidth = 200;
static const CGFloat SmallVCHeight = 200;
static const CGFloat PresentingSpeed = 0.50;
static const CGFloat DismissingSpeed = 0.25;

#import "BJLTransitionAnimator.h"

@implementation BJLTransitionAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.isPresenting ? PresentingSpeed : DismissingSpeed;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // Grab the from and to view controllers from the context
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    // Set our ending frame. We'll modify this later if we have to
    CGRect endFrame = CGRectMake(60, 184, SmallVCWidth, SmallVCHeight); // Middle of the screen
    
    if (self.isPresenting) {
        fromViewController.view.userInteractionEnabled = NO;
        
        [transitionContext.containerView addSubview:toViewController.view];
        
        CGRect startFrame = endFrame;
        startFrame.origin = [self updatedOriginFromPreviousOrigin:startFrame.origin usingSegueID:self.segueID];
        toViewController.view.frame = startFrame;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0.1
             usingSpringWithDamping:0.85
              initialSpringVelocity:0.25
                            options:0
                         animations:^{
                             toViewController.view.frame = endFrame;
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    } else {
        toViewController.view.userInteractionEnabled = YES;
        
        [transitionContext.containerView addSubview:fromViewController.view];
        
        endFrame.origin = [self updatedOriginFromPreviousOrigin:endFrame.origin usingSegueID:self.segueID];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.frame = endFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

- (CGPoint)updatedOriginFromPreviousOrigin:(CGPoint)origin usingSegueID:(NSString *)segueID
{
    CGPoint newOrigin = origin;
    
    if ([segueID isEqualToString:@"fromright"]) {
        newOrigin.x += 320;
    } else if ([segueID isEqualToString:@"fromleft"]) {
        newOrigin.x -= 320;
    } else if ([segueID isEqualToString:@"frombottom"]) {
        newOrigin.y += 568;
    } else if ([segueID isEqualToString:@"fromtop"]) {
        newOrigin.y -= 568;
    }
    
    return newOrigin;
}

@end
