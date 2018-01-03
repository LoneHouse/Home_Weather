//
//  LHHomeViewController.m
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import "LHHomeController.h"
#import "LHModuleProvider.h"

@interface LHHomeController ()

@property (nonatomic, weak) LHWeatherProvider *weather;
@property (nonatomic, strong) LHWeatherModel *model;

@property (weak, nonatomic) IBOutlet UILabel *labelCityName;
@property (weak, nonatomic) IBOutlet UILabel *labelTempValue;
@property (weak, nonatomic) IBOutlet UILabel *labelHumidityValue;
@property (weak, nonatomic) IBOutlet UILabel *labelPressureValue;

- (IBAction)testAction:(UIButton *)sender;


@end

@implementation LHHomeController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.weather = [LHModuleProvider sharedProvider].weather;
        [self.weather weatherForCurrentLocation:^(LHWeatherModel *result) {
            self.model = result;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setupView:result];
            });
        }];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView:self.model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Data Model

- (void)setupView:(LHWeatherModel *)model
{
    if (!self.isViewLoaded || !model) {
        return;
    }
    self.labelCityName .text     = model.name;
    self.labelTempValue.text     = model.temperature.stringValue;
    self.labelHumidityValue.text = model.humidity.stringValue;
    self.labelPressureValue.text = model.pressure.stringValue;
}

#pragma mark - IBActinos

- (IBAction)testAction:(UIButton *)sender {
    [[LHModuleProvider sharedProvider].sideMenu showMenu:YES animated:YES];
}
@end
