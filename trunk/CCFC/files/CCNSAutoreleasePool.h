//
//  CCNSAutoreleasePool.h
//  CCFC
//
//  Created by xichen on 12-1-3.
//  Copyright 2012 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>

#define	MACRO_COMMON_POOL_BEGIN		\
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

#define	MACRO_COMMON_POOL_END		[pool release];

@interface NSAutoreleasePool(cc)



@end
