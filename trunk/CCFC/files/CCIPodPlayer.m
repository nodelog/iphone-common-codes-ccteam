//
//  CCIPodPlayer.m
//  CCFC
//
//  Created by xichen on 12-1-5.
//  Copyright 2012 ccteam. All rights reserved.
//

#import "CCIPodPlayer.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation CCIPodPlayer

// get iPod player
+ (MPMusicPlayerController *)iPodPlayer
{
	return [MPMusicPlayerController iPodMusicPlayer];
}

// get the current playing item
+ (MPMediaItem *)currentPlayingItem
{
	return [[MPMusicPlayerController iPodMusicPlayer] nowPlayingItem];
}


@end
