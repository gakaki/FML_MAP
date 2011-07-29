#import "UserLocationAnnotationView.h"
@implementation UserLocationAnnotationView

- (id)initWithAnnotation:(id )annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    
    MyAnnotation * myAnnotation = (MyAnnotation*)annotation;
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) 
    {
        self = [super initWithAnnotation:myAnnotation reuseIdentifier:@"me"];
		self.backgroundColor = [UIColor clearColor];
		self.image = [UIImage imageNamed:@"marker0.png"];

        return nil;
    }
	if([myAnnotation annotationType] == HouseBuild) {
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:@"house_build"];
		self.backgroundColor = [UIColor clearColor];
		self.image = [UIImage imageNamed:@"marker.png"];
	}
    if([myAnnotation annotationType] == Callout) {
        
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:@"Callout"];
		self.backgroundColor = [UIColor clearColor];
		self.image = [UIImage imageNamed:@"marker.png"];
	}

	[self setHighlighted:TRUE];
    [self setCanShowCallout:TRUE];
    
    return self;
}

- (void)dealloc {
    [super dealloc];
}

@end
