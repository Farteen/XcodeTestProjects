//
//  PersonViewModel.m
//  MVVMWithKVO
//
//  Created by Bryan Luby on 10/27/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "PersonViewModel.h"
#import "Person.h"

static void * PersonModelContext = &PersonModelContext;

@interface PersonViewModel ()
@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (copy, nonatomic) NSArray *keyPaths;
@end

@implementation PersonViewModel

- (id)init
{
    self = [super init];
    if (self) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
        self.dateFormatter.dateStyle = NSDateFormatterFullStyle;
        self.person = [[Person alloc] initWithName:@"Mary"];
        [self setUpKVO];
    }
    return self;
}

- (IBAction)pickRandomName:(id)sender
{
    NSArray *nameList = @[@"Jane", @"Bob", @"Melissa", @"Jeff", @"Brent", @"Linda", @"George", @"Judy"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        u_int32_t randomIndex = arc4random_uniform([nameList count]);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.person.name = nameList[randomIndex];
        });
    });
}

- (IBAction)changeDate:(id)sender
{
    self.person.birthday = [NSDate dateWithTimeIntervalSince1970:arc4random_uniform(1000000000)];
}

#pragma mark - KVO

- (void)setUpKVO
{
    self.keyPaths = @[NSStringFromSelector(@selector(name)),
                      NSStringFromSelector(@selector(birthday))];
    
    for (NSString *keyPath in self.keyPaths) {
        [self.person addObserver:self
                      forKeyPath:keyPath
                         options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                         context:PersonModelContext];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == PersonModelContext) {
        if ([object isKindOfClass:[Person class]]) {
            if ([keyPath isEqualToString:NSStringFromSelector(@selector(name))]) {
                self.currentName = self.person.name;
            }
            if ([keyPath isEqualToString:NSStringFromSelector(@selector(birthday))]) {
                self.birthdayString = [self.dateFormatter stringFromDate:self.person.birthday];
            }
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    for (NSString *keyPath in self.keyPaths) {
        [self.person removeObserver:self
                         forKeyPath:keyPath
                            context:PersonModelContext];
    }
}

@end
