//
//  MyScheduleViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScheduleViewController : UIViewController{
    UIBarButtonItem *add;
    NSMutableData *responseData;
    NSMutableArray *myExams;
  //  IBOutlet UITableView *myTableView;
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

-(void) addButtonClick;

@end
