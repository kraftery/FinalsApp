//
//  StressHelpViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 4/12/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StressHelpViewController : UIViewController<NSURLConnectionDelegate>{
    NSMutableData *responseData;
}

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
