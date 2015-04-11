//
//  PersonViewModel.h
//  MVVMWithKVO
//
//  Created by Bryan Luby on 10/27/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonViewModel : NSObject
@property (copy, nonatomic) NSString *currentName;
@property (copy, nonatomic) NSString *birthdayString;

- (IBAction)pickRandomName:(id)sender;
- (IBAction)changeDate:(id)sender;
@end
