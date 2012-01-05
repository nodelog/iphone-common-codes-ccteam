//
//  CCMPMediaItem.m
//  CCFC
//
//  Created by xichen on 12-1-5.
//  Copyright 2012 ccteam. All rights reserved.
//

#import "CCMPMediaItem.h"


@implementation MPMediaItem(cc)

- (NSString *)getTitle	// not ok
{
	return [self valueForKey:MPMediaItemPropertyTitle];
}

- (NSString *)getArtist	// not ok
{
	return [self valueForKey:MPMediaItemPropertyArtist];
}

- (NSString *)getAlbumTitle	// not ok
{
	return [self valueForKey:MPMediaItemPropertyAlbumTitle];
}


@end
