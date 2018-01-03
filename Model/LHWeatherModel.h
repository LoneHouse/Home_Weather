//
//  LHWeatherModel.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/14/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHWeatherModel : NSObject
@property (nonnull, readonly) NSDictionary *data;

- (instancetype _Nullable )initWithDictionary:(NSDictionary *_Nonnull)dict;
- (instancetype _Nullable )initWithJSONData:(NSData *_Nonnull)JSONData;

#pragma mark - Weather Data

@property (nonatomic, readonly) NSNumber * _Nonnull temperature;
@property (nonatomic, readonly) NSNumber * _Nonnull pressure;
@property (nonatomic, readonly) NSNumber * _Nonnull humidity;

@property (nonatomic, readonly) NSString * _Nonnull name;

@end
