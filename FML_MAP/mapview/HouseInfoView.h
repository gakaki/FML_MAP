//
//  HouseInfoView.h
//  FML_MAP
//
//  Created by 贤明 贺 on 11-8-3.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAnnotation.h"

@interface HouseInfoView : UIButton{

    MyAnnotation *ann;
}

@property (nonatomic, assign) MyAnnotation *ann;


-(id)initWithAnnotation:(MyAnnotation*)my_annotation andSelector:(SEL)selector;

@end
