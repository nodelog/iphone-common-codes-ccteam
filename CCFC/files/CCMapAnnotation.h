//
//  CCMapAnnotation.h
//  CCFC
//
//  Created by xichen on 11-12-30.
//  Copyright 2011 ccteam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface CCMapAnnotation : NSObject<MKAnnotation> 
{
	NSString *_title; 
	NSString *_subtitle;
	
	CLLocationCoordinate2D _cord;
}

@property (nonatomic, copy) NSString *title; 
@property (nonatomic, copy) NSString *subtitle; 
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D)loc;
- (void)dealloc;


@end
