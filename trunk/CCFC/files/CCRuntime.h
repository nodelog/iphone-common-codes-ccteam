//
//  CCRuntime.h
//  CCFC
//
//  Created by xichen on 11-12-30.
//  Copyright 2011 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface CCRuntime : NSObject 
{

}

// get the var of the obj
+ (Ivar)getObjVar:(id)obj varname:(const char *)varname ret:(void **)ret;

@end
