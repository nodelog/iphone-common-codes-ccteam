//
//  CCDelete.h
//  CCFC
//
//  Created by xichen on 11-12-17.
//  Copyright 2011年 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>

#define	RELEASE(obj)	[obj release]

#define	SAFE_DELETE(obj)	\
        {		\
            RELEASE(obj);		\
            (obj) = nil;		\
        }

#define	MACRO_RELEASE_2(obj1, obj2)		\
		[obj1 release], [obj2 release];

#define	MACRO_RELEASE_3(obj1, obj2, obj3)		\
		[obj1 release], [obj2 release], [obj3 release];

#define	MACRO_DELETE_2(obj1, obj2)		\
		[obj1 release], obj1 = nil, [obj2 release], obj2 = nil;

#define	MACRO_DELETE_3(obj1, obj2, obj3)		\
		[obj1 release], obj1 = nil, [obj2 release], obj2 = nil, [obj3 release], obj3 = nil;


@interface CCDelete : NSObject 
{
    
}

@end
