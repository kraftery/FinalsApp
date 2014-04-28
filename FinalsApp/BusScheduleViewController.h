//
//  BusScheduleViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusScheduleViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate>{
    NSMutableData *responseData;
    IBOutlet UITableView *myTableView;
    NSArray *buses;
    NSArray *urls;
}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end
