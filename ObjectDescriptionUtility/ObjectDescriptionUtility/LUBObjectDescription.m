//
//  LUBObjectDescription.m
//
//  Created by Bryan Luby on 4/28/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBObjectDescription.h"
#import <objc/runtime.h>

@implementation LUBObjectDescription

+ (NSString *)descriptionStringForObject:(id)anObject
{
    return [[self propertyStateDictionaryForObject:anObject] description];
}

+ (NSDictionary *)propertyStateDictionaryForObject:(id)anObject
{
    return [anObject dictionaryWithValuesForKeys:[self propertyKeysForObject:anObject]];
}

+ (NSArray *)propertyKeysForObject:(id)anObject
{
    NSMutableArray *propertyKeys = [NSMutableArray array];
    
    Class aClass = [anObject class];
    
    while (isNotRootClass(aClass)) {
        unsigned int propertyCount = 0;
        objc_property_t *properties = class_copyPropertyList(aClass, &propertyCount);
        
        if (propertyCount) {
            for (int i = 0; i < propertyCount; i++) {
                objc_property_t property = properties[i];
                NSString *propertyKey = [NSString stringWithUTF8String:property_getName(property)];
                [propertyKeys addObject:propertyKey];
            }
        }
        
        free(properties);
        
        aClass = [aClass superclass];
    }
    
    return [propertyKeys copy];
}

BOOL isNotRootClass(Class aClass)
{
    return !(aClass == [NSObject class] || aClass == [NSProxy class]);
}

@end
