//
//  RootViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/17/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageOneViewController.h"
#import "PageTwoViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource> {
    
    NSUInteger index;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) PageOneViewController *pageOne;
@property (strong, nonatomic) PageTwoViewController *pageTwo;

@end
