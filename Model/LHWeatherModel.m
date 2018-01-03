//
//  LHWeatherModel.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/14/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//
/*API respond:
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


#import "LHWeatherModel.h"

@implementation LHWeatherModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _data = [dict copy];
        
    }
    return self;
}

- (instancetype)initWithJSONData:(NSData *)JSONData
{
    NSError *error;
    NSDictionary *JSONObject = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:&error];
    if (error) {
        return nil;
    }
    return [self initWithDictionary:JSONObject];
}

-(NSString *)name
{
    return self.data[@"name"];
}

- (NSNumber *)temperature
{
    return self.data[@"main"][@"temp"];
}

- (NSNumber *)humidity
{
    return self.data[@"main"][@"humidity"];
}

- (NSNumber *)pressure
{
    return self.data[@"main"][@"pressure"];
}

@end
