//
//  CCUIView.m
//  CCFC
//
//  Created by xichen on 11-12-17.
//  Copyright 2011年 ccteam. All rights reserved.
//

#import "CCUIView.h"
#import <QuartzCore/QuartzCore.h>

@interface UIView(ccPrivate)

- (id)text;
- (id)font;

@end


@implementation UIView(cc) 

@dynamic    x, y, width, height;

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x
{
    CGRect rect = self.frame;
	if(x != rect.origin.x)
    {
        rect.origin.x = x;			
        self.frame = rect;
    }
}

- (void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
	if(y != rect.origin.y)
    {
        rect.origin.y = y;			
        self.frame = rect;
    }
}

- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
	if(width != rect.size.width)
    {
        rect.size.width = width;			
        self.frame = rect;
    }
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
	if(height != rect.size.height)
    {
        rect.size.height = height;			
        self.frame = rect;
    }
}



// 创建UILabel, 文本居中显示
+ (UILabel *)createLabel:(const CGRect *)rect withTitle:(NSString *)title
{
	UILabel *label = [[UILabel alloc] initWithFrame:
            CGRectMake(rect->origin.x, rect->origin.y, rect->size.width, rect->size.height)];
    
	label.text = title;
	label.textColor = [UIColor blackColor];
	label.backgroundColor = [UIColor whiteColor];
	label.textAlignment = UITextAlignmentCenter;
    
	return [label autorelease];
}

// 创建UIButton, 文本居中显示
+ (UIButton *)createButton:(const CGRect *)rect withTitle:(NSString *)title
{
	UIButton *btn = [[UIButton alloc] initWithFrame:
            CGRectMake(rect->origin.x, rect->origin.y, rect->size.width, rect->size.height)];
    
	[btn setTitle:title];
	[btn setTitleColor:[UIColor blackColor]];
	btn.backgroundColor = [UIColor whiteColor];
	btn.titleLabel.textAlignment = UITextAlignmentCenter;
	
	return [btn autorelease];
}


// 移除所有子view
- (void)removeAllSubviews
{
	for(UIView *temp in self.subviews)
		[temp removeFromSuperview];
}

// 隐藏所有子view
- (void)hideAllSubViews
{
	for(UIView *temp in self.subviews)
		temp.hidden = TRUE;
}

// 创建一个指定区域大小的view
+ (UIView *)createView:(CGRect)rect
{
	UIView *view = UI_ALLOC_CREATE(UIView, 
								   rect.origin.x, rect.origin.y, 
								   rect.size.width, rect.size.height);
	return [view autorelease];
}

// 创建一个和指定view相同大小的view
+ (UIView *)createViewByView:(UIView *)view
{
	UIView *temp = UI_ALLOC_CREATE(UIView, 
								   view.frame.origin.x, view.frame.origin.y, 
								   view.frame.size.width, view.frame.size.height);
	return [temp autorelease];
}

// 创建一个指定区域大小的透明view
+ (UIView *)createTransparentView:(CGRect)rect
{
	UIView *view = [self createView:rect];
	if(!view)
	{
		return nil;
	}
	view.backgroundColor = [UIColor clearColor];
	
	return view;
}

// 创建一个和指定view相同大小的透明view
+ (UIView *)createTransparentViewByView:(UIView *)view
{
	UIView *temp = [self createViewByView:view];
	if(!temp)
	{
		return nil;
	}
	temp.backgroundColor = [UIColor clearColor];
	
	return temp;
}

// 显示view
- (void)showView
{
	self.hidden = FALSE;
}

// 隐藏view
- (void)hideView
{
	self.hidden = TRUE;
}

// 获取在指定视图中触摸的位置坐标
- (CGPoint)getTouchPoint:(UIEvent *)event
{
	UITouch *touch = [[event allTouches] anyObject];
	return [touch locationInView:self];
}

// 获取视图的子视图(包括子视图的子视图)中属于指定类型或其子类视图的视图指针数组
- (void)getSubViewIsKindOf:(NSString *)viewStr array:(NSMutableArray *)outArray
{
	if([self isKindOfClass:NSClassFromString(viewStr)])
		[outArray addObject:self];
	for(UIView *view in self.subviews)
	{
		[view getSubViewIsKindOf:viewStr array:outArray];
	}
}

