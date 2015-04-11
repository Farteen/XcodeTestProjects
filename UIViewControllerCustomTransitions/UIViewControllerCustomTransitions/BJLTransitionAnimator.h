//
//  BJLTransitionAnimator.h
//  UIViewControllerCustomTransitions
//
//  Created by Bryan Luby on 10/5/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJLTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter = isPresenting) BOOL presenting;
@property (nonatomic, copy) NSString *segueID;

@end
