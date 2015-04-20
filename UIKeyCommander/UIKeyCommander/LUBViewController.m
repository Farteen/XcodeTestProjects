//
//  LUBViewController.m
//  UIKeyCommander
//
//  Created by Bryan Luby on 2/22/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import "LUBViewController.h"

@interface LUBViewController () <UITableViewDataSource>

@property (strong, nonatomic) UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LUBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.textField = [[UITextField alloc] init];
    [self.view addSubview:self.textField];
    self.textField.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.textField becomeFirstResponder];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
                                animated:NO
                          scrollPosition:UITableViewScrollPositionTop];
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"Hello";
    return cell;
}

#pragma mark - Keyboard Shortcuts

- (NSArray *)keyCommands
{
    UIKeyCommand *aKeyCommand = [UIKeyCommand keyCommandWithInput:@"7"
                                                    modifierFlags:UIKeyModifierCommand
                                                           action:@selector(doStuff:)];
    UIKeyCommand *upArrow = [UIKeyCommand keyCommandWithInput:UIKeyInputUpArrow
                                                modifierFlags:0
                                                       action:@selector(scrollUp:)];
    UIKeyCommand *downArrow = [UIKeyCommand keyCommandWithInput:UIKeyInputDownArrow
                                                  modifierFlags:0
                                                         action:@selector(scrollDown:)];
    UIKeyCommand *rightArrow = [UIKeyCommand keyCommandWithInput:UIKeyInputRightArrow
                                                   modifierFlags:0
                                                          action:@selector(nextViewController:)];
    UIKeyCommand *leftArrow = [UIKeyCommand keyCommandWithInput:UIKeyInputLeftArrow
                                                  modifierFlags:0
                                                         action:@selector(previousViewController:)];
    UIKeyCommand *pageDown = [UIKeyCommand keyCommandWithInput:UIKeyInputDownArrow
                                                 modifierFlags:UIKeyModifierAlternate
                                                        action:@selector(pageDown:)];
    UIKeyCommand *pageUp = [UIKeyCommand keyCommandWithInput:UIKeyInputUpArrow
                                               modifierFlags:UIKeyModifierAlternate
                                                      action:@selector(pageUp:)];
    
    return @[aKeyCommand, upArrow, downArrow, leftArrow, rightArrow, pageDown, pageUp];
}

- (void)doStuff:(UIKeyCommand *)keyCommand
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}

- (void)scrollUp:(UIKeyCommand *)keyCommand
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    NSInteger row = selectedIndexPath.row;
    
    if (row > 0) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:row - 1 inSection:0]
                                    animated:YES
                              scrollPosition:UITableViewScrollPositionMiddle];
    }
}

- (void)scrollDown:(UIKeyCommand *)keyCommand
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    NSInteger row = selectedIndexPath.row;
    
    if (row < 99) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:row + 1 inSection:0]
                                    animated:YES
                              scrollPosition:UITableViewScrollPositionMiddle];
    }
}

- (void)pageUp:(UIKeyCommand *)keyCommand
{
    NSIndexPath *topIndexPath = [[self.tableView indexPathsForVisibleRows] firstObject];
    [self.tableView selectRowAtIndexPath:topIndexPath
                                animated:YES
                          scrollPosition:UITableViewScrollPositionTop];
}

- (void)pageDown:(UIKeyCommand *)keyCommand
{
    NSIndexPath *bottomIndexPath = [[self.tableView indexPathsForVisibleRows] lastObject];
    [self.tableView selectRowAtIndexPath:bottomIndexPath
                                animated:YES
                          scrollPosition:UITableViewScrollPositionTop];
}

- (void)nextViewController:(UIKeyCommand *)keyCommand
{
    [self performSegueWithIdentifier:@"nextVC" sender:nil];
}

- (void)previousViewController:(UIKeyCommand *)keyCommand
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
