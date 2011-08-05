
#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize title;
@synthesize subtitle;
@synthesize annotationType;
@synthesize count;
@synthesize img_url;
@synthesize price;

- (id)initWithCoords:(CLLocationCoordinate2D) coords 
             andType:(AnnotationType) type 
       andHouseCount:(NSUInteger)houseCount 
            andPrice:(NSUInteger)price_house
          andImg_url:(NSString*)img_url_web
{
    
	if(self = [super init]) {
		coordinate = coords;
		self.annotationType = type;
        self.count          = houseCount;
        self.price          = price_house;
        self.img_url        = img_url_web;
	}
	return self;
}

- (CLLocationCoordinate2D) coordinate {
	return coordinate;
}

- (void) dealloc {
    [img_url release],img_url = nil;
	[title release];
	[subtitle release];
	[super dealloc];
}

@end
