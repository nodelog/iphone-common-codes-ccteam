//
//  CCFCAppDelegate.h
//  CCFC
//
//  Created by xichen on 11-12-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCAudio.h"
#import <MediaPlayer/MediaPlayer.h>

@interface CCFCAppDelegate : NSObject <UIApplicationDelegate> 
{
	NSURLConnection			*_conn;
	NSURLConnection			*_conn1;
	
	CCLocalAudioPlayer		*_player;
	CCRecorder				*_recorder;
	
	UIButton				*btn;
	UIPopoverController		*_popoverController;
	
	MPMoviePlayerController *_mp;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
