//
//  CCMPMediaItem.h
//  CCFC
//
//  Created by xichen on 12-1-5.
//  Copyright 2012 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MPMediaItem(cc)

- (NSString *)getTitle;	// not ok

- (NSString *)getArtist; // not ok

- (NSString *)getAlbumTitle; // not ok

@end
