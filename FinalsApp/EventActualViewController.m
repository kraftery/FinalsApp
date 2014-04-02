//
//  EventActualViewController.m
//  FinalsApp
//
//  Created by Bori on 4/2/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "EventActualViewController.h"
#import "EventsViewController.h"

@interface EventActualViewController ()

@end

@implementation EventActualViewController

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
    self.title = @"Events";
    days = [[NSArray alloc] initWithObjects:@"Sunday, December 15", @"Monday, December 16", @"Tuesday, December 17", @"Wednesday, December 18", @"Thursday, December 19", @"Friday, December 20", nil];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [days count];
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
    current_cell.textLabel.text = [days objectAtIndex:indexPath.row];
    
    return current_cell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
