//
//  LHNetworkModule.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^NetworkResponseCallback)(NSData *, NSURLResponse *, NSURLRequest *, NSError *);

@interface LHNetworkModule : NSObject <LHStartable>

- (void)getWeatherInLocation:(CLLocation *)location withCompletionHandler:(NetworkResponseCallback)completion;

@end
