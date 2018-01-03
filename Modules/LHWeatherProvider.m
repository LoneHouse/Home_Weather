//
//  LHWeatherProvider.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import "LHWeatherProvider.h"
#import "LHNetworkModule.h"
#import "LHLocationModule.h"

@interface LHWeatherProvider ()

@property (nonatomic, strong) LHLocationModule *locationModule;
@property (nonatomic, strong) LHNetworkModule  *networkModule;

@end

@implementation LHWeatherProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationModule = [[LHLocationModule alloc] init];
        self.networkModule  = [[LHNetworkModule  alloc] init];
    }
    return self;
}

#pragma mark - Weather

- (void)weatherForCurrentLocation:(void(^)(id))handler
{
    CLLocation *userLocation = self.locationModule.location;
    [self.networkModule getWeatherInLocation:userLocation withCompletionHandler:
     ^(NSData *data, NSURLResponse *response, NSURLRequest *request, NSError *error) {
         
         if (error) {
             NSLog(@"Error:[%@]",error.localizedDescription);
         }
         
         LHWeatherModel *weatherModel;
         if (data) {
             weatherModel = [[LHWeatherModel alloc] initWithJSONData:data];
         }
         
         if (handler) {
             handler(weatherModel);
         }
     }];
}

#pragma mark - LHStartable Protocol

- (void)start
{
    [self.locationModule start];
}

- (void)stop
{
    
}

@end
