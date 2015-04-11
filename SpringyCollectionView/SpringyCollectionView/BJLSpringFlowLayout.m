//
//  BJLSpringFlowLayout.m
//  SpringyCollectionView
//
//  Created by Bryan Luby on 9/24/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLSpringFlowLayout.h"

@interface BJLSpringFlowLayout ()

@property (strong, nonatomic) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic) UIDeviceOrientation currentOrientation;
@property (nonatomic) NSUInteger itemCount;

@end

@implementation BJLSpringFlowLayout

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _currentOrientation = [[UIDevice currentDevice] orientation];
    }
    return self;
}


- (void)prepareLayout
{
    [super prepareLayout];
    UIDeviceOrientation newOrientation = [[UIDevice currentDevice] orientation];
    
    if (!_dynamicAnimator) {
        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
    }
    
    CGSize contentSize = [self collectionViewContentSize];
    NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
    
    if ([items count] != _itemCount || _currentOrientation != newOrientation) {
        _itemCount = [items count];
        _currentOrientation = newOrientation;
        
        [_dynamicAnimator removeAllBehaviors];
        
        for (UICollectionViewLayoutAttributes *item in items) {
            UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:[item center]];
            spring.length = 0;
            spring.damping = 0.5;
            spring.frequency = 0.8;
            
            [_dynamicAnimator addBehavior:spring];
        }
    }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    UIScrollView *scrollView = self.collectionView;
    CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
    CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
    
    for (UIAttachmentBehavior *spring in _dynamicAnimator.behaviors) {
        CGPoint anchorPoint = spring.anchorPoint;
        CGFloat distanceFromTouch = fabs(touchLocation.y - anchorPoint.y);
        CGFloat scrollResistance = distanceFromTouch / 500;
        
        UICollectionViewLayoutAttributes *item = [spring.items firstObject];
        CGPoint center = item.center;
        center.y += scrollDelta * scrollResistance; //MIN(scrollDelta, scrollDelta * scrollResistance);
        item.center = center;
        
        [_dynamicAnimator updateItemUsingCurrentState:item];
    }
    
    return NO;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [_dynamicAnimator itemsInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dynamicAnimator layoutAttributesForCellAtIndexPath:indexPath];
}

@end
