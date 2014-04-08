//
//  PageOneViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/17/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "PageOneViewController.h"
#import "MyScheduleViewController.h"
#import "EventActualViewController.h"
#import "GymAndDiningViewController.h"
#import "LibraryHoursViewController.h"
#import "BusScheduleViewController.h"
#import "CouponsViewController.h"
#import "CouponListViewController.h"

@interface PageOneViewController ()

@end

@implementation PageOneViewController

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
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)eventButton:(id)sender {
    
    EventActualViewController *viewController = [[EventActualViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)gymDiningButton:(id)sender {
    
    GymAndDiningViewController *viewController = [[GymAndDiningViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)libraryButton:(id)sender {
    
    LibraryHoursViewController *viewController = [[LibraryHoursViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)busButton:(id)sender {
    
    BusScheduleViewController *viewController = [[BusScheduleViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (IBAction)couponButton:(id)sender {
    
    CouponListViewController *viewController = [[CouponListViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}
@end
