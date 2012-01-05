//
//  CCLyricsParser.m
//  CCFC
//
//  Created by xichen on 12-1-5.
//  Copyright 2012 ccteam. All rights reserved.
//

#import "CCLyricsParser.h"
#import "CCCommon.h"
#import "CCLog.h"

@implementation CCLyricInfo

@synthesize lyricStr = _lyricStr;
@synthesize startTime = _startTime;
@synthesize endTime = _endTime;

- (id)init
{
	COMMON_INIT_BEGIN
	
	COMMON_INIT_END
}

- (void)dealloc
{
	[_lyricStr release];
	[super dealloc];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@ %f %f", _lyricStr, _startTime, _endTime];
}

@end


@interface CCLyricsParser(private)

- (BOOL)isTimeFormat:(NSString *)str;
- (float)getTime:(NSString *)str;

@end


@implementation CCLyricsParser

- (id)initWithLyricsPath:(NSString *)filePath
{
	COMMON_INIT_BEGIN
	
	_filePath = [filePath retain];
	
	NSError *err = nil;
	
	// by default, the lyric file uses GB18030编码
	NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
	_lyrics = [[NSString alloc] initWithContentsOfFile:_filePath  
											  encoding:enc 
												 error:&err];
	
	if(err != nil)
		return nil;
	
	_lyricsArr = [NSMutableArray array];
	
	COMMON_INIT_END
}

- (void)dealloc
{
	
	[_filePath release];
	
	[_lyrics release];
	[_title release];
	[_artist release];
	[_album release];
	 
	[super dealloc];
}

- (BOOL)parse
{
	NSArray *arr = [_lyrics componentsSeparatedByString:@"\r\n"];
	
	for(NSString *temp in arr)
	{
		// analyse the header
		int len = [temp length];
		if([temp hasPrefix:@"[ti:"])
		{
			_title = [[temp substringWithRange:NSMakeRange(4, len - 5)] copy];
			continue;
		}
		
		if([temp hasPrefix:@"[ar:"])
		{
			_artist = [[temp substringWithRange:NSMakeRange(4, len - 5)] copy];
			continue;
		}
		
		if([temp hasPrefix:@"[al:"])
		{
			_album = [[temp substringWithRange:NSMakeRange(4, len - 5)] copy];
			continue;
		}
		
		if(len >= 10)
		{
			NSString *temp1 = [temp substringToIndex:10];
			if(![self isTimeFormat:temp1])
				return FALSE;
			
			float tempTime = [self getTime:temp1];
			
			if(_currLyricInfo == nil)
			{
				_currLyricInfo = [[CCLyricInfo alloc] init];
				_currLyricInfo.startTime = tempTime;
				_currLyricInfo.lyricStr = [temp substringWithRange:NSMakeRange(10, len - 10)];
				LOG_STR(_currLyricInfo.lyricStr);
				[_lyricsArr addObject:_currLyricInfo];
			}
			else
			{
				_currLyricInfo.endTime = tempTime;
				
				
				// alloc a new CCLyricsInfo
				_currLyricInfo = [[CCLyricInfo alloc] init];
				_currLyricInfo.startTime = tempTime;
				_currLyricInfo.lyricStr = [temp substringWithRange:NSMakeRange(10, len - 10)];
				LOG_STR(_currLyricInfo.lyricStr);
				[_lyricsArr addObject:_currLyricInfo];
			}
				
			continue;
		}
		
	}
	
	NSLog(@"arr is %@", arr);
	
	return TRUE;
}

- (NSString *)title
{
	return _title;
}

- (NSString *)artist
{
	return _artist;
}

- (NSString *)album
{
	return _album;
}

- (NSMutableArray *)lyricsArr
{
	return _lyricsArr;
}

// whether the str is like: [00:14.05]
- (BOOL)isTimeFormat:(NSString *)str
{
	if([str length] >= 10)
	{
		if([str characterAtIndex:1] < '0' || [str characterAtIndex:1] > '9')
			return FALSE;
		if([str characterAtIndex:2] < '0' || [str characterAtIndex:2] > '9')
			return FALSE;
		if([str characterAtIndex:4] < '0' || [str characterAtIndex:4] > '9')
			return FALSE;
		if([str characterAtIndex:5] < '0' || [str characterAtIndex:5] > '9')
			return FALSE;
		if([str characterAtIndex:7] < '0' || [str characterAtIndex:7] > '9')
			return FALSE;
		if([str characterAtIndex:8] < '0' || [str characterAtIndex:8] > '9')
			return FALSE;
		return TRUE;
	}
	return FALSE;
}

// get the float time by the str, the str is like [00:14.05]
// the return value's unit is second.
- (float)getTime:(NSString *)str
{
	NSString *minute = [str substringWithRange:NSMakeRange(1, 2)];
	NSString *second = [str substringWithRange:NSMakeRange(4, 2)];
	NSString *timeByTenMilisecond = [str substringWithRange:NSMakeRange(7, 2)];
	
	return [minute intValue] * 60 + 
			[second intValue] + 
		[timeByTenMilisecond intValue] / 100.0f;
}

@end
