//
//  MainViewController.m
//  DemoProject
//
//  Created by Edward Patel on 2010-02-28.
//  Copyright Memention AB 2010. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

#import "DemoTransition.h"

@implementation MainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 }
 */


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
    
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo {    
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] 
										  initWithNibName:@"FlipsideView" 
										  bundle:nil];
	controller.delegate = self;
	
	DemoTransition *transition = [[[DemoTransition alloc] init] autorelease];
	
	EPGLTransitionView *glview = [[[EPGLTransitionView alloc] 
								   initWithWindow:self.view
								   delegate:transition] autorelease];

#ifdef ENABLE_PHASE_IN

	// Get texture for the "next" view
	[glview prepareTextureTo:controller.view];

	// If you are using an "IN" animation for the "next" view set appropriate 
	// clear color (ie no alpha) 
	[glview setClearColorRed:0.3
					   green:0.3
						blue:0.3
					   alpha:1.0];
#endif
	
	[glview startTransition];
		
	[self presentModalViewController:controller animated:NO];


	[controller release];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end