//
//  RootViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/17/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//
//test
#import "RootViewController.h"
#import "MyScheduleViewController.h"
#import "EventsViewController.h"
#import "GymAndDiningViewController.h"
#import "LibraryHoursViewController.h"
#import "BusScheduleViewController.h"
#import "CouponsViewController.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//These methods are called when their associated button is clicked. They push the associated view to the screen.
- (IBAction)scheduleButton:(id)sender {
    
    MyScheduleViewController *viewController = [[MyScheduleViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)eventsButton:(id)sender {
    
    EventsViewController *viewController = [[EventsViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)hoursButton:(id)sender {
    
    GymAndDiningViewController *viewController = [[GymAndDiningViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
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
    
    CouponsViewController *viewController = [[CouponsViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}
@end
