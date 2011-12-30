//
//  CCCALayer.m
//  CCFC
//
//  Created by xichen on 11-12-24.
//  Copyright 2011 ccteam. All rights reserved.
//

#import "CCCALayer.h"


@implementation CALayer(cc)

+ (void)addTestLayer:(UIView *)view withRect:(CGRect)rect
{
	CALayer *layer = [[CALayer alloc] init];
	layer.frame = rect;
	
	UIColor *greenColor = [UIColor greenColor];
	[layer setBackgroundColor:greenColor.CGColor];
	[view.layer insertSublayer:layer atIndex:0];
	[layer release];
}

- (void)setBg:(UIImage *)img
{
	self.contents = (id)img.CGImage;
}

// create a common layer using rect and color
+ (CALayer *)createCommonLayer:(CGRect)rect color:(UIColor *)color
{
	CALayer *layer = [CALayer layer];
	layer.backgroundColor = color.CGColor;
	layer.frame = rect;
	return layer;
}

@end
