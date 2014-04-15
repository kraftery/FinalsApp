//
//  StressHelpViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 4/12/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "StressHelpViewController.h"

@interface StressHelpViewController ()

@end

@implementation StressHelpViewController

@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Stress Help"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    textView.text = @"The Following Resources Are Available:\n\nUniversity Health Center: (301) 314-8180\nAfter Hours Nurse Line: (301) 314-9386\n\nMental Health Service @ the Health Center: (301) 314-8106\n\nHelp Center: (301) 314-4357\n\nCampus Chaplains: (301) 314-9866\n\nCounseling Center: 301-314-7651\n\nAssessment & Stabilization Center: \n(301) 618-3162 or (301) 322-2606\n\nNational Suicide Prevention Lifeline: 1-800-273-TALK\n\nMaryland Crisis Hotline: 1-800-422-0009";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
