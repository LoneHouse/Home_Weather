//
//  LHWeatherProvider.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHWeatherModel.h"

@interface LHWeatherProvider : NSObject <LHStartable>
- (void)weatherForCurrentLocation:(void(^)(id))handler;
@end
