//
//  LUBPerson.h
//  SecureCoding
//
//  Created by Bryan Luby on 3/21/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUBPerson : NSObject <NSSecureCoding>

@property (strong, nonatomic) NSNumber *age;
@property (copy, nonatomic) NSString *name;

@end
