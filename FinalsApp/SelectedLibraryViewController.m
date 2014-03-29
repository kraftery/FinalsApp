//
//  SelectedLibraryViewController.m
//  FinalsApp
//
//  Created by Bori on 3/23/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "SelectedLibraryViewController.h"

@interface SelectedLibraryViewController ()

@end

@implementation SelectedLibraryViewController

@synthesize textView, label, imageView, labelText, imageName, textViewText;

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
    label.text = labelText;
    self.imageView.image = [UIImage imageNamed:imageName];
    textView.text = textViewText;
    [textView setFont:[UIFont systemFontOfSize:14]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
