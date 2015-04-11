//
//  MessageInterceptor.h
//  NSProxyObjects
//
//  Created by Bryan Luby on 12/7/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageInterceptor : NSProxy

@property (nonatomic, strong) NSMutableArray *interceptedMessages;
@property (nonatomic, strong) id currentTarget;

- (id)initWithTarget:(id)aTarget;

@end
