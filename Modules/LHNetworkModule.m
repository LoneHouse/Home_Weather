//
//  LHNetworkModule.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//
//Endpoint for any API calls
//
//api.openweathermap.org
//
//Example of API call
//
//api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=600385e67319a9a3342ce17c68a12600
//
//API documentation
//
//http://openweathermap.org/api

//API call:
//
//api.openweathermap.org/data/2.5/weather?q={city name}
//api.openweathermap.org/data/2.5/weather?q={city name},{country code}
//
//Parameters:
//q city name and country code divided by comma, use ISO 3166 country codes
//api.openweathermap.org/data/2.5/weather?q=London
//api.openweathermap.org/data/2.5/weather?q=London,uk
/*
By geographic coordinates
api.openweathermap.org/data/2.5/weather?lat={lat_p}&lon={lon_p}
 
Parameters:
lat, lon coordinates of the location of your interest
api.openweathermap.org/data/2.5/weather?lat=35&lon=139

API respond:
{"coord":{"lon":139,"lat":35},
    "sys":{"country":"JP","sunrise":1369769524,"sunset":1369821049},
    "weather":[{"id":804,"main":"clouds","description":"overcast clouds","icon":"04n"}],
    "main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},
    "wind":{"speed":7.31,"deg":187.002},
    "rain":{"3h":0},
    "clouds":{"all":92},
    "dt":1369824698,
    "id":1851632,
    "name":"Shuzenji",
    "cod":200}
*/

#import "LHNetworkModule.h"


static NSString * const kOpenWeatherBaseURL = @"api.openweathermap.org";
static NSString * const kOpenWeatherEndpoint_Weather = @"/data/2.5/weather";
static NSString * const kOpenWeatherUnits = @"&units=metric";
static NSString * const kOpenWeatherLanguage = @"&lang=%@";
static NSString * const kOpenWeatherApiKey = @"&APPID=600385e67319a9a3342ce17c68a12600";


@interface LHNetworkModule()

@property (nonatomic, strong) NSURLSession *session;


@end

@implementation LHNetworkModule

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.session = [NSURLSession sharedSession];
    
    }
    return self;
}

#pragma mark - Properties


#pragma mark - Public interface

- (void)getWeatherInLocation:(CLLocation *)location withCompletionHandler:(NetworkResponseCallback)completion
{
    NSURLSessionDataTask *task = [self taskForWeatherInLocation:location completion:completion];
    [task resume];
}

#pragma mark - LHStartable
- (void)start
{
}

- (void)stop
{
}

#pragma mark - Requests

- (NSURLSessionDataTask *)taskForWeatherInLocation:(CLLocation *)location completion:(NetworkResponseCallback)completion
{
    NSURLRequest *request = [LHNetworkModule requestForWeatherInLocation:location];
    NSURLSessionDataTask *task =
    [self.session dataTaskWithRequest:request completionHandler:
     ^(NSData * data, NSURLResponse * response, NSError *error) {
         if (completion) {
             completion(data, response, request, error);
         }
     }];
    return task;
}

+ (NSURLRequest *)requestForWeatherWithQuery:(NSString *)query
{
    NSURLComponents *urlComps = [[NSURLComponents alloc] init];
    urlComps.scheme = @"https";
    urlComps.host   = kOpenWeatherBaseURL;
    urlComps.path   = kOpenWeatherEndpoint_Weather;
    urlComps.query  = [[[query stringByAppendingString:kOpenWeatherApiKey]
                        stringByAppendingString:kOpenWeatherUnits]
                        stringByAppendingString:[NSString stringWithFormat:kOpenWeatherLanguage,
                                                                        [NSLocale currentLocale].languageCode]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:urlComps.URL];
    return request;
}

+ (NSURLRequest *)requestForWeatherInLocation:(CLLocation *)location
{
   return [LHNetworkModule requestForWeatherWithQuery:[LHNetworkModule weatherByLocationParameter:location]];
}

+ (NSURLRequest *)requestForWeatherInCity:(NSString *)cityName
{
   return [LHNetworkModule requestForWeatherWithQuery:[LHNetworkModule weatherByCityNameParameter:cityName]];
}

+ (NSString *)weatherByCityNameParameter:(NSString *)cityName
{
    static NSString * const paramsFormat = @"q=%@";
    return [NSString stringWithFormat:paramsFormat,cityName];
}

+ (NSString *)weatherByLocationParameter:(CLLocation *)location
{
    static NSString * const paramsFormat = @"lat=%f&lon=%f";
    return [NSString stringWithFormat:paramsFormat, location.coordinate.latitude, location.coordinate.longitude];
}

@end
