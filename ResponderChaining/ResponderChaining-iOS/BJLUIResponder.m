//
//  BJLUIResponder.m
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/1/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "BJLUIResponder.h"

@implementation BJLUIResponder

- (void)doCoolStuffWithSender:(id)sender
{
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"%@", className);
    NSLog(@"%@", sender);
    
    if ([sender isKindOfClass:[UILabel class]]) {
        UILabel *mainLabel = sender;
        mainLabel.text = className;
        mainLabel.backgroundColor = [UIColor redColor];
        NSDictionary *myDict = [mainLabel dictionaryWithValuesForKeys:@[@"text", @"textColor", @"backgroundColor", @"numberOfLines"]];
        NSLog(@"%@", myDict);
    }
}

@end

@implementation BJLSecondUIResponder

//- (void)hello:(id)sender
//{
//    [self doCoolStuffWithSender:sender];
//}

- (void)neat:(id)sender
{
    NSLog(@"%@ - %@", [self class], sender);
}

- (UIResponder *)nextResponder
{
    return [[UIApplication sharedApplication] keyWindow];
}

@end

@implementation BJLLastUIResponder

- (void)hello:(id)sender
{
    [self doCoolStuffWithSender:sender];
}

//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
//{
//    
//}

- (void)search_iTunes:(id)sender
{
    NSURLComponents *components = [[NSURLComponents alloc] init];
    components.scheme = @"https";
    components.host = @"itunes.apple.com";
    components.path = @"/search";
    components.query = @"term=miles+davis&limit=5";
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[components URL]
                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          if (!error) {
              id json = [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:nil];
              
              NSArray *jsonArray = json[@"results"];
              NSString *jsonString = [jsonArray componentsJoinedByString:@"\n"];
              dispatch_async(dispatch_get_main_queue(), ^{
                  if ([sender isKindOfClass:[UILabel class]]) {
                      [sender setText:jsonString];
                  }
              });
          } else {
              NSLog(@"Error: %@", [error localizedDescription]);
          }
      }] resume];
}

@end
