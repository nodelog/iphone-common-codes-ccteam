//
//  CCUITableView.h
//  CCFC
//
//  Created by xichen on 11-12-28.
//  Copyright 2011 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCommon.h"

@interface UITableView(cc)

- (void)scrollToBottom:(BOOL)animated;

// get the vertical scroll indicator
- (UIView *)getVerticalScrollIndicator;

// hide the vertical scroll indicator
- (BOOL)hideVerticalScrollIndicator;

#if CC_ENABLE_PRIVATE_API && CC_COMPILE_PRIVATE_CLASS
- (NSArray *)indexPathsForSelectedRows;		// the array of selected rows
#endif

@end
