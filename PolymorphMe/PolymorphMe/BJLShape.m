//
//  BJLShape.m
//  PolymorphMe
//
//  Created by Bryan Luby on 1/24/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLShape.h"

@interface BJLShape()
@property (strong, nonatomic) NSString *color;

- (void)proclaimShape;
- (NSString *)currentClassString;
@end

@interface BJLCircle : BJLShape
@end

@interface BJLSquare : BJLShape
@end

@interface BJLRectangle : BJLShape
@end

@implementation BJLShape

- (id)init {
    self = [super init];
    if (self) {
        self.color = @"Red";
    }
    return self;
}

- (NSString *)currentClassString {
    return NSStringFromClass([self class]);
}

+(BJLShape *)circleShape {
    BJLCircle *circle = [[BJLCircle alloc] init];
    return circle;
}

+(BJLShape *)squareShape {
    BJLSquare  *square = [[BJLSquare alloc] init];
    return square;
}

+(BJLShape *)rectangleShape {
    BJLRectangle *rectangle = [[BJLRectangle alloc] init];
    return rectangle;
}

-(void)paintShape {
    [self proclaimShape];
    NSLog(@"Color = %@", self.color);
}

-(void)proclaimShape {
    NSLog(@"I'm the %@! Red is cool", [self currentClassString]);
}
@end

@implementation BJLCircle
- (void)proclaimShape {
    NSLog(@"I'm the %@! Red is ok, I guess.", [self currentClassString]);
}
@end

@implementation BJLSquare
-(void)proclaimShape {
    NSLog(@"I'm the %@! Red is fine by me... Because I'm a square!", [self currentClassString]);
}
@end

@implementation BJLRectangle
-(id)init {
    self = [super init];
    if (self) {
        self.color = @"Blue";
    }
    return self;
}

-(void)proclaimShape {
    NSLog(@"I'm the %@! Red sucks, so I changed it. Hahhahaha!!!", [self currentClassString]);
}
@end
