//
//  CCUIBarButtonItem.h
//  CCFC
//
//  Created by xichen on 11-12-30.
//  Copyright 2011 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIBarButtonItem(cc)

#if CC_ENABLE_PUBLIC_API_EXTEND
// systemItem argument can be passed with: 100 ~ 110
- (id)initWithBarButtonSystemItem:(int)systemItem target:(id)target action:(SEL)action;
#endif

@end
