//
//  CYColor.h
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 12/28/17.
//  Copyright © 2017 OD INTERNATIONAL 3. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface CYColor : NSObject
+(CAGradientLayer *) configLayerWithFrame:(CGRect ) rect
                               startPoint:(CGPoint) start_point
                                 endPoint:(CGPoint) end_point
                               startColor:(UIColor *) start_color
                                 endColor:(UIColor *) end_color;

+(CAGradientLayer *) configNavigationViewWithFrame:(CGRect)rect;
@end
