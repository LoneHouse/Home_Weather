//
//  LHSideMenuController.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import "LHSideMenuController.h"

@interface LHSideMenuController ()

@property (weak, nonatomic) IBOutlet UIButton *menuButton;

- (IBAction)showMenuAction:(id)sender;

@end

@implementation LHSideMenuController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)showMenuAction:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(menuAction)]) {
        [self.delegate menuAction];
    }
}
@end
