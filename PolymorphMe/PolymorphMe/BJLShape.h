//
//  BJLShape.h
//  PolymorphMe
//
//  Created by Bryan Luby on 1/24/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BJLShape : NSObject

+ (BJLShape *)circleShape;
+ (BJLShape *)squareShape;
+ (BJLShape *)rectangleShape;

- (void)paintShape;

@end
