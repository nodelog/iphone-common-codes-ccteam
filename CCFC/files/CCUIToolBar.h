//
//  CCUIToolbar.h
//  CCFC
//
//  Created by xichen on 12-1-3.
//  Copyright 2012 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIToolbar.h>

@interface UIToolbar(cc)

// create a common toolbar
+ (UIToolbar *)createCommonToolbar:(CGRect)rect items:(NSArray *)buttonItemArr;

@end
