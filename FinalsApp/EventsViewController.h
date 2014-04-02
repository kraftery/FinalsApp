//
//  EventsViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property(nonatomic, strong) NSString *labelText;
@property(nonatomic, strong) NSString *textViewText;

@end
