//
//  CCPlayer.h
//  CCFC
//
//  Created by xichen on 11-12-16.
//  Copyright 2011年 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CCPlayer : NSObject 
{
    
}

// 调用系统播放器播放资源界面
+ (MPMediaPickerController *)showIpodPlayResourceView:(id)delegate
                                            mediaType:(MPMediaType)mediaType
                                               prompt:(NSString *)prompt 
                                 isAllowMultiSelected:(BOOL)isAllowMultiSelected 
                                             animated:(BOOL)animated;

// 调用系统ipod视频播放借口	// not ok
+ (id)showMovieView:(id)delegate
			 urlStr:(NSString *)urlStr 
			  style:(MPMovieControlStyle)style
		 sourceType:(MPMovieSourceType)type
		   animated:(BOOL)animated;


// get the iPod player 
+ (MPMusicPlayerController *)getIPodPlayer;

@end

@interface MPMoviePlayerViewController(cc)

- (void)play;

@end

