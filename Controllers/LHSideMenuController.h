//
//  LHSideMenuController.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LHSideMenuDelegate.h"

@interface LHSideMenuController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (weak, nonatomic) NSObject<LHSideMenuDelegate> *delegate;

@end
