#import "FML_MAPViewController.h"
#import "FML_MAPAppDelegate.h"
#import "MKMapView+ZoomLevel.h"
#import "MyAnnotation.h"
#import "MyAnnotationView.h"
#import <QuartzCore/QuartzCore.h>

#define ZOOM_LEVEL 14

@interface FML_MAPViewController()
-(void)add_other_annotation;
-(void)reset_select_point_title_position:(MyAnnotationView *)v;
-(void)gakaki:(id)sender;
@end

@implementation FML_MAPViewController

@synthesize myMapView,house_info_view;

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self display_my_map];
    [self add_other_annotation];
}


#define sim_address 1
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {

    
    if ([annotation isKindOfClass:[MKUserLocation class]]) 
    {
            my_location  = [annotation coordinate];
#ifdef sim_address
            my_location = CLLocationCoordinate2DMake(31.18454089, 121.42275005);
#endif
        
        //   NSLog(@"%f %f",my_location.latitude,my_location.longitude);
            [myMapView setCenterCoordinate:my_location zoomLevel:15 animated:FALSE];
    }
    
    MyAnnotationView *aView = [[[MyAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"location"] autorelease];
    
    [aView setEnabled:YES];
    [aView setCanShowCallout:NO];
    return aView;
}



-(void)add_other_annotation{
    
    NSUInteger is_in_home = 0;
    if (is_in_home) {
        
        CLLocationCoordinate2D googleCoords;
        googleCoords.latitude   = 31.26054730;
        googleCoords.longitude  = 121.39675117;
        MyAnnotation * google = [[MyAnnotation alloc] initWithCoords:googleCoords 
                                                             andType:HouseBuild 
                                                       andHouseCount:23 
                                                            andPrice:6500 
                                                          andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [google setTitle:@"毗邻地铁7号线　高。。。"];
        [google setSubtitle:@"125平方米 精装 第18层"];
        [google setPrice:7500.0f];
        
        [myMapView addAnnotation:google];
        [google release];
        
        CLLocationCoordinate2D appleCoords;
        appleCoords.latitude   = 31.26044730;
        appleCoords.longitude  = 121.39775117;
        MyAnnotation * apple = [[MyAnnotation alloc] initWithCoords:appleCoords 
                                                            andType:HouseBuild 
                                                      andHouseCount:44 
                                                           andPrice:8900 
                                                         andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [apple setTitle:@"毗邻地铁7号线　高。。。"];
        [apple setSubtitle:@"125平方米 精装 第18层"];
        [apple setPrice:7500.0f];
        [myMapView addAnnotation:apple];
        [apple release];
        
        CLLocationCoordinate2D callout_coords;
        callout_coords.latitude   = 31.25954730;
        callout_coords.longitude  = 121.39675117;
        MyAnnotation * callout_ann = [[MyAnnotation alloc] initWithCoords:callout_coords 
                                                                  andType:Callout 
                                                            andHouseCount:43 
                                                                 andPrice:7200 
                                                               andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [callout_ann setTitle:@"毗邻地铁7号线　高。。。"];
        [callout_ann setSubtitle:@"125平方米 精装 第18层"];
        [callout_ann setPrice:7500.0f];
        [myMapView addAnnotation:callout_ann];
        [google release];
        
    }else{
        
        CLLocationCoordinate2D googleCoords;
        googleCoords.latitude   = 31.185541;
        googleCoords.longitude  = 121.423750;
        MyAnnotation * google = [[MyAnnotation alloc] initWithCoords:googleCoords 
                                                             andType:HouseBuild 
                                                       andHouseCount:23 
                                                            andPrice:6500 
                                                          andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [google setTitle:@"毗邻地铁7号线　高。。。"];
        [google setSubtitle:@"125平方米 精装 第18层"];
        [google setPrice:7500.0f];
        
        [myMapView addAnnotation:google];
        [google release];
        
        CLLocationCoordinate2D appleCoords;
        appleCoords.latitude   = 31.185641;
        appleCoords.longitude  = 121.424750;
        MyAnnotation * apple = [[MyAnnotation alloc] initWithCoords:appleCoords 
                                                            andType:HouseBuild 
                                                      andHouseCount:44 
                                                           andPrice:8900 
                                                         andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [apple setTitle:@"毗邻地铁7号线　高。。。"];
        [apple setSubtitle:@"125平方米 精装 第18层"];
        [apple setPrice:7500.0f];
        [myMapView addAnnotation:apple];
        [apple release];
        
        CLLocationCoordinate2D callout_coords;
        callout_coords.latitude   = 31.185741;
        callout_coords.longitude  = 121.425750;
        MyAnnotation * callout_ann = [[MyAnnotation alloc] initWithCoords:callout_coords 
                                                                  andType:Callout 
                                                            andHouseCount:43 
                                                                 andPrice:7200 
                                                               andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [callout_ann setTitle:@"毗邻地铁7号线　高。。。"];
        [callout_ann setSubtitle:@"125平方米 精装 第18层"];
        [callout_ann setPrice:7500.0f];
        [myMapView addAnnotation:callout_ann];
    }
}

-(void)display_my_map
{
    myMapView = [[MKMapView alloc] initWithFrame:self.view.bounds]; 
    myMapView.delegate=self; 
    myMapView.showsUserLocation = TRUE;
    [myMapView setMapType:MKMapTypeStandard];
    [myMapView setZoomEnabled:YES];
    [myMapView setScrollEnabled:YES];
    
    [self.view addSubview:myMapView]; 
}
-(void)reset_select_point_title_position:(MyAnnotationView *)v  {
  for (UIView *sub_v in v.subviews)
    {
        if ([sub_v isKindOfClass:[UILabel class]]) {
            
            UILabel *lbl_house_title = (UILabel *)sub_v;
            float title_width = v.image.size.width*3;
            float title_margin_left = (title_width - v.image.size.width)/2;
            CGRect title_label_size = CGRectMake(-title_margin_left, v.image.size.height+2, title_width, 15);
            [lbl_house_title setFrame:title_label_size];
        }
    }

}

-(void)gakaki:(id)sender{
    
    UIButton* button = (UIButton*)sender;
    
    if (button.superview.tag == 2) {
            
        HouseInfoView *house = (HouseInfoView *)button.superview;
        NSLog(@"%@",[[house ann]subtitle]);
    }
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    MyAnnotationView *my_annotation_view = (MyAnnotationView *)view;
    my_annotation_view.image  = [UIImage imageNamed:@"marker-selected.png"];
    [self reset_select_point_title_position:my_annotation_view];
    
    house_info_view = [[HouseInfoView alloc] initWithAnnotation:(MyAnnotation *)[view annotation] 
                                                                   andSelector:@selector(myShowDetailsMethod:)];
    [house_info_view setTag:2];
    [self.view addSubview:house_info_view];

    for (UIView *sub_v in house_info_view.subviews)
    {
        if ([sub_v isKindOfClass:[UIButton class]]) {
           
            [(UIButton *)sub_v addTarget:self action:@selector(gakaki:) 
                      forControlEvents:UIControlEventTouchUpInside];
        }
    }



    
    [house_info_view setAlpha:0.0];
    [UIView beginAnimations:nil context:nil];
    [house_info_view setAlpha:1.0];
    [UIView commitAnimations];
    [house_info_view release];
    NSLog(@"house info view retain count is %d",[house_info_view retainCount]);
}
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    MyAnnotationView *my_annotation_view    = (MyAnnotationView *)view;
    my_annotation_view.image                = [UIImage imageNamed:@"marker.png"];
    [self reset_select_point_title_position: my_annotation_view];

    [[self.view viewWithTag:2] removeFromSuperview];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)u
{
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidUnload
{
    house_info_view = nil;
    myMapView       = nil;
    [super viewDidUnload];
}
-(void)dealloc{
    [house_info_view release];
    [myMapView release];
    [super dealloc];
}

@end
