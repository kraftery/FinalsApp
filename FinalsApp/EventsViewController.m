//
//  EventsViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "EventsViewController.h"
#import "EventActualViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController
@synthesize label, labelText, textView, textViewText;

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
    self.title = @"Events";
    textView.text = textViewText;
    label.text = labelText;
    
    [textView setFont:[UIFont systemFontOfSize:18]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backToEvents:(id)sender {
    EventActualViewController *view = [[EventActualViewController alloc] init];
    [self.navigationController pushViewController:view animated:NO];
}

@end
