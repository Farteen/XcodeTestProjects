//
//  main.m
//  PolymorphMe
//
//  Created by Bryan Luby on 1/24/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BJLShape.h"
#import "BJLMorpher.h"

void paintShapes();
void morphIt();

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        paintShapes();
        morphIt();
    }
    
    return 0;
}

void paintShapes()
{
    BJLShape *mainShape = [[BJLShape alloc] init];
    [mainShape paintShape];
    
    BJLShape *circle = [BJLShape circleShape];
    [circle paintShape];
    
    BJLShape *square = [BJLShape squareShape];
    [square paintShape];
    
    BJLShape *rectangle = [BJLShape rectangleShape];
    [rectangle paintShape];
}

void morphIt()
{
    BJLMorpher *helloMorpher = [[BJLMorpher alloc] initWithCustomString:@"hello"];
    NSLog(@"helloMorpher: %@", helloMorpher);
    
    BJLMorpher *goodbyeMorpher = [[BJLMorpher alloc] initWithCustomString:@"goodbye"];
    NSLog(@"goodbyeMorpher: %@", goodbyeMorpher);
    
    BJLMorpher *invalidMorpher = [[BJLMorpher alloc] initWithCustomString:@"test"];
    NSLog(@"invalidMorpher: %@", invalidMorpher);
    
    BJLMorpher *unknownMorpher = [[BJLMorpher alloc] init];
    NSLog(@"unknownMorpher: %@", unknownMorpher);
}
