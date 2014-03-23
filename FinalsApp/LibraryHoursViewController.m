//
//  LibraryHoursViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "LibraryHoursViewController.h"

@interface LibraryHoursViewController ()

@end

@implementation LibraryHoursViewController

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
    self.title = @"Library Hours";
    // Do any additional setup after loading the view from its nib.
    library = [[NSArray alloc] initWithObjects:@"Architecture",@"Art",@"Chemistry",@"CSPAC",@"Engineering",@"Hornbake",@"McKeldin", nil];
    myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//makes the tableview only display
    myTableView.backgroundColor = [UIColor clearColor];
    
}


-(NSInteger)numberOfSectionsOfTableView:(UITableView *) tableView {
    //return the number of sections
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [library count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [library objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
