//
//  CCIPodPlayer.h
//  CCFC
//
//  Created by xichen on 12-1-5.
//  Copyright 2012 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CCIPodPlayer : NSObject 
{

}

// get iPod player
+ (MPMusicPlayerController *)iPodPlayer;

// get the current playing item
+ (MPMediaItem *)currentPlayingItem;


@end
