//
//  EventActualViewController.h
//  FinalsApp
//
//  Created by Bori on 4/2/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventActualViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *myTableView;
    NSArray *days;
}

@end
