//
//  SecondViewController.h
//  MVVMWithKVO
//
//  Created by Bryan Luby on 2/22/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewModel.h"

@interface SecondViewController : UIViewController
@property (strong, nonatomic) SecondViewModel *viewModel;
@end
