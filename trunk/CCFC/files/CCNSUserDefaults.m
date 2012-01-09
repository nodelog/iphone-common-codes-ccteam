//
//  CCNSUserDefaults.m
//  CCFC
//
//  Created by xichen on 12-1-11.
//  Copyright 2012 ccteam. All rights reserved.
//

#import "CCNSUserDefaults.h"
#import "CCLog.h"
#import "CCRuntime.h"

@implementation NSUserDefaults(cc)

// print all keys and values of all user defaults
+ (void)printAllKeysValues
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	LOG_ID([defaults objectForKey:@"AppleICUForce24HourTime"]);	// nil
	LOG_ID([defaults objectForKey:@"AppleITunesStoreItemKinds"]);	// nil
	LOG_ID([defaults objectForKey:@"AppleKeyboardsExpanded"]);	// nil
	LOG_ID([defaults objectForKey:@"AppleKeyboards"]);	// nil
	LOG_ID([defaults objectForKey:@"AppleLanguages"]);	// ok
	LOG_ID([defaults objectForKey:@"AppleLocale"]);	// strange that it's not the same to the file
}

@end
