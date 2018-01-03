//
//  LHLocationModule.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LHLocationModule : NSObject <LHStartable>

@property (nonatomic, readonly) CLLocation *location;

@end
