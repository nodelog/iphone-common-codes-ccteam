//
//  CCUITextField.m
//  CCFC
//
//  Created by xichen on 11-12-28.
//  Copyright 2011 ccteam. All rights reserved.
//

#import "CCUITextField.h"


@implementation UITextField(cc)

// create a common textField
+ (UITextField *)createCommonTextField:(CGRect)rect
{
	UITextField *textField = [[UITextField alloc] initWithFrame:rect];
	textField.backgroundColor = [UIColor whiteColor];
	return [textField autorelease];
}

// set the clear button status
- (void)addClearButton
{
	[self setClearButtonMode:UITextFieldViewModeAlways];
}

// add a leftView
- (UILabel *)addLeftview:(CGRect)leftViewRect text:(NSString *)text
{
	UILabel *label = [[UILabel alloc] initWithFrame:leftViewRect];
	label.text = text;
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor grayColor];
	self.leftViewMode = UITextFieldViewModeAlways;
	self.leftView = label;
	self.borderStyle = UITextBorderStyleRoundedRect;
	
	[label release];
	return label;
}

// add a leftView by a label
- (void)addLeftview:(UILabel *)label
{
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor grayColor];
	
	self.leftViewMode = UITextFieldViewModeAlways;
	self.leftView = label;
	self.borderStyle = UITextBorderStyleRoundedRect;
}

@end
