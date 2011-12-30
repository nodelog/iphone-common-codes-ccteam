//
//  CCUITextField.h
//  CCFC
//
//  Created by xichen on 11-12-28.
//  Copyright 2011 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UITextField(cc)

// create a common textField
+ (UITextField *)createCommonTextField:(CGRect)rect;

// set the clear button status
- (void)addClearButton;

// add a leftView
- (UILabel *)addLeftview:(CGRect)leftViewRect text:(NSString *)text;

// add a leftView by a label
- (void)addLeftview:(UILabel *)label;

@end
