//
//  StressReliefViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 4/7/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "StressReliefViewController.h"

@interface StressReliefViewController ()

@end

@implementation StressReliefViewController

@synthesize textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Stress Relief Tips"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    textView.text = @"Tips For Stress Relief During Finals Week:\n\n1. Manage Your Time Wisely\n\t-See the \"Tips For Time Management\" section for more info\n\n2. Get Plenty of Sleep\n\t-6 to 8 hours is the recommended amount\n\n3. Exercise\n\t-Exercise reduces stress and improves brain function\n\n4. Smile\n\t-View a funny video or look at the \"Puppies And Kittens\" tab\n\n5. Attend A Stress Relief Event\n\t-See the \"Campus Events\" section for more info";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
