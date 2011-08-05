//
//  FML_MAPAppDelegate.h
//  FML_MAP
//
//  Created by 贤明 贺 on 11-7-26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class FML_MAPViewController;

@interface FML_MAPAppDelegate : NSObject <UIApplicationDelegate,CLLocationManagerDelegate>{

        CLLocationManager *locationManager;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FML_MAPViewController *viewController;

@property (readonly,nonatomic, assign) CLLocationManager  *locationManager;

@end
