//
//  CCUISegmentedControl.h
//  CCFC
//
//  Created by xichen on 11-12-30.
//  Copyright 2011 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UISegmentedControl(cc)

#if CC_ENABLE_PUBLIC_API_EXTEND
// you can set 3 to it.
@property(nonatomic) int segmentedControlStyle;
#endif

@end
