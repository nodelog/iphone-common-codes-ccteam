//
//  CCSound.m
//  CCFC
//
//  Created by xichen on 12-1-3.
//  Copyright 2012 ccteam. All rights reserved.
//

#import "CCSound.h"
#import <MediaPlayer/MediaPlayer.h>


@implementation CCSound

// add a volume changed observer event
// the selector will be only called when the ipod player is playing and the current application is active
+ (void)addVolumeChangeObserver:(id)observer sel:(SEL)sel
{
	MPMusicPlayerController *musicPlayer = [MPMusicPlayerController iPodMusicPlayer];
    [musicPlayer beginGeneratingPlaybackNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:observer 
                                             selector:sel 
                                                 name:MPMusicPlayerControllerVolumeDidChangeNotification 
                                               object:musicPlayer];
}

@end
