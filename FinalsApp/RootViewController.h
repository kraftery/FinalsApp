//
//  RootViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/17/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *myView;

- (IBAction)scheduleButton:(id)sender;
- (IBAction)eventsButton:(id)sender;
- (IBAction)hoursButton:(id)sender;
- (IBAction)librariesButton:(id)sender;
- (IBAction)busScheduleButton:(id)sender;
- (IBAction)couponsButton:(id)sender;
- (IBAction)timeButton:(id)sender;
- (IBAction)gpaButton:(id)sender;
- (IBAction)stressReliefButton:(id)sender;
- (IBAction)testudoButton:(id)sender;
- (IBAction)quoteButton:(id)sender;
- (IBAction)aboutButton:(id)sender;


@end
