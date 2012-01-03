//
//  CCUIToolbar.m
//  CCFC
//
//  Created by xichen on 12-1-3.
//  Copyright 2012 ccteam. All rights reserved.
//

#import "CCUIToolBar.h"


@implementation UIToolbar(cc)

// create a common toolbar
+ (UIToolbar *)createCommonToolbar:(CGRect)rect items:(NSArray *)buttonItemArr
{
	UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:rect];
	[toolbar setItems:buttonItemArr animated:YES];
	
	return [toolbar autorelease];
}

@end
