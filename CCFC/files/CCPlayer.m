//
//  CCPlayer.m
//  CCFC
//
//  Created by xichen on 11-12-16.
//  Copyright 2011年 ccteam. All rights reserved.
//

#import "CCPlayer.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation CCPlayer


// 调用系统播放器播放资源界面
+ (MPMediaPickerController *)showIpodPlayResourceView:(id)delegate
                                            mediaType:(MPMediaType)mediaType
                                               prompt:(NSString *)prompt 
                                 isAllowMultiSelected:(BOOL)isAllowMultiSelected 
                                             animated:(BOOL)animated
{
	MPMediaPickerController *playlistView = 
            [[MPMediaPickerController alloc] initWithMediaTypes:mediaType];
	if(!playlistView)
	{
		return nil;
	}
	
	playlistView.delegate = delegate;
	playlistView.prompt = (NSString *)prompt;
	playlistView.allowsPickingMultipleItems = isAllowMultiSelected;
	
	[delegate presentModalViewController:playlistView animated:animated];
	[playlistView release];
	return playlistView;
}

// not ok
// 调用系统ipod视频播放借口
+ (id)showMovieView:(id)delegate
			 urlStr:(NSString *)urlStr 
			  style:(MPMovieControlStyle)style
		 sourceType:(MPMovieSourceType)type
		   animated:(BOOL)animated
{
	float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
	if(sysVer >= 3.2)
	{
		MPMoviePlayerViewController *moviePlayerController = 
			[[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:urlStr]];
		if(!moviePlayerController)
			return nil;

		moviePlayerController.moviePlayer.movieSourceType = type;
		[delegate presentMoviePlayerViewControllerAnimated:moviePlayerController];
		
		return [moviePlayerController autorelease];
	}
	else
	{
		MPMoviePlayerController *moviePlayerController = 
			[[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:urlStr]];
		if(!moviePlayerController)
			return nil;
		return [moviePlayerController autorelease];
	}
}

// get the iPod player 
+ (MPMusicPlayerController *)getIPodPlayer
{
	return [MPMusicPlayerController iPodMusicPlayer];
}


@end


@implementation MPMoviePlayerViewController(cc)

- (void)play
{
	[self.moviePlayer play];
}

@end

