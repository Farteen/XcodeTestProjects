//
//  LUBViewController.m
//  SecureCoding
//
//  Created by Bryan Luby on 3/21/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBViewController.h"
#import "LUBPerson.h"

@interface LUBViewController ()

@end

@implementation LUBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [self itemArchivePath];
//    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:path]];    
    
//    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//    [unarchiver setRequiresSecureCoding:YES];
    
//    LUBPerson *person = [unarchiver decodeObject];
//    [unarchiver finishDecoding];
    
    for (UIView *aView in self.view.subviews) {
        NSLog(@"%@", [aView.layer valueForKey:@"viewID"]);
    }
    
    
    
    LUBPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog(@"Person: %@ - %@", person.name, person.age);
}

- (IBAction)buttonPressed:(id)sender
{
    LUBPerson *person = [[LUBPerson alloc] init];
    u_int32_t randNum = arc4random_uniform(100);
    person.age = @(randNum);
    person.name = @"Hello";
    NSLog(@"Person: %@ - %@", person.name, person.age);
    
//    [NSKeyedArchiver archiveRootObject:person toFile:[self itemArchivePath]];
//    NSMutableData *data = [NSMutableData data];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    [NSKeyedArchiver archiveRootObject:person toFile:[self itemArchivePath]];
//    [archiver setRequiresSecureCoding:YES];
//    [archiver encodeObject:person];
//    [archiver finishEncoding];
//    [data writeToFile:[self itemArchivePath] atomically:YES];
    
    [NSKeyedArchiver archiveRootObject:person toFile:[self itemArchivePath]];
}

- (NSString *)itemArchivePath
{
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return [documentDirectory stringByAppendingPathComponent:@"person.archive"];
}

@end
