//
//  Person.h
//  MVVMWithKVO
//
//  Created by Bryan Luby on 10/27/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *birthday;

- (instancetype)initWithName:(NSString *)name;
@end
