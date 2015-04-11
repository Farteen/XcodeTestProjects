//
//  LUBViewController.h
//  CollectionOfBlocks
//
//  Created by Bryan Luby on 4/25/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <UIKit/UIKit.h>


void(^myBlock)(void) = ^(void) {
    NSLog(@"Hello, I'm a block in the header file.");
};

@interface LUBViewController : UIViewController

@end
