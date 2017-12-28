//
//  CYColor.m
//  LuckyForever
//
//  Created by OD INTERNATIONAL 3 on 12/28/17.
//  Copyright © 2017 OD INTERNATIONAL 3. All rights reserved.
//

#import "CYColor.h"

@implementation CYColor

+(CAGradientLayer *) configLayerWithFrame:(CGRect ) rect
                                        startPoint:(CGPoint) start_point
                                          endPoint:(CGPoint) end_point
                                        startColor:(UIColor *) start_color
                                          endColor:(UIColor *) end_color{
    //    UIColor *leftColor =[UIColor colorWithRed:0 green:116 blue:255 alpha:1];
    //    UIColor *rightColor = [UIColor colorWithRed:0 green:171 blue:255 alpha:1];
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = rect;
    //颜色分配:四个一组代表一种颜色(r,g,b,a)
    layer.colors = @[(__bridge id) start_color.CGColor,
                     (__bridge id) end_color.CGColor];
    //起始点
    layer.startPoint = start_point;
    //结束点
    layer.endPoint = end_point;
    return layer;
}
+(CAGradientLayer *) configNavigationViewWithFrame:(CGRect)rect{

    return [CYColor configLayerWithFrame:rect startPoint:CGPointMake(0.0, 0.0) endPoint:CGPointMake(1.0, 0.0) startColor:[UIColor colorWithRed:255.0/255 green:1.0/255 blue:86.0/255 alpha:1.0f] endColor:[UIColor colorWithRed:255.0/255 green:140.0/255 blue:105.0/255 alpha:1.0]];
}
@end
