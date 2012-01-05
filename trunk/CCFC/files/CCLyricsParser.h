//
//  CCLyricsParser.h
//  CCFC
//
//  Created by xichen on 12-1-5.
//  Copyright 2012 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCLyricInfo : NSObject
{
	NSString		*_lyricStr;
	float			_startTime;
	float			_endTime;
}

@property(nonatomic, copy)		NSString		*lyricStr;
@property(nonatomic, assign)	float			startTime;
@property(nonatomic, assign)	float			endTime;

- (NSString *)description;

@end


@interface CCLyricsParser : NSObject 
{
	NSString			*_filePath;
	
	NSString			*_lyrics;
	NSString			*_title;
	NSString			*_artist;
	NSString			*_album;
	NSMutableArray		*_lyricsArr;
	
	CCLyricInfo			*_currLyricInfo;
}

- (id)initWithLyricsPath:(NSString *)filePath;
- (void)dealloc;

- (BOOL)parse;

- (NSString *)title;
- (NSString *)artist;
- (NSString *)album;
- (NSMutableArray *)lyricsArr;

@end
