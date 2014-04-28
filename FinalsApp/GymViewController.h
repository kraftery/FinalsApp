//
//  GymViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 4/6/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GymViewController : UIViewController<NSURLConnectionDelegate>{
    NSMutableData *responseData;
}

@property (weak, nonatomic) IBOutlet UITextView *eppleyTextView;

@property (weak, nonatomic) IBOutlet UITextView *sphTextView;

@property (weak, nonatomic) IBOutlet UITextView *ritchieTextView;

@end
