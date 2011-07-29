#import "FML_MAPViewController.h"
#import "FML_MAPAppDelegate.h"
#import "MKMapView+ZoomLevel.h"
#import "MyAnnotation.h"
#import "MyAnnotationView.h"
#import <QuartzCore/QuartzCore.h>
#define ZOOM_LEVEL 14

@interface FML_MAPViewController()
-(void)add_other_annotation;
@end

@implementation FML_MAPViewController

@synthesize myMapView;

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
    
    //  [NSThread detachNewThreadSelector:@selector(displayMYMap) toTarget:self withObject:nil]; 
    
    [self display_my_map];
    [self add_other_annotation];
}
//
//- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    NSLog(@"checking annotation");
//    MyAnnotationView *aView = [[MyAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"location"];
//	[aView setEnabled:YES];
//	[aView setCanShowCallout:YES];
////	
////    my_location  = [annotation coordinate];
////    [myMapView setCenterCoordinate:my_location zoomLevel:16 animated:FALSE];
////    
//    return aView;
//    
//    //    UIImage *image = [UIImage imageNamed:@"marker0.png"];
//    //    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    //    [pinView addSubview:imageView];
//    //    [imageView release];
//    
//}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	NSLog(@"checking annotation");
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) 
    {
        my_location  = [annotation coordinate];
        [myMapView setCenterCoordinate:my_location zoomLevel:15 animated:FALSE];
    }
    
    MyAnnotationView *aView = [[MyAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"location"];
    
    [aView setEnabled:YES];
    [aView setCanShowCallout:NO];
    return aView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{

    MyAnnotationView *v = (MyAnnotationView *)view;
    v.image  = [UIImage imageNamed:@"marker-selected.png"];
    [v setCenterOffset:CGPointMake(5, 5)];
    
    
    UILabel *white_view = [[UILabel alloc]initWithFrame:CGRectMake(2, 2, 15,20)];
    white_view.backgroundColor = [UIColor whiteColor];
    
    white_view.opaque = NO;
    [white_view.layer setCornerRadius:5.0f];
    white_view.clipsToBounds = YES;
    white_view.tag = 1;
    [v addSubview:white_view];

    
    UIButton* rightButton = [UIButton buttonWithType:
                             UIButtonTypeDetailDisclosure];
    rightButton.tag       = 2;
    [rightButton setFrame:CGRectMake(10, 10, 30, 30)];
    [rightButton addTarget:self action:@selector(myShowDetailsMethod:)
          forControlEvents:UIControlEventTouchUpInside];
   
    [v addSubview:rightButton];
    
    NSLog(@"%@",view);
}
-(void)myShowDetailsMethod:(id)sender{
    NSLog(@"werqwrew");
}
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    MyAnnotationView *v = (MyAnnotationView *)view;
    v.image  = [UIImage imageNamed:@"marker.png"];

//    
//    for (int i=1; i++; i<4) {
//        [[v viewWithTag:i] removeFromSuperview];
//    }
    [[v viewWithTag:1] removeFromSuperview];
    [[v viewWithTag:2] removeFromSuperview];
    
}
-(void)add_other_annotation{
    
    
    
    NSUInteger is_in_home = 1;
    if (is_in_home) {
    
        CLLocationCoordinate2D googleCoords;
        googleCoords.latitude   = 31.26054730;
        googleCoords.longitude  = 121.39675117;
        MyAnnotation * google = [[MyAnnotation alloc] initWithCoords:googleCoords andType:HouseBuild andHouseCount:23 andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [google setTitle:@"Google Inc."];
        [google setSubtitle:@"Mountain View, CA"];
        
        [myMapView addAnnotation:google];
        [google release];
        
        CLLocationCoordinate2D appleCoords;
        appleCoords.latitude   = 31.26044730;
        appleCoords.longitude  = 121.39775117;
        MyAnnotation * apple = [[MyAnnotation alloc] initWithCoords:appleCoords andType:HouseBuild andHouseCount:44 andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [apple setTitle:@"Apple Inc."];
        [apple setSubtitle:@"Cupertino, CA"];
        [myMapView addAnnotation:apple];
        [apple release];
        
        
        CLLocationCoordinate2D callout_coords;
        callout_coords.latitude   = 31.25954730;
        callout_coords.longitude  = 121.39675117;
        MyAnnotation * callout_ann = [[MyAnnotation alloc] initWithCoords:callout_coords andType:Callout andHouseCount:43 andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [callout_ann setTitle:@"Google Inc."];
        [callout_ann setSubtitle:@"Mountain View, CA"];

        [myMapView addAnnotation:callout_ann];
        [google release];

        
        
    }else{
        
        CLLocationCoordinate2D googleCoords;
        googleCoords.latitude = 31.18477364;
        googleCoords.longitude = 121.42303757;
        MyAnnotation * google = [[MyAnnotation alloc] initWithCoords:googleCoords andType:HouseBuild andHouseCount:23  andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [google setTitle:@"Google Inc."];
        [google setSubtitle:@"Mountain View, CA"];
        
        [myMapView addAnnotation:google];
        [google release];
        
        CLLocationCoordinate2D appleCoords;
        appleCoords.latitude = 31.18477364;
        appleCoords.longitude = 121.42403799;
        MyAnnotation * apple = [[MyAnnotation alloc] initWithCoords:appleCoords andType:HouseBuild andHouseCount:44  andImg_url:@"http://www.google.com/images/logos/logo.gif"];
        [apple setTitle:@"Apple Inc."];
        [apple setSubtitle:@"Cupertino, CA"];
        [myMapView addAnnotation:apple];
        [apple release];
        
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

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)u
{
}
- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc{
    [myMapView release];
    [super dealloc];
}

@end
