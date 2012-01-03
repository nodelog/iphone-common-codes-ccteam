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
#import "CCNSTimer.h"
#import <objc/runtime.h>
#import "CCUIToolBar.h"

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

#pragma mark UITableView delegate
- (void)onGetViews:(id)timer
{
	LOG_ARR(_tableView.subviews);
	LOG_ID([_tableView recursiveDescription]);
}

#pragma mark UIToolbar delegate
- (void)onBarbuttonItemAdd:(id)sender
{
	LOG_HERE;
}

- (void)onBarbuttonItemSave:(id)sender
{
	LOG_HERE;
}

- (void)onBarbuttonItemEdit:(id)sender
{
	LOG_HERE;
}

#pragma mark view cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	_tableView.showsVerticalScrollIndicator = YES;
	_tableView.delegate = self;
	_tableView.dataSource = self;
	[_tableView reloadData];
	
#pragma mark UIToolbar
	// test add UIToolbar	// ok
//	UIBarButtonItem *item1 = [[UIBarButtonItem alloc] 
//							 initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
//							 target:self
//							 action:@selector(onBarbuttonItemAdd:)];
//	UIBarButtonItem *item2 = [[UIBarButtonItem alloc] 
//							 initWithBarButtonSystemItem:UIBarButtonSystemItemSave
//							 target:self
//							 action:@selector(onBarbuttonItemSave:)];
//	UIBarButtonItem *item3 = [[UIBarButtonItem alloc] 
//							 initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
//							 target:self
//							 action:@selector(onBarbuttonItemEdit:)];
//	NSMutableArray *arr = [NSMutableArray arrayWithObjects:item1, item2, item3, nil];
//	[item1 release];
//	[item2 release];
//	[item3 release];	
//	UIToolbar *toolbar = [UIToolbar createTestToolbar:CGRectMake(20, 30, 200, 40)
//												items:arr];
//	[self.view addSubview:toolbar];
	
	
#pragma mark objc runtime
	// test objc_msgSend	// ok
//	int n = (int)objc_msgSend(_tableView, @selector(retainCount));
//	LOG_INT(n);
	
	// test object_getInstanceVariable	// ok
//	id verticalIndicatorImgView; 
//	object_getInstanceVariable(_tableView, "_verticalScrollIndicator", (void **)&verticalIndicatorImgView);
//	LOG_ID(verticalIndicatorImgView);
	//[verticalIndicatorImgView removeFromSuperview];
	
	
	// [_tableView addSubview:[UIView createView:CGRectZero]];
#pragma mark UITableView
	// get the indicator view and hide it
	//[NSTimer createCommonRepeatTimer:self sel:@selector(onGetViews:) timeInterval:1.0f];
	// LOG_ARR(_tableView.subviews);
	// LOG_ID([_tableView recursiveDescription]);
	// UIView *view = [_tableView getSubviewByIndex:[_tableView.subviews count] - 1];
	// LOG_ID(view);
	// view.hidden = YES;
	
	// hideVerticalScrollIndicator ok
//	[_tableView hideVerticalScrollIndicator];
	
	
	// add a _webView
	// show the _webView	// ok
//	_webView = [[UIWebView alloc] initWithFrame:
//				CGRectMake(0, 0, 320, 400)];
//
//	NSString *html = [NSString stringWithFormat:
//		@"<html><head>xichen welcome</head><body>I am in ccteam</body></html>"];
//	
//	[_webView loadHTMLString:html baseURL:nil];
//	// not ok
////	[_webView stringByEvaluatingJavaScriptFromString:
////		@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '150%'"];
////	
//	[self.view addSubview:_webView];
//	[_webView release];
	
	// UIWebView pagingEnabled
//	UIScrollView *scrollView = [_webView.subviews objectAtIndex:0]; 
//	if (scrollView && [scrollView isKindOfClass:[UIScrollView class]]) 
//	{
//		scrollView.pagingEnabled = YES;	// not known
//	}
	
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
    return 10;
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
	cell.textLabel.text = @"1";
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
