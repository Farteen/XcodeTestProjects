//
//  BJLTransitonsTVC.m
//  UIViewControllerCustomTransitions
//
//  Created by Bryan Luby on 10/5/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLTransitonsTVC.h"
#import "BJLTransitionAnimator.h"

@interface BJLTransitonsTVC () <UIViewControllerTransitioningDelegate>
@property (strong, nonatomic) BJLTransitionAnimator *animator;
@end

@implementation BJLTransitonsTVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.animator = [[BJLTransitionAnimator alloc] init];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *detailVC = segue.destinationViewController;
    detailVC.transitioningDelegate = self;
    detailVC.modalPresentationStyle = UIModalPresentationCustom;
    self.animator.segueID = segue.identifier;
}

- (IBAction)dismissTinyVC:(UIStoryboardSegue *)segue {} // Unwind segue

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    self.animator.presenting = YES;
    return self.animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.animator.presenting = NO;
    return self.animator;
}

#pragma mark - TableView

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
