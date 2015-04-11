//
//  BJLBook.h
//  SetNilValueForKey
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJLBook : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *author;
@property (nonatomic) NSUInteger year;
@property (nonatomic) NSUInteger copiesSold;

@end
