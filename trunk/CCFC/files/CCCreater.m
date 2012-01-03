//
//  CCCreater.m
//  CCFC
//
//  Created by xichen on 12-1-2.
//  Copyright 2012 ccteam. All rights reserved.
//

#import "CCCreater.h"
#import "CCRandom.h"

@implementation CCCreater


// create a random int
+ (int)int
{
	return (int)[CCRandom generateRandomNum];
}

// create a int that is less to the argument value
+ (int)intLessTo:(int)max
{
	return [self int] % max;
}

// create a small int
+ (int)smallint
{
	return [self intLessTo:256];
}

// create a small uint
+ (int)smalluint
{
	return abs([self smallint]);
}

// create a simple array that contains simple NSString * elements, [1, size]
+ (NSArray *)arrayWithSimpleNSString:(int)size
{
	NSMutableArray *arr = [NSMutableArray array];
	int begin = 1;
	while(begin <= size)
		[arr addObject:[NSString stringWithFormat:@"%d", begin++]];
	return arr;
}

// create a simple array that contains size elements, simple NSString * elements, [begin, begin + size)
+ (NSArray *)arrayWithSimpleNSString:(int)begin size:(int)size
{
	NSMutableArray *arr = [NSMutableArray array];
	int end = begin + size;
	while(begin < end)
		[arr addObject:[NSString stringWithFormat:@"%d", begin++]];
	return arr;
}

// create a simple array that contains simple NSString * elements, [bein, end]
+ (NSArray *)arrayWithSimpleNSString:(int)begin end:(int)end
{
	NSMutableArray *arr = [NSMutableArray array];
	while(begin <= end)
		[arr addObject:[NSString stringWithFormat:@"%d", begin++]];
	return arr;
}

// alloc a memory region or buffer that is indicated size
// **you should free the return value outside
+ (char *)allocBuffer:(size_t)size
{
	return (char *)malloc(size);
}

// calloc a memory region or buffer that is indicated size
// **you should free the return value outside
+ (char *)callocBuffer:(size_t)size
{
	return (char *)calloc(size, 1);
}

@end
