//
//  RootViewController.m
//  CCFC
//
//  Created by xichen on 11-12-16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "CCUIView.h"
#import <QuartzCore/QuartzCore.h>
#import "CCCALayer.h"
#import "CCUIWindow.h"
#import "CCUIImage.h"
#import "CCLog.h"
#import "CCUISearchBar.h"
#import "CCTestMacros.h"
#import <MapKit/MKAnnotation.h>

@implementation RootViewController

@synthesize _tableView;

#pragma mark Core Location Delegate
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	LOG_ENTER_FUNC("locationManager didUpdateToLocation");
	_loc = [newLocation coordinate];
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta = 0.1; 
	span.longitudeDelta = 0.1; 
	LOG_DOUBLE(_loc.latitude);
	LOG_DOUBLE(_loc.longitude);
	
	region.span = span;
	region.center = _loc;
	_map.showsUserLocation = YES;
	_map.mapType = MKMapTypeStandard;
	[_map setRegion:region animated:YES];
	[_map regionThatFits:region];
	
	// add annotation
	CCMapAnnotation *mapAnnotation = [[CCMapAnnotation alloc] initWithCoordinate:_loc];
	mapAnnotation.title = @"test title";
	mapAnnotation.subtitle = @"test subtitle";
	[_map addAnnotation:mapAnnotation];
	[mapAnnotation release];
}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
	LOG_ENTER_FUNC("locationManager didFailWithError");
}

#pragma mark UIView delegate

- (void)onTap
{
	LOG_ENTER_FUNC(onTap);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// add a _webView
	/*
	_webView = [[UIWebView alloc] initWithFrame:
				CGRectMake(0, 0, 320, 400)];

	NSString *html = [NSString stringWithFormat:
		@"<html><head><style>div{height:%dpx;}</style></head><body style='margin:0px'><div style='background-color:#FF0000;'></div><div style='background-color:#FFFF00;'></div><div style='background-color:#FF00FF;'></div><div style='background-color:#0000FF;'></div><div style='background-color:#00FFFF;'></div><div style='background-color:#00FF00;'></div></body></html>"
					  , _webView.height];
	
	[_webView loadHTMLString:html baseURL:nil];
	
	UIScrollView *scrollView = [_webView.subviews objectAtIndex:0]; 
	if (scrollView && [scrollView isKindOfClass:[UIScrollView class]]) 
	{
		scrollView.pagingEnabled = YES;	// not known
	}
	
	[self.view addSubview:_webView];
	[_webView release];
	*/
	
	// add a searchBar
	//_searchBar = [UISearchBar createCommonSearchBar:
//							CGRectMake(20, 120, 200, 40)];
//	[self.view addSubview:_searchBar];
	//_searchBar.keyboardAppearance = UIKeyboardAppearanceAlert;	// compile error
	// ok
	//[_searchBar setTransparent];
	
	
	
	/*
	// commonFlip	// not ok
//	[_tableView commonFlip];
	
	// not ok
    /*
	CATransition *animation = [CATransition animation];
	[animation setDelegate:self];
	// [animation setType:@"oglFlip"];
	[animation setType:@"cube"];
	//[animation setType:kCATransitionPush];
	[animation setSubtype:@"fromRight"];
	[animation setDuration:1.0f];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[self.view.layer addAnimation:animation forKey:@"cube"];
     */
	 
	
#pragma mark CCCALayer
	// test addTestLayer	// ok
	/*
	[CALayer addTestLayer:_tableView
				 withRect:_tableView.frame];
	 */
	

	// test backgroundColor	// ok
//	_tableView.layer.backgroundColor = [[UIColor orangeColor] CGColor];
	
	// create a common layer	// ok
//	CALayer *layer1 = [CALayer createCommonLayer:CGRectMake(20, 50, 40, 40)
//										   color:[UIColor redColor]];
//	layer1.shadowOffset = CGSizeMake(0, 4);
//	layer1.shadowRadius = 7.0;
//	layer1.shadowColor = [UIColor blackColor].CGColor;
//	layer1.shadowOpacity = 0.7;
//	[_tableView.layer addSublayer:layer1];
	
#pragma mark CCUIWindow
	// test CCUIWindow
	// ok
//	UIWindow *window = [UIWindow addImgToStatusBar:CREATE_UIIMAGE(@"3@2x.png")
//					   withRect:CGRectMake(100,0,30,20)];
//	[window makeKeyAndVisible];
    
    
#pragma mark CCUIView
	// tap recognizer
	// ok
	//[_tableView addTapRecognizer:self action:@selector(onTap)];
	
	// enableViewBelow	// ok
	//[UIView enableViewBelow:_searchBar viewBelow:_tableView];
	
	// test addLayer	// ok
//	[_tableView addLayer:CGRectMake(100, 200, 100, 80)
//				   color:[UIColor blueColor]];
	
#pragma mark Google Map
	// test MKMapView  CLLocationManager	// ok
#if CC_ENABLE_TEST_GOOGLE_MAP
	_map = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
	_map.showsUserLocation = YES;
	[self.view addSubview:_map];
	[_map release];
	
	_locManager = [[CLLocationManager alloc] init];
	_locManager.delegate = self;
	_locManager.desiredAccuracy = kCLLocationAccuracyBest;
	_locManager.distanceFilter = 40;
	[_locManager startUpdatingLocation];
#endif
	
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
	*/
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
	[_locManager release];
    [super dealloc];
}

@end
