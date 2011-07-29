#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface MyAnnotationView : MKAnnotationView{

    NSString    *title_build_desc;
    NSString    *title_house_count_desc;
    NSString    *title_price;
    NSString    *img_build_url;
    
    UILabel     *lbl_build_desc;
    UILabel     *lbl_house_count_desc;
    UILabel     *lbl_price;
    UIImage     *img_build;
}

@property (nonatomic, copy) NSString *title_build_desc;
@property (nonatomic, copy) NSString *title_house_count_desc;
@property (nonatomic, copy) NSString *title_price;
@property (nonatomic, copy) NSString *img_build_url;

@property (nonatomic, retain) UILabel *lbl_build_desc;
@property (nonatomic, retain) UILabel *lbl_house_count_desc;
@property (nonatomic, retain) UILabel *lbl_price;
@property (nonatomic, retain) UIImage *img_build;


- (id)initWithAnnotation:(id )annotation reuseIdentifier:(NSString *)reuseIdentifier;

@end
