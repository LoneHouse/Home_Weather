//
//  NSSideMenu.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/26/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import "LHSideMenu.h"
#import "LHSideMenuController.h"
#import "LHSideMenuDelegate.h"

@interface LHSideMenu () <LHSideMenuDelegate>

@property (nonatomic, strong) LHSideMenuController *menuController;

@end

@implementation LHSideMenu

@synthesize enable = _enabled, show = _showed;

- (instancetype)init
{
    return [self initWithWindow:[UIApplication sharedApplication].windows.firstObject];
}

- (instancetype)initWithWindow:(UIWindow *)window
{
    self = [super init];
    if (self) {
        self.menuController =
        [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]
                            instantiateViewControllerWithIdentifier:@"SideMenu"];
        self.menuController.delegate = self;
        
        [self addToWindow:window];
    }
    return self;
}

#pragma mark - Properties

- (BOOL)enabled
{
    return _enabled;
}

- (void)setEnable:(BOOL)enabled
{
    [self enable:enabled animated:NO];
}

- (BOOL)showed
{
    return _showed;
}

- (void)setShow:(BOOL)showed
{
    [self showMenu:showed animated:NO];
}

#pragma mark - View Animations

- (void)addToWindow:(UIWindow *)window
{
    //No need to do that, actually
    if (!self.menuController.isViewLoaded) {
        [self.menuController loadView];
    }
    CGRect windowFrame = window.bounds;
    self.menuController.view.frame = windowFrame;
    [self.menuController.view layoutSubviews];
    
    [window addSubview:self.menuController.view];
    
    [self enable:YES animated:NO];
}

- (void)showMenu:(BOOL)showed animated:(BOOL)animated
{
    _showed = showed;
    CGRect frame = self.menuController.view.frame;
    if (showed) {
        frame.origin.x = 0;
    } else {
        frame.origin.x = -self.menuController.contentView.frame.size.width;
    }
    [self moveTo:frame animated:animated];
}

- (void)enable:(BOOL)enabled animated:(BOOL)animated
{
    _enabled = enabled;
    CGRect frame = self.menuController.view.frame;
    if (enabled) {
        frame.origin.x = -self.menuController.contentView.frame.size.width;
    } else {
        frame.origin.x = -frame.size.width;
    }
    [self moveTo:frame animated:animated];
}

- (void)moveTo:(CGRect)frame animated:(BOOL)animated
{
    [UIView animateWithDuration:animated?0.3:0 animations:^{
        self.menuController.view.frame = frame;
    }];
}

#pragma mark - LHSideMenuDelegate

- (void)menuAction
{
    [self showMenu:!self.showed animated:YES];
}

@end
