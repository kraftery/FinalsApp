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
        [tbi setImage:[UIImage imageNamed:@"pk.png"]];
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
    imageView.image = [UIImage imageNamed:@"Kitten and Puppy.jpg"];
    images = [[NSArray alloc] initWithObjects:@"Kitten and Puppy.jpg",
              @"pic3.png",
              @"puppy.jpg",
              @"Puppies-and-Kittens-Pictures9.jpg",
              @"puppies20.jpg",
              @"pic6.png",
              @"pic7.png",
              @"pic8.png",
              @"pic9.png",
              @"IBR-282274.jpg",
              @"puppies17.jpg",
              @"puppies18.jpg",
              @"Kitten and Puppy5.jpg",
              @"kittens_puppies2.jpg",
              @"pic10.png",
              @"pic11.png",
              @"pic12.png",
              @"pic13.png",
              @"pic14.png",
              @"pic15.png",
              @"pic16.png",
              @"puppy4.jpg",
              @"Puppies_And_kittens_Picture253-1-.png",
              @"siberian-husky-puppies-images.jpg",
              @"kitty-and-puppy 6.jpg",
              @"puppies kittens 7.jpg",
              @"images8.jpeg",
              @"puppies-kittens-10-1-jpg14.jpg",
              @"puppies15.jpg",
              @"puppies16.jpg",
              @"puppies21.jpg",
              @"cute-puppies-and-kittens-and-bunniescute-puppy-and-kitten-and-bunny-puppies-and-kittens-that-are-best-rclwyg8o.jpg",nil];
    //start = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStyleBordered target:self action:@selector(button:)];
    //self.navigationItem.rightBarButtonItem = start;
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
