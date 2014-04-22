//
//  PicturesOfPAndKViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 4/7/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicturesOfPAndKViewController : UIViewController{
    UIBarButtonItem *start;
    NSArray *images;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)handleSwipe:(UIGestureRecognizer *)sender;


@end
