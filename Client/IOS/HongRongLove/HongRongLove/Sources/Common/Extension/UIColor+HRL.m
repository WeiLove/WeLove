//
//  UIColor+HRL.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-23.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "UIColor+HRL.h"

@implementation UIColor (HRL)

+ (UIColor *)colorWithHex:(uint)hex
{
	int red, green, blue, alpha;
	
	blue = hex & 0x000000FF;
	green = ((hex & 0x0000FF00) >> 8);
	red = ((hex & 0x00FF0000) >> 16);
	alpha = ((hex & 0xFF000000) >> 24);
	
	return [UIColor colorWithRed:red/255.0f
						   green:green/255.0f
							blue:blue/255.0f
						   alpha:alpha/255.0f];
}

@end
