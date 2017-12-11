//
//  LHModuleProvider.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import "LHModuleProvider.h"
#import "LHWeatherModule.h"

@implementation LHModuleProvider

@synthesize weather;

- (instancetype)init
{
    self = [super init];
    if (self) {
        weather = [[LHWeatherModule alloc] init];
    }
    return self;
}

@end
