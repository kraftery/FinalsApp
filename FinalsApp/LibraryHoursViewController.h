//
//  LibraryHoursViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryHoursViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate>{
    IBOutlet UITableView *myTableView;
    NSArray *library, *output;
    NSMutableData *responseData;
    NSMutableArray *library_hours;
}
@end
