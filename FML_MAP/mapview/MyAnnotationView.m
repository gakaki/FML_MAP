#import "MyAnnotationView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MyAnnotationView

@synthesize title_price;
@synthesize title_build_desc;
@synthesize title_house_count_desc;

@synthesize lbl_price;
@synthesize lbl_build_desc;
@synthesize lbl_house_count_desc;

@synthesize img_build_url,img_build;


- (id)initWithAnnotation:(id)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
	MyAnnotation * my_annotation = (MyAnnotation*)annotation;
 
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor clearColor];
    self.image = [UIImage imageNamed:@"marker.png"];
    
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) 
    {
        self.image = [UIImage imageNamed:@"marker0.png"];
        [annotation setTitle:@"我的位置"];
        [annotation setSubtitle:@"我的位置副标题"];
        

    }else{
    	if([my_annotation annotationType] == HouseBuild) {
            
            self.image = [UIImage imageNamed:@"marker.png"];

            float title_width = self.image.size.width*3;
            float title_margin_left = (title_width - self.image.size.width)/2;
           
            CGRect title_label_size = CGRectMake(-title_margin_left, self.image.size.height+2, title_width, 15);
                      
            UILabel *label = [[UILabel alloc]initWithFrame:title_label_size];
            label.text   =  [NSString stringWithFormat:@"%d套 %d元", [annotation count],[annotation price] ];
              
            label.font = [UIFont systemFontOfSize:10];
            label.numberOfLines = 2;
            label.textAlignment = UITextAlignmentCenter;            
            label.textColor = [UIColor whiteColor];
            [label setTag:1];
            label.opaque = NO;
          //  label.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
            label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.7];
           // label.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:.1];

            [label.layer setCornerRadius:5.0f];
            //[label.layer setBorderColor:[UIColor colorWithHue:0.0 saturation:0.0 brightness:1.0 alpha:0.1].CGColor];
            
//            
            label.clipsToBounds = YES;
            
            
            [self addSubview:label];

            
            
            
            [label setNeedsDisplay];
            [label release];
                        
        }
    }

    
	[self setHighlighted:TRUE];
    [self setCanShowCallout:FALSE];
   
    return self;
}

- (void)dealloc {
    
    [lbl_house_count_desc release],lbl_house_count_desc = nil;
    [lbl_build_desc release],lbl_build_desc = nil;
    [lbl_price release],lbl_price = nil;
    
    [title_house_count_desc release],title_house_count_desc = nil;
    [title_build_desc release],title_build_desc = nil;
    [title_price release],title_price = nil;
    
    [img_build release],img_build = nil;
    [img_build_url release],img_build_url = nil;
    
    [super dealloc];
}

@end
