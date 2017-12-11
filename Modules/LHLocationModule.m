//
//  LHLocationModule.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//


#import "LHLocationModule.h"


@interface LHLocationModule () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, assign) CLAuthorizationStatus authStatus;

@property (nonatomic, strong) CLLocation *defaultLocation;

@end

@implementation LHLocationModule

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
    }
    return self;
}

- (void)checkPermissions
{
    self.authStatus = [CLLocationManager authorizationStatus];
}

#pragma mark - Properties

- (CLLocation *)location
{
    return self.locationManager.location?:self.defaultLocation;
}

- (void)setAuthStatus:(CLAuthorizationStatus)authStatus
{
    _authStatus = authStatus;
    
    switch (_authStatus) {
        case kCLAuthorizationStatusDenied:
        case kCLAuthorizationStatusRestricted:
            //Will use default Location, no actions required
            //TODO: Store location on app quit and reuse it as default
            self.defaultLocation = [[CLLocation alloc] init];
            break;
            
        case kCLAuthorizationStatusNotDetermined:
            [self.locationManager requestWhenInUseAuthorization];
            break;

        case kCLAuthorizationStatusAuthorizedAlways:
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            //Nice, we will use user location
            break;
            
        default:
            NSAssert(NO, @"Should not fail to default switch for Auth Status");
            break;
    }
}

#pragma mark - LHStartable

- (void)start
{
    [self checkPermissions];
}

- (void)stop
{
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    self.authStatus = status;
}

#pragma mark -
@end


