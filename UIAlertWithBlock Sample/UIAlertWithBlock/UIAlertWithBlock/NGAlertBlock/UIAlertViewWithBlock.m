//
//  UIAlertViewWithBlock.m
//  UIAlertWithBlock
//
//  Created by Nitin Gupta on 8/26/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "UIAlertViewWithBlock.h"
@interface UIAlertViewWithBlock()<UIAlertViewDelegate> {
    
}
@property (nonatomic,copy)DismissHandler activeDismissHandler;
@property (nonatomic,strong)UIAlertView *activeAlert;
@property (nonatomic,strong) UIAlertViewWithBlock *strongAlertReference;

@end

@implementation UIAlertViewWithBlock
@synthesize activeDismissHandler = _activeDismissHandler;
@synthesize activeAlert = _activeAlert;
@synthesize strongAlertReference = _strongAlertReference;

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    self = [super init];
    if (self) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
        if (otherButtonTitles != nil) {
            va_list args;
            va_start(args, otherButtonTitles);
            NSString * title = nil;
            while((title = va_arg(args,NSString*))) {
                [alert addButtonWithTitle:title];
            }
            va_end(args);
        }
        _activeAlert = alert;
    }
    return self;
    
}


-(void)showWithDismissHandler:(DismissHandler)handler {
    [self setActiveDismissHandler:handler];
    [self setStrongAlertReference:self];
    [_activeAlert show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.activeDismissHandler) {
        self.activeDismissHandler(buttonIndex);
    }
    _strongAlertReference = nil;
}

@end
