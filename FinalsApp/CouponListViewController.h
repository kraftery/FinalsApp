//
//  CouponListViewController.h
//  FinalsApp
//
//  Created by Bori on 4/3/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, NSURLConnectionDelegate>{
    NSMutableData *responseData;
    NSArray *restaurants;
    IBOutlet UITableView *myTableView;
}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end
