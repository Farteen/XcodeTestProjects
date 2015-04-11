//
//  SecondViewModel.m
//  MVVMWithKVO
//
//  Created by Bryan Luby on 2/22/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "SecondViewModel.h"
#import "SecondObject.h"

@interface SecondViewModel ()
@property (strong, nonatomic) SecondObject *secondObject;
@end

@implementation SecondViewModel

- (void)awakeFromNib
{
    self.secondObject = [[SecondObject alloc] init];
    self.secondObject.name = @"Mary";
//    self.viewName = self.secondObject.name;
}

@end
