//
//  LUBObjectDescription.h
//
//  Created by Bryan Luby on 4/28/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUBObjectDescription : NSObject

/** Helper method for overriding the description method for an object
 *  @param id anObject The object for the desired description string
 *  @return NSString A dictionary description of all property keys and values for anObject
 */
+ (NSString *)descriptionStringForObject:(id)anObject;

@end
