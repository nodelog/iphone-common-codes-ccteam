//
//  CCUITableView.m
//  CCFC
//
//  Created by xichen on 11-12-28.
//  Copyright 2011 ccteam. All rights reserved.
//

#import "CCUITableView.h"
#import "CCUIView.h"

@implementation UITableView(cc)

- (void)scrollToBottom:(BOOL)animated
{
	NSUInteger lastSection = [self numberOfSections] - 1;
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self numberOfRowsInSection:lastSection] 
												inSection:lastSection];
	[self scrollToRowAtIndexPath:indexPath
				atScrollPosition:UITableViewScrollPositionBottom
						animated:animated];
}

// get the vertical scroll indicator
- (UIView *)getVerticalScrollIndicator
{
	id verticalIndicatorImgView = nil; 
	object_getInstanceVariable(self, "_verticalScrollIndicator", (void **)&verticalIndicatorImgView);
	
	return (UIView *)verticalIndicatorImgView;
}

// hide the vertical scroll indicator
- (BOOL)hideVerticalScrollIndicator
{
	UIView *indicatorView = [self getVerticalScrollIndicator];
	indicatorView.hidden = YES;
	return indicatorView != nil;
}

@end
