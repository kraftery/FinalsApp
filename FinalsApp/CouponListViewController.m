//
//  CouponListViewController.m
//  FinalsApp
//
//  Created by Bori on 4/3/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "CouponListViewController.h"
#import "CouponsViewController.h"

@interface CouponListViewController ()

@end

@implementation CouponListViewController

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
    self.title = @"Restaurants";
    restaurants = [[NSArray alloc] initWithObjects:@"Chipotle", @"DP Dough",@"Jimmy Johns",nil];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.backgroundColor = [UIColor yellowColor];
    myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//makes the tableview only display
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [restaurants count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableId = @"days";
    UITableViewCell *current_cell = [tableView dequeueReusableCellWithIdentifier:simpleTableId];
    if(current_cell == nil){
        current_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableId];
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            current_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    current_cell.backgroundColor = [UIColor yellowColor];
    current_cell.textLabel.text = [restaurants objectAtIndex:indexPath.row];
    
    return current_cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CouponsViewController *couponView = [[CouponsViewController alloc] initWithNibName:@"CouponsViewController" bundle:[NSBundle mainBundle]];
    switch (indexPath.row) {
        case 0:
            couponView.c_image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://mobileappdevelopersclub.com/shellp/milan.jpg"]]];
            break;
            
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:couponView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
