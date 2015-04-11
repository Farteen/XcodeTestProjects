//
//  BJLCollectionVC.m
//  CollectionViewWithCustomTransition
//
//  Created by Bryan Luby on 9/25/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLCollectionVC.h"

#import "BJLModalVC.h"
#import "BJLVCTransitionDelegate.h"
@import SafariServices;

@interface BJLCollectionVC ()
@property (strong, nonatomic) BJLVCTransitionDelegate *transitionDelegate;
@end

@implementation BJLCollectionVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.transitionDelegate = [[BJLVCTransitionDelegate alloc] initWithDataView:self.collectionView];
    
    // Stop overlap of modal VC
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BJLModalVC *toVC = [self.storyboard instantiateViewControllerWithIdentifier:@"modalVC"];
    
    toVC.transitioningDelegate = self.transitionDelegate;
    toVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:toVC animated:YES completion:nil];
}

@end
