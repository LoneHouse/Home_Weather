//
//  LHStartableProtocol.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#ifndef LHModuleProtocols_h
#define LHModuleProtocols_h

@class LHWeatherProvider;
@class LHSideMenu;

@protocol LHStartable

- (void)start;
- (void)stop;

@end

@protocol LHModuleProvider

@property (nonatomic, readonly) LHWeatherProvider *weather;
@property (nonatomic, readonly) LHSideMenu *sideMenu;

@end

#endif /* LHStartableProtocol_h */
