//
//  TimeManagementViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 4/7/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeManagementViewController : UIViewController<NSURLConnectionDelegate>{
    NSMutableData *responseData;
}

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end
