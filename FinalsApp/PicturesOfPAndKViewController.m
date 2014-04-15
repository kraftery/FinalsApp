//
//  PicturesOfPAndKViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 4/7/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "PicturesOfPAndKViewController.h"

@interface PicturesOfPAndKViewController ()

@end

@implementation PicturesOfPAndKViewController

@synthesize imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Puppies And Kittens"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

-(IBAction)button:(id)sender{
    
    imageView.animationImages = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"CSPAC.jpg"],
        [UIImage imageNamed:@"Engineering.jpg"],
        [UIImage imageNamed:@"Hornbake.jpg"],
        [UIImage imageNamed:@"Architecture.jpg"],
        [UIImage imageNamed:@"Art.jpg"],
        nil];
    
    self.imageView.animationDuration = 20.0;
    self.imageView.animationRepeatCount = 2;
    [self.imageView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
