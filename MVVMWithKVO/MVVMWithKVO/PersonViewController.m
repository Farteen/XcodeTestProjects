//
//  BJLViewController.m
//  MVVMWithKVO
//
//  Created by Bryan Luby on 10/27/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonViewModel.h"
#import "CustomObject.h"

static void * PersonViewModelContext = &PersonViewModelContext;

@interface PersonViewController ()

@property (copy, nonatomic) NSArray *keyPaths;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *nameButton;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (strong, nonatomic) PersonViewModel *personViewModel;
@property (strong, nonatomic) CustomObject *customObject;

@end

@implementation PersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.personViewModel = [[PersonViewModel alloc] init];
    self.customObject = [[CustomObject alloc] init];
    [self setUpKVO];
    [self setUpTargetActions];
    
//    self.customObject.name = @"Hello";
    [self.customObject setValue:@"Cool!" forKey:@"someArbitraryKey"];
}

- (void)setUpTargetActions
{
    [self.nameButton addTarget:self.personViewModel
                        action:@selector(pickRandomName:)
              forControlEvents:UIControlEventTouchUpInside];
    
    [self.dateButton addTarget:self.personViewModel
                        action:@selector(changeDate:)
              forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - KVO

- (void)setUpKVO
{
    self.keyPaths = @[NSStringFromSelector(@selector(currentName)),
                      NSStringFromSelector(@selector(birthdayString))];
    
    for (NSString *keyPath in self.keyPaths) {
        [self.personViewModel addObserver:self
                               forKeyPath:keyPath
                                  options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
                                  context:PersonViewModelContext];
    }
    
    [self.customObject addObserver:self
                        forKeyPath:@"someArbitraryKey"
                           options:NSKeyValueObservingOptionNew
                           context:PersonViewModelContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == PersonViewModelContext) {
        if ([object isKindOfClass:[PersonViewModel class]]) {
            if ([keyPath isEqualToString:NSStringFromSelector(@selector(currentName))]) {
                self.nameLabel.text = self.personViewModel.currentName;
            }
            if ([keyPath isEqualToString:NSStringFromSelector(@selector(birthdayString))]) {
                self.dateLabel.text = self.personViewModel.birthdayString;
            }
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    for (NSString *keyPath in self.keyPaths) {
        [self.personViewModel removeObserver:self
                                  forKeyPath:keyPath
                                     context:PersonViewModelContext];
    }
}

@end
