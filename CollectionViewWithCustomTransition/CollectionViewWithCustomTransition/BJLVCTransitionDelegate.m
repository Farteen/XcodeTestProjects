//
//  BJLVCTransitionDelegate.m
//  CollectionViewWithCustomTransition
//
//  Created by Bryan Luby on 9/25/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLVCTransitionDelegate.h"

static const CGFloat TransitionDuration = 0.85f;

@interface BJLVCTransitionDelegate ()

@property (strong, nonatomic) id dataView;

@end

@implementation BJLVCTransitionDelegate

#pragma mark - UIViewControllerTransitioningDelegate

- (id)initWithDataView:(id)newDataView
{
    self = [super init];
    if (self) {
        _dataView = newDataView;
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return TransitionDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    NSIndexPath *selectedIndexPath = [[self.dataView indexPathsForSelectedItems] firstObject];
    UICollectionViewCell *cell = [self.dataView cellForItemAtIndexPath:selectedIndexPath];
    
    UIView *container = transitionContext.containerView;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    CGRect beginFrame = [container convertRect:cell.bounds fromView:cell];
    CGRect endFrame = [transitionContext initialFrameForViewController:fromVC];
    
    endFrame = CGRectInset(endFrame, 50.0, 50.0);
    
    UIView *move = nil;
	if (toVC.isBeingPresented) {
		toView.frame = endFrame;
		move = [toView snapshotViewAfterScreenUpdates:YES];
		move.frame = beginFrame;
		cell.hidden = YES;
	} else {
		move = [fromView snapshotViewAfterScreenUpdates:YES];
		move.frame = fromView.frame;
		[fromView removeFromSuperview];
	}
    [container addSubview:move];
	
	[UIView animateWithDuration:TransitionDuration delay:0
         usingSpringWithDamping:500 initialSpringVelocity:15
                        options:0 animations:^{
                            move.frame = toVC.isBeingPresented ?  endFrame : beginFrame;}
                     completion:^(BOOL finished) {
                         if (toVC.isBeingPresented) {
                             [move removeFromSuperview];
                             toView.frame = endFrame;
                             [container addSubview:toView];
                         } else {
                             cell.hidden = NO;
                         }
                         
                         [transitionContext completeTransition:YES];
                     }];
}

@end
