//
//  LHWeatherModule.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import "LHWeatherModule.h"
#import "LHNetworkModule.h"
#import "LHLocationModule.h"

@interface LHWeatherModule ()

@property (nonatomic, strong) LHLocationModule *location;
@property (nonatomic, strong) LHNetworkModule  *network;

@end

@implementation LHWeatherModule

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.location = [[LHLocationModule alloc] init];
        self.network  = [[LHNetworkModule  alloc] init];
    }
    return self;
}

#pragma mark - LHStartable Protocol

- (void)start
{
    [self.location start];
}

- (void)stop
{
    
}

@end
