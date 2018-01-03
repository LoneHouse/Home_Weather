//
//  LHModuleProvider.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LHWeatherProvider.h"
#import "LHSideMenu.h"

@interface LHModuleProvider : NSObject <LHModuleProvider>

+ (instancetype)sharedProvider;

@end
