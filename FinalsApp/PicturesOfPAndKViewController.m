//
//  PicturesOfPAndKViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 4/7/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "PicturesOfPAndKViewController.h"
#import "RootViewController.h"

@interface PicturesOfPAndKViewController ()

@end

@implementation PicturesOfPAndKViewController

@synthesize imageView;
int imageIndex = 0;
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
    self.title = @"Puppies and Kittens";
    UIAlertView *help = [[UIAlertView alloc] initWithTitle:@"" message:@"Swipe LEFT or RIGHT to view pictures...Happy viewing :)" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    [help show];
    imageView.image = [UIImage imageNamed:@"CSPAC.jpg"];
    images = [[NSArray alloc] initWithObjects:@"CSPAC.jpg",
                       @"Engineering.jpg",
                       @"Hornbake.jpg",
                       @"Architecture.jpg",
                       @"Art.jpg", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSwipe:(UIGestureRecognizer *)sender {
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) sender direction];
    switch(direction){
            case UISwipeGestureRecognizerDirectionRight:
            imageIndex--;
            break;
            case UISwipeGestureRecognizerDirectionLeft:
            imageIndex++;
            default:
            break;
    }
    imageIndex = (imageIndex < 0) ? ([images count] - 1) : (imageIndex % [images count]);
    imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex]];
}

@end
