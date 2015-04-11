//
//  BJLAppDelegate.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/1/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLAppDelegate.h"
#import "BJLUIResponder.h"

@interface BJLAppDelegate ()
@property (strong, nonatomic) NSScanner *scanner;
@end

@implementation BJLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.scanner = [[NSScanner alloc] initWithString:@"(25,91,126)"];
    
    UIColor *aColor;
    NSError *aError;
    [self scanTupleColorIntoColor:&aColor error:&aError];
    
    if (!aError) {
        NSLog(@"Color: %@", aColor);
    } else {
        NSLog(@"Error: %@", [aError localizedDescription]);
    }
    
    return YES;
}

- (UIResponder *)nextResponder
{
    static dispatch_once_t onceToken;
    static BJLLastUIResponder *lastResponder;
    dispatch_once(&onceToken, ^{
        lastResponder = [[BJLLastUIResponder alloc] init];
    });
    return lastResponder;
}

- (void)doStuff:(id)sender
{
    NSLog(@"I'm doing stuff with: %@", sender);
}

- (BOOL)scanTupleColorIntoColor:(UIColor **)outColor error:(NSError **)error
{
    NSInteger red, green, blue = 0;
    BOOL didScan = [self.scanner scanString:@"(" intoString:NULL]
    && [self.scanner scanInteger:&red]
    && [self.scanner scanString:@"," intoString:NULL]
    && [self.scanner scanInteger:&green]
    && [self.scanner scanString:@"," intoString:NULL]
    && [self.scanner scanInteger:&blue]
    && [self.scanner scanString:@")" intoString:NULL];
    
    if (didScan) {
        *outColor = [UIColor colorWithRed:(CGFloat)red/255.
                                    green:(CGFloat)green/255.
                                     blue:(CGFloat)blue/255.
                                    alpha:1];
    } else {
        NSDictionary *errorDict = @{NSLocalizedDescriptionKey: @"Something really bad happened..."};
        *error = [[NSError alloc] initWithDomain:@"MyDumbDomain"
                                            code:25
                                        userInfo:errorDict];
    }

    return didScan;
}

@end
