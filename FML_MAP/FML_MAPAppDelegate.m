//
//  FML_MAPAppDelegate.m
//  FML_MAP
//
//  Created by 贤明 贺 on 11-7-26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "FML_MAPAppDelegate.h"

#import "FML_MAPViewController.h"

@implementation FML_MAPAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize locationManager;
@synthesize gakaki;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
//    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    //[locationManager setDistanceFilter:20];    
    
    [locationManager setDistanceFilter:50.0f];
    
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBestForNavigation];
    locationManager.purpose = @"福美来房地产需要获取您当前的位置收集该位置附近的房源信息";
    [locationManager startUpdatingLocation];
    
    
    [self setGakaki:@"gakakiwithyou"];
    

    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    NSLog(@"当前location manager 认证 功能 %d",status);
}
- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
    //这里需要一个单例类来获取当前的坐标
}

- (void)locationManager:(CLLocationManager *)manager 
       didFailWithError:(NSError *)error
{
    
    if ([@"kCLErrorDomain" isEqualToString:[error domain]]) {
        NSLog(@"Could not find location: %@", error);
    }
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

- (void)dealloc
{
    if ([locationManager delegate] == self)
        [locationManager setDelegate:nil];
    [locationManager release];
    
    [gakaki release];
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
