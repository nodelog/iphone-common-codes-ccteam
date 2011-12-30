//
//  CCRuntime.m
//  CCFC
//
//  Created by xichen on 11-12-30.
//  Copyright 2011 ccteam. All rights reserved.
//

#import "CCRuntime.h"


@implementation CCRuntime

// get the var of the obj
+ (Ivar)getObjVar:(id)obj varname:(const char *)varname ret:(void **)ret
{
	return object_getInstanceVariable(obj, varname, ret);
}

@end
