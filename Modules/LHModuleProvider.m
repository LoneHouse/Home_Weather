//
//  LHModuleProvider.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import "LHModuleProvider.h"


@implementation LHModuleProvider

@synthesize weather, sideMenu;

+ (instancetype)sharedProvider
{
    static LHModuleProvider * sharedProvider;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedProvider = [[LHModuleProvider alloc] init];
    });
    return sharedProvider;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        weather = [[LHWeatherProvider alloc] init];
        [weather start];
    }
    return self;
}

-(LHSideMenu *)sideMenu
{
    if (!sideMenu) {
        sideMenu = [[LHSideMenu alloc] init];
    }
    return sideMenu;
}

@end
