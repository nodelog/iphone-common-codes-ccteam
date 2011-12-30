//
//  CCMapAnnotation.m
//  CCFC
//
//  Created by xichen on 11-12-30.
//  Copyright 2011 ccteam. All rights reserved.
//

#import "CCMapAnnotation.h"
#import "CCCommon.h"

@implementation CCMapAnnotation

@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize coordinate = _cord;

- (id)initWithCoordinate:(CLLocationCoordinate2D)loc
{
	COMMON_INIT_BEGIN
	
	_cord = loc;
	
	COMMON_INIT_END
}
- (void)dealloc
{
	[_title release];
	[_subtitle release];
	[super dealloc];
}

@end
