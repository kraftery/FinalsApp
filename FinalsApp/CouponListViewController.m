//
//  CouponListViewController.m
//  FinalsApp
//
//  Created by Bori on 4/3/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "CouponListViewController.h"

@interface CouponListViewController ()

@end

@implementation CouponListViewController
@synthesize myTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Restaurant Deals";
    couponHeader.image = [UIImage imageNamed:@"coupon_header.png"];
    restaurants = [[NSArray alloc] initWithObjects:@"First",@"Second",
                   nil];
    myTableView.backgroundColor = [UIColor clearColor];
    
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [restaurants count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableId = @"restaurants";
    UITableViewCell *current_cell = [tableView dequeueReusableCellWithIdentifier:simpleTableId];
    if(current_cell == nil){
        current_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableId];
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            current_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    current_cell.backgroundColor = [UIColor clearColor];
    current_cell.textLabel.text = [restaurants objectAtIndex:indexPath.row];
    
    return current_cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
