//
//  TimeManagementViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 4/7/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "TimeManagementViewController.h"

@interface TimeManagementViewController ()

@end

@implementation TimeManagementViewController

@synthesize textView;

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
    
    textView.text = @"1. Create a schedule and stick to it\n\n2. Turn off electronic devices so you are not distracted\n\n3. Prioritize what you need to get done\n\n4. Find a space to study where you will not be distracted\n\n5. Start studying early\n\n6. Don't try to cram the night before\n\n";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
