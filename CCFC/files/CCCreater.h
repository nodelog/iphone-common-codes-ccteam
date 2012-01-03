//
//  CCCreater.h
//  CCFC
//
//  Created by xichen on 12-1-2.
//  Copyright 2012 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>

#define	MACRO_NEW_BUFFER(type, sizeOfType)		new type[sizeOfType]
#define	MACRO_MALLOC_BUFFER(type, sizeOfType)	(type)malloc(sizeOfType * sizeof(type))

@interface CCCreater : NSObject 
{

}

// create a random int
+ (int)int;

// create a int that is less to the argument value
+ (int)intLessTo:(int)max;

// create a small int
+ (int)smallint;

// create a small uint
+ (int)smalluint;


// create a simple array that contains simple NSString * elements
+ (NSArray *)arrayWithSimpleNSString:(int)size;

// create a simple array that contains size elements, simple NSString * elements
+ (NSArray *)arrayWithSimpleNSString:(int)begin size:(int)size;

// create a simple array that contains simple NSString * elements, [bein, end]
+ (NSArray *)arrayWithSimpleNSString:(int)begin end:(int)end;

// alloc a memory region or buffer that is indicated size
// **you should free the return value outside
+ (char *)allocBuffer:(size_t)size;

// calloc a memory region or buffer that is indicated size
// **you should free the return value outside
+ (char *)callocBuffer:(size_t)size;


@end
