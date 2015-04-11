//
//  BJLViewController.m
//  UIWebViewPagination
//
//  Created by Bryan Luby on 10/26/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLViewController.h"

@interface BJLViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) NSUInteger textFontSize;

@end

@implementation BJLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.webView.scrollView.pagingEnabled = YES;
    self.webView.paginationMode = UIWebPaginationModeLeftToRight;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ipsum" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.textFontSize = 100;
}

- (IBAction)testButtonPressed:(id)sender
{
    [self increaseFontSize];
}

- (void)increaseFontSize
{
    self.textFontSize += 10;
    NSString *jsString = [[NSString alloc] initWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%lu%%'",
                          (unsigned long)self.textFontSize];
    [self.webView stringByEvaluatingJavaScriptFromString:jsString];
}

- (void)justifyAndHyphenate
{
    NSString *bodyStyle = @"document.getElementsByTagName('body')[0].style.textAlign = 'justify';";
    NSString *hyphenStyle = @"document.getElementsByTagName('body')[0].style.webkitHyphens = 'auto';";
    
    [self.webView stringByEvaluatingJavaScriptFromString:bodyStyle];
    [self.webView stringByEvaluatingJavaScriptFromString:hyphenStyle];
}

- (void)changeFontFamily
{
    NSString *bodyStyle = @"document.getElementsByTagName('body')[0].style.fontFamily = 'Georgia';";
    [self.webView stringByEvaluatingJavaScriptFromString:bodyStyle];
}

- (void)addSepia
{
    // Does not work
    NSString *sepiaString = @"document.getElementsByTagName('body')[0].style.webkitSepia = '100';";
    [self.webView stringByEvaluatingJavaScriptFromString:sepiaString];
}

@end
