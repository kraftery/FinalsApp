//
//  MyScheduleViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScheduleViewController : UIViewController<NSURLConnectionDelegate>{
    UIBarButtonItem *add;
    NSMutableData *responseData, *finalData;
    NSMutableArray *myExams;
    IBOutlet UITableView *myTableView;
}

-(void) addButtonClick;

@end
