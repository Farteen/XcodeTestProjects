//
//  ViewController.m
//  NSAttributedStringWithHTML
//
//  Created by Bryan Luby on 12/21/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self escapeEntity];
}

- (void)escapeEntity
{
    NSString *htmlString = @"&#63743; &amp; &#38; &lt; &gt; &trade; &copy; &hearts; &clubs; &spades; &diams;";
    NSData *stringData = [htmlString dataUsingEncoding:NSUTF8StringEncoding];

    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSAttributedString *decodedString;
    decodedString = [[NSAttributedString alloc] initWithData:stringData
                                                     options:options
                                          documentAttributes:nil
                                                       error:nil];
    
    NSLog(@"%@", [decodedString string]);
    self.textView.attributedText = decodedString;
}

- (void)unEscapeEntity
{
    NSString *html = @"Today & tomorrow";
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithData:[html dataUsingEncoding:NSUTF8StringEncoding]
                                                                      options:options
                                                           documentAttributes:nil
                                                                        error:nil];
    
    NSLog(@"string1 %@", attrString);
    
//    NSAttributedString *attrString; // from previous code
//    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType};
    
    NSData *htmlData = [attrString dataFromRange:NSMakeRange(0, [attrString length]) documentAttributes:options error:nil];
    NSString *htmlString = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
    
    NSLog(@"string2 %@", htmlString);
}


- (void)doStuff
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"This is an example link that leads to Apple"];
    [attributedString addAttribute:NSLinkAttributeName
                             value:@"http://www.apple.com/"
                             range:[[attributedString string] rangeOfString:@"Apple"]];
    
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor greenColor],
                                     NSUnderlineColorAttributeName: [UIColor lightGrayColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
    self.textView.linkTextAttributes = linkAttributes;
    self.textView.attributedText = attributedString;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
//    if ([[URL scheme] isEqualToString:@"username"]) {
//        NSString *username = [URL host];
//    }
//    return YES;
    return YES;
}

@end
