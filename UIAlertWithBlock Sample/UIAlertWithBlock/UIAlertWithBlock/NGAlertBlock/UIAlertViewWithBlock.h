//
//  UIAlertViewWithBlock.h
//  UIAlertWithBlock
//
//  Created by Nitin Gupta on 8/26/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DismissHandler)(NSInteger selectedIndex);

@interface UIAlertViewWithBlock : NSObject

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
- (void)showWithDismissHandler:(DismissHandler)handler;

@end
