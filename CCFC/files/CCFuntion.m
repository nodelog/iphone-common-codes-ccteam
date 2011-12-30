//
//  CCFuntion.m
//  CCFC
//
//  Created by xichen on 11-12-30.
//  Copyright 2011 ccteam. All rights reserved.
//

#import "CCFuntion.h"


@implementation CCFuntion

// returns whether the function exists or not
+ (BOOL)isFuntionExist:(IMP)funcPtr
{
	return funcPtr != NULL;
}

@end