- (void)getSubViewIsKindOf:(NSString *)viewStr 
					   array:(NSMutableArray *)outArray 
					 maxSize:(int)maxSize
{
	if([self isMemberOfClass:NSClassFromString(viewStr)])
		[outArray addObject:self];
	if([outArray count] == maxSize)
		return;
	for(UIView *view in self.subviews)
	{
		[view getSubViewIsKindOf:viewStr array:outArray];
	}
}

// 获取视图的子视图(包括子视图的子视图)中属于指定类型或其子类视图的视图指针数组
- (void)getSubViewIsMemberOf:(NSString *)viewStr array:(NSMutableArray *)outArray
{
	if([self isMemberOfClass:NSClassFromString(viewStr)])
		[outArray addObject:self];
	for(UIView *view in self.subviews)
	{
		[view getSubViewIsMemberOf:viewStr array:outArray];
	}
}

- (void)getSubViewIsMemberOf:(NSString *)viewStr 
					   array:(NSMutableArray *)outArray 
					 maxSize:(int)maxSize
{
	if([self isMemberOfClass:NSClassFromString(viewStr)])
		[outArray addObject:self];
	if([outArray count] == maxSize)
		return;
	for(UIView *view in self.subviews)
	{
		[view getSubViewIsMemberOf:viewStr array:outArray];
	}
}

// not ok
- (void)commonFlip
{
	[UIView beginAnimations:@"ccAnimation" context:nil]; 
	[UIView setAnimationDuration:1.25]; 
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; 	
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
	[UIView commitAnimations];
}

// get the row count of a view's text	// not ok
- (int)getTextRows
{
	if(![self respondsToSelector:@selector(text)] 
	   || ![self respondsToSelector:@selector(font)])
		return -1;
	
	CGSize size = [[self text] sizeWithFont:[self font]
						constrainedToSize:CGSizeMake([self width], UINT_MAX)
							lineBreakMode:UILineBreakModeWordWrap]; 
	CGSize tempSize = [[self text] sizeWithFont:[self font]];
	
	return (int)ceil(size.height / tempSize.height);
	
}

// 将view视图保存到照片库中
- (void)saveViewToPhotosAlbum
{
	UIImage *viewImg = [self returnUIImageOfView];
	UIImageWriteToSavedPhotosAlbum(viewImg, nil, nil, nil);
}

