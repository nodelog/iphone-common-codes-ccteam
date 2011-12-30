//
//  RootViewController.h
//  CCFC
//
//  Created by xichen on 11-12-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "CCMapAnnotation.h"

@interface RootViewController : UITableViewController 
							<CLLocationManagerDelegate, MKMapViewDelegate,
							UITableViewDelegate, UITableViewDataSource>
{
	IBOutlet	UITableView			*_tableView;
	
	UIWebView						*_webView;
	UISearchBar						*_searchBar;
	
	MKMapView						*_map;
	CLLocationManager				*_locManager;
	CLLocationCoordinate2D			_loc;
}

@property(nonatomic, retain)	IBOutlet UITableView			*_tableView;

@end
