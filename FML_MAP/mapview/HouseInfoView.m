//
//  HouseInfoView.m
//  FML_MAP
//
//  Created by 贤明 贺 on 11-8-3.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "HouseInfoView.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"

@implementation HouseInfoView
@synthesize ann;

- (id)d:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }
    return self;
}


-(id)initWithAnnotation:(MyAnnotation*)my_annotation andSelector:(SEL)selector{
    
    CGFloat offset_radius = 3.0f;
    CGSize screen_size          = [[UIScreen mainScreen]bounds].size;     
    CGRect corner_view_size     = CGRectMake(-10, 0,screen_size.width*5/6,screen_size.height*1/4);
    
    
    self = [super initWithFrame:corner_view_size];
    
    if (self == nil) {
        return false;
    }

    self.ann = my_annotation;
    // generate corner view    
   // self        = [[UIButton alloc]initWithFrame:corner_view_size];
    self.backgroundColor = [UIColor colorWithRed: 255.0f/255.0f green:203.0f/255.0f blue:2.0f/255.0f alpha:.6];   
    self.opaque = NO;
    [self.layer setCornerRadius: offset_radius];
    self.clipsToBounds = YES;

    
    //generate background view in corner view
    CGRect background_whiteview_size     = CGRectMake(offset_radius, offset_radius,corner_view_size.size.width-offset_radius*2,corner_view_size.size.height-offset_radius*2);
    UIButton *background_whiteview = [[UIButton alloc]initWithFrame:background_whiteview_size];
    background_whiteview.backgroundColor = [UIColor colorWithRed: 124.0f/255.0f green:46.0f/255.0f blue:30.0f/255.0f alpha:.85];    
    background_whiteview.opaque = NO;
    [background_whiteview.layer setCornerRadius: offset_radius];
    background_whiteview.clipsToBounds = YES;
    
//    
//    [background_whiteview addTarget:self action:@selector(selector:) forControlEvents:UIControlEventTouchUpInside];
//    
//
//   
    
    int offset_innerview = 6;
    
    UIImageView *img_build_image_view = [[UIImageView alloc]initWithFrame:CGRectMake(2.0+offset_innerview, 8.0, 97.0, 86.0)];
    [img_build_image_view setImageWithURL:[NSURL URLWithString:@"http://i.stack.imgur.com/WbJZf.png"]
                         placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    img_build_image_view.layer.borderColor = [[UIColor whiteColor] CGColor];
    img_build_image_view.layer.borderWidth = 2;
    img_build_image_view.layer.cornerRadius = 4;
    [img_build_image_view setNeedsLayout];
    
    UILabel *lbl_builder_name        = [[UILabel alloc] initWithFrame:CGRectMake(103.0+offset_innerview, 9.0, 154.0, 21.0)];
    [lbl_builder_name setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [lbl_builder_name setTextColor:[UIColor whiteColor]];
    [lbl_builder_name setBackgroundColor:[UIColor clearColor]];
    lbl_builder_name.text = [my_annotation title];
    
    UILabel *lbl_builder_desc        = [[UILabel alloc] initWithFrame:CGRectMake(103.0+offset_innerview, 38.0, 154.0, 21.0)];
    [lbl_builder_desc setTextColor:[UIColor whiteColor]];
    lbl_builder_desc.text = [my_annotation subtitle];
    [lbl_builder_desc setFont:[UIFont systemFontOfSize:13.0f]];
    [lbl_builder_desc setBackgroundColor:[UIColor clearColor]];
    
    UILabel *lbl_builder_price        = [[UILabel alloc] initWithFrame:CGRectMake(103.0+offset_innerview, 67.0, 154.0, 21.0)];
    [lbl_builder_price setFont:[UIFont systemFontOfSize:13.0f]];
    [lbl_builder_price setBackgroundColor:[UIColor clearColor]];
    [lbl_builder_price setTextColor:[UIColor whiteColor]];
    lbl_builder_price.text = [NSString stringWithFormat:@"售价 %d元/月",[my_annotation price]];
    
    UIImageView *img_build_image_arrow = [[UIImageView alloc]initWithFrame:CGRectMake(background_whiteview_size.size.width-30+offset_innerview, 44.0, 24.0, 24.0)];
    [img_build_image_arrow setImage:[UIImage imageNamed:@"goto_arrow.png"]];
    img_build_image_arrow.opaque = YES; 
    
    [background_whiteview addSubview:img_build_image_view];
    [background_whiteview addSubview:lbl_builder_name];
    [background_whiteview addSubview:lbl_builder_price];
    [background_whiteview addSubview:lbl_builder_desc];
    [background_whiteview addSubview:img_build_image_arrow];
    
    [self addSubview:background_whiteview];
    
    [img_build_image_view release];
    [lbl_builder_name release];
    [lbl_builder_desc release];
    [lbl_builder_price release];
    [background_whiteview release];
    
    return self;
}
- (void)drawRect:(CGRect)rect
{
    
}

-(void)dealloc{
 
    [super dealloc];
}

@end
