//
//  LHStartableProtocol.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#ifndef LHModuleProtocols_h
#define LHModuleProtocols_h

@class LHWeatherModule;

@protocol LHStartable

- (void)start;
- (void)stop;

@end

@protocol LHModuleProvider

@property (nonatomic, readonly) LHWeatherModule *weather;

@end

#endif /* LHStartableProtocol_h */
