//
//  NGViewController.m
//  UIAlertWithBlock
//
//  Created by Nitin Gupta on 8/26/14.
//  Copyright (c) 2014 Nitin Gupta. All rights reserved.
//

#import "NGViewController.h"
#import "UIAlertViewWithBlock.h"

@interface NGViewController ()

@end

@implementation NGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addShowAlertButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Life Cycle
- (void)addShowAlertButton {
    CGSize _size = [[UIScreen mainScreen] bounds].size;
    UIButton *butn = [UIButton buttonWithType:UIButtonTypeCustom];
    [butn addTarget:self action:@selector(showBlockAlert:) forControlEvents:UIControlEventTouchUpInside];
    [butn setFrame:CGRectMake(0,0, 60, 30)];
    [butn setTitle:@"Show Alert" forState:UIControlStateNormal];
    [butn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [butn setCenter:CGPointMake(_size.width/2, _size.height/2)];
    [[butn  titleLabel] setFont:[UIFont systemFontOfSize:10]];
    [[self view] addSubview:butn];
}


- (void)showBlockAlert:(id)sender {
    UIAlertViewWithBlock *alert= [[UIAlertViewWithBlock alloc] initWithTitle:@"Alert" message:@"This is test block alert" cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    [alert showWithDismissHandler:^(NSInteger selectedIndex) {
        switch (selectedIndex) {
            case 1: {
                NSLog(@"case 1:");
            } break;
            case 0: {
                NSLog(@"case 0:");
            }
            default:
                NSLog(@"case default:");
                break;
        }
 
    }];
}

@end
