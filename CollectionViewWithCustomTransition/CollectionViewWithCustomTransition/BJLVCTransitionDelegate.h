//
//  BJLVCTransitionDelegate.h
//  CollectionViewWithCustomTransition
//
//  Created by Bryan Luby on 9/25/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJLVCTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

- (id)initWithDataView:(id)newDataView;

@end
