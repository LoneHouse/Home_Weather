//
//  AppDelegate.h
//  Home_Weather
//
//  Created by Victor Privalov on 12/11/17.
//  Copyright © 2017 Victor Privalov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

