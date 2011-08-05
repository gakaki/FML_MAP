//
//  FML_MAPViewController.h
//  FML_MAP
//
//  Created by 贤明 贺 on 11-7-26.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>  
#import "HouseInfoView.h"

@interface FML_MAPViewController : UIViewController<MKMapViewDelegate,
UITextFieldDelegate>
{

    MKMapView *myMapView; 
    CLLocationCoordinate2D my_location;
    
    HouseInfoView *house_info_view;
   // MKReverseGeocoder *geoCoder;
}

@property (nonatomic, retain)   MKMapView       *myMapView; 
@property (nonatomic, retain)   HouseInfoView   *house_info_view; 
//@property (nonatomic, retain)   MKReverseGeocoder *geoCoder;

-(void)display_my_map;


@end
