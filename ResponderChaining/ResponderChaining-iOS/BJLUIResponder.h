//
//  BJLUIResponder.h
//  ResponderChaining-iOS
//
//  Created by Bryan Luby on 2/1/14.
//  Copyright (c) 2014 Bryan Luby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BJLUIResponder : UIResponder

- (void)doCoolStuffWithSender:(id)sender;

@end

@interface BJLSecondUIResponder : BJLUIResponder

@end

@interface BJLLastUIResponder : BJLUIResponder

- (void)search_iTunes:(id)sender;

@end
