//
//  CCNSUserDefaults.h
//  CCFC
//
//  Created by xichen on 12-1-11.
//  Copyright 2012 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCConfig.h"

@interface NSUserDefaults(cc)

#if CC_ENABLE_PUBLIC_API_COMMENTS
// if the device is JB(jailbroken), the returns value comes from file 
// /var/mobile/Library/Preferences/.GlobalPreferences.plist
// example(iphone4 ios4.3.3):
/*
 <?xml version="1.0" encoding="UTF-8"?>
 <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
 <dict>
 <key>AppleICUForce24HourTime</key>
 <true/>
 <key>AppleITunesStoreItemKinds</key>
 <array>
 <string>document</string>
 <string>software-update</string>
 <string>booklet</string>
 <string>itunes-u</string>
 <string>artist</string>
 <string>eBook</string>
 <string>podcast-episode</string>
 <string>podcast</string>
 <string>software</string>
 </array>
 <key>AppleKeyboards</key>
 <array>
 <string>zh_Hans-Pinyin@sw=Pinyin;hw=US</string>
 <string>en_US@hw=US;sw=QWERTY</string>
 <string>iflyinput</string>
 <string>zh_Hans-HWR@sw=HWR</string>
 </array>
 <key>AppleKeyboardsExpanded</key>
 <integer>1</integer>
 <key>AppleLanguages</key>
 <array>
 <string>zh-Hans</string>
 <string>en</string>
 <string>fr</string>
 <string>de</string>
 <string>ja</string>
 <string>nl</string>
 <string>it</string>
 <string>es</string>
 <string>pt</string>
 <string>pt-PT</string>
 <string>da</string>
 <string>fi</string>
 <string>nb</string>
 <string>sv</string>
 <string>ko</string>
 <string>zh-Hant</string>
 <string>ru</string>
 <string>pl</string>
 <string>tr</string>
 <string>uk</string>
 <string>ar</string>
 <string>hr</string>
 <string>cs</string>
 <string>el</string>
 <string>he</string>
 <string>ro</string>
 <string>sk</string>
 <string>th</string>
 <string>id</string>
 <string>ms</string>
 <string>en-GB</string>
 <string>ca</string>
 <string>hu</string>
 <string>vi</string>
 </array>
 <key>AppleLocale</key>
 <string>zh_CN</string>
 </dict>
 </plist> 
*/

+ (NSUserDefaults *)standardUserDefaults;

#endif

// print all keys and values of all user defaults
+ (void)printAllKeysValues;


@end
