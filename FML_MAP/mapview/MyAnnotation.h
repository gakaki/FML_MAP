
#import <MapKit/MapKit.h>

typedef enum AnnotationType {
	My,
	HouseBuild,
    Callout
} AnnotationType;

@interface MyAnnotation : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
    NSUInteger count;
    
    NSString *img_url;
    
	AnnotationType annotationType;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * subtitle;
@property (nonatomic) AnnotationType annotationType;
@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, copy) NSString *img_url;

- (id)initWithCoords:(CLLocationCoordinate2D) coords 
             andType:(AnnotationType) type 
       andHouseCount:(NSUInteger)houseCount 
          andImg_url:(NSString*)img_url;
@end