// returns the UIImage of the view
- (UIImage *)returnUIImageOfView
{
	UIGraphicsBeginImageContext(self.layer.bounds.size);
	[self.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImg = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return viewImg;
}

- (UITapGestureRecognizer *)addTapRecognizer:(id)target action:(SEL)sel
{
	self.userInteractionEnabled=YES;
	UITapGestureRecognizer *tapRecog = 
			[[UITapGestureRecognizer alloc] 
				initWithTarget:target action:sel];
	if(tapRecog == nil)
		return nil;
	
	[self addGestureRecognizer:tapRecog];
	[tapRecog release];
	
	return tapRecog;
}

// set the view to rounded corner
- (void)setRoundedCorner:(CGFloat)radius
{
	self.layer.cornerRadius = radius;
	self.layer.masksToBounds = YES;
}

// set the view's borderColor and borderWidth
- (void)setBorderColor:(UIColor *)color withBorderWidth:(CGFloat)width
{
	self.layer.borderColor = color.CGColor;
	self.layer.borderWidth = width;
}

+ (void)enableViewBelow:(UIView *)foreView viewBelow:(UIView *)viewBelow
{
	foreView.exclusiveTouch = YES;
	foreView.userInteractionEnabled = NO;
	viewBelow.exclusiveTouch = NO;
	viewBelow.userInteractionEnabled = YES;
}

// set the view to be center of another view
- (void)setCenterOf:(UIView *)anotherView
{
	self.center = CGPointMake(anotherView.bounds.size.width / 2, 
							  anotherView.bounds.size.height / 2);
}

// move the view upwards
- (void)moveUpwards:(CGFloat)offset
{
	CGRect rect = self.frame;
	rect.origin.y -= offset;
	self.frame = rect;
}

// move the view downwards
- (void)moveDownwards:(CGFloat)offset
{
	CGRect rect = self.frame;
	rect.origin.y += offset;
	self.frame = rect;
}

// move the view leftwards
- (void)moveLeftwards:(CGFloat)offset
{
	CGRect rect = self.frame;
	rect.origin.x -= offset;
	self.frame = rect;
}

// move the view rightwards
- (void)moveRightwards:(CGFloat)offset
{
	CGRect rect = self.frame;
	rect.origin.x += offset;
	self.frame = rect;
}

// get the UIView that is at the index of subviews
- (UIView *)getSubviewByIndex:(int)index
{
	return [self.subviews objectAtIndex:index];
}

// get the first subview
- (UIView *)getFirstSubview
{
	if([self.subviews count])
		return [self.subviews objectAtIndex:0];
	return nil;
}

// get the last subview
- (UIView *)getLastSubview
{
	if([self.subviews count])
		return [self.subviews objectAtIndex:[self.subviews count] - 1];
	return nil;
}

// add a layer by rect and color
- (CALayer *)addLayer:(CGRect)rect color:(UIColor *)color
{
	CALayer *layer = [CALayer layer];
	layer.backgroundColor = color.CGColor;
	layer.frame = rect;
	[self.layer addSublayer:layer];
	return layer;
}

// get the same level views arr that are behind self
- (NSArray *)getBackwardsViews
{
	UIView *superView = self.superview;
	NSArray *arr = superView.subviews;
	NSMutableArray *retArr = [NSMutableArray array];
	
	BOOL canAdd = FALSE;
	for(UIView *view in arr)
	{
		if(canAdd)
			[retArr addObject:view];
		if(self == view)
			canAdd = TRUE;
	}
	return retArr;
}

// get the same level views arr that are in front of self
- (NSArray *)getForewardsViews
{
	UIView *superView = self.superview;
	NSArray *arr = superView.subviews;
	NSMutableArray *retArr = [NSMutableArray array];
	
	BOOL canAdd = TRUE;
	for(UIView *view in arr)
	{
		if(self == view)
			canAdd = FALSE;
		if(canAdd)
			[retArr addObject:view];
	}
	return retArr;
}

// returns whether the touch is inside the view or not
- (BOOL)isTouchInsideView:(UITouch *)touch
{
	return [self pointInside:[touch locationInView:self] withEvent:nil];
}

// returns whether the touch is outside the view or not
- (BOOL)isTouchOutsideView:(UITouch *)touch
{
	return ![self pointInside:[touch locationInView:self] withEvent:nil];
}

// returns whether the touch hit the view
- (BOOL)hitView:(UIView *)view touch:(UITouch *)touch
{
	return ([self hitTest:[touch locationInView:self] withEvent:nil] == view);
}

// returns whether the touch hit the self
- (BOOL)hitSelf:(UITouch *)touch
{
	return ([self hitTest:[touch locationInView:self] withEvent:nil] == self);
}

// returns whether the touch hit the view's subview
- (BOOL)hitSubviews:(UITouch *)touch
{
	UIView *view = [self hitTest:[touch locationInView:self] withEvent:nil];
	return (view != nil && view != self);
}

// remove subviews that is member of viewStr class
- (void)removeSubViewIsMemberOf:(NSString *)viewStr
{
	for(UIView *view in self.subviews)
	{
		if([view isMemberOfClass:NSClassFromString(viewStr)])
			[view removeFromSuperview];
	}
}

// remove subviews that is kind of viewStr class
- (void)removeSubViewIsKindOf:(NSString *)viewStr
{
	for(UIView *view in self.subviews)
	{
		if([view isKindOfClass:NSClassFromString(viewStr)])
			[view removeFromSuperview];
	}
}

// recursively remove subviews that is member of viewStr class
- (void)removeRecursiveSubViewIsMemberOf:(NSString *)viewStr
{
	for(UIView *view in self.subviews)
	{
		if([view isMemberOfClass:NSClassFromString(viewStr)])
		{
			[view removeFromSuperview];
			continue;
		}
		[view removeRecursiveSubViewIsMemberOf:viewStr];
	}
}

// recursively remove subviews that is kind of viewStr class
- (void)removeRecursiveSubViewIsKindOf:(NSString *)viewStr
{
	for(UIView *view in self.subviews)
	{
		if([view isKindOfClass:NSClassFromString(viewStr)])
		{
			[view removeFromSuperview];
			continue;
		}
		[view removeRecursiveSubViewIsKindOf:viewStr];
	}
}



@end
