//
//  RootViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/17/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "RootViewController.h"
#import "MyScheduleViewController.h"
#import "EventsViewController.h"
#import "LibraryHoursViewController.h"
#import "BusScheduleViewController.h"
#import "CouponListViewController.h"
#import "GymViewController.h"
#import "DiningViewController.h"
#import "GPAViewController.h"
#import "TimeManagementViewController.h"
#import "StressReliefViewController.h"
#import "PicturesOfPAndKViewController.h"
#import "TestudoOfferingViewController.h"
#import "QuoteViewController.h"
#import "AboutViewController.h"
#import "EventActualViewController.h"
#import "StressHelpViewController.h"


@interface RootViewController ()
@end

@implementation RootViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView.contentSize = self.myView.bounds.size;
    [self.scrollView addSubview:self.myView];
    [self.scrollView flashScrollIndicators];
    self.title = @"UMD Finals App";
    
    //UIImage *img = [UIImage imageNamed:@"icon.png"];
    //UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    //[[self navigationItem] setTitleView:imageView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)scheduleButton:(id)sender {
    
    MyScheduleViewController *viewController = [[MyScheduleViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)eventsButton:(id)sender {
    
    EventActualViewController *viewController = [[EventActualViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)hoursButton:(id)sender {
    
    GymViewController *gym = [[GymViewController alloc] init];
    DiningViewController *dining = [[DiningViewController alloc] init];
    LibraryHoursViewController *library = [[LibraryHoursViewController alloc] init];
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController setViewControllers:[NSArray arrayWithObjects: gym, dining, library, nil]];
    [[self navigationController] pushViewController:tabController animated:YES];
}

- (IBAction)librariesButton:(id)sender {
    
    LibraryHoursViewController *viewController = [[LibraryHoursViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)busScheduleButton:(id)sender {
    
    BusScheduleViewController *viewController = [[BusScheduleViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)couponsButton:(id)sender {
    
    CouponListViewController *viewController = [[CouponListViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)timeButton:(id)sender {
    
    TimeManagementViewController *viewController = [[TimeManagementViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)gpaButton:(id)sender {
    
    GPAViewController *viewController = [[GPAViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)stressReliefButton:(id)sender {
    
    StressReliefViewController *stress = [[StressReliefViewController alloc] init];
    PicturesOfPAndKViewController *pics = [[PicturesOfPAndKViewController alloc] init];
    StressHelpViewController *help = [[StressHelpViewController alloc] init];
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController setViewControllers:[NSArray arrayWithObjects: stress, help, pics, nil]];
    [[self navigationController] pushViewController:tabController animated:YES];
}

- (IBAction)testudoButton:(id)sender {
    
    TestudoOfferingViewController *viewController = [[TestudoOfferingViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)quoteButton:(id)sender {
    
    QuoteViewController *viewController = [[QuoteViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)aboutButton:(id)sender {
    
    AboutViewController *viewController = [[AboutViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

@end
