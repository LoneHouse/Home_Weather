//
//  NSSideMenu.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/26/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHSideMenu : NSObject

@property (nonatomic, getter = enabled) BOOL enable;
@property (nonatomic, getter = showed ) BOOL show;

- (void)showMenu:(BOOL)showed  animated:(BOOL)animated;
- (void)enable:  (BOOL)enabled animated:(BOOL)animated;
@end
