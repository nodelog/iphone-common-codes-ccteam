//
//  CCFormat.h
//  CCFC
//
//  Created by xichen on 11-12-31.
//  Copyright 2011 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>

#define	MACRO_INT_FORMAT		%d
#define	MACRO_INT_FORMAT1		%i
#define	MACRO_OBJ_FORMAT		%@
#define	MACRO_UINT_FORMAT		%u
#define	MACRO_DBL_FORMAT		%f
#define	MACRO_DBL_SCIENTIFIC_FORMAT		%e
#define	MACRO_DBL_SHORT			%g
#define	MACRO_HEX_FORMAT		%x
#define	MACRO_OCT_FORMAT		%o
#define	MACRO_SIZE_T_FORMAT		%zu
#define	MACRO_POINTER_FORMAT	$p
#define	MACRO_CSTR_FORMAT		%s
#define	MACRO_CSTR_UNICHAR_FORMAT		%S
#define MACRO_PASCAL			%.*s
#define	MACRO_CHAR				%c
#define	MACRO_UNICHAR			%C
#define	MACRO_LONGLONG			%lld
#define	MACRO_ULONGLONG			%llu
#define	MACRO_LONG_DOUBLE		%Lf


@interface CCFormat : NSObject 
{

}

@end
