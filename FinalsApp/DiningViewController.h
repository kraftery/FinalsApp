//
//  DiningViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 4/6/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiningViewController : UIViewController<NSURLConnectionDelegate>{
    NSMutableData *responseData;
}

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end
