//
//  CouponListViewController.h
//  FinalsApp
//
//  Created by Bori on 4/3/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSArray *restaurants;
    IBOutlet UIImageView *couponHeader;
}

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end
