//
//  BusScheduleViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "BusScheduleViewController.h"
#import "BusViewController.h"

@interface BusScheduleViewController ()

@end

@implementation BusScheduleViewController

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
    self.title = @"Bus Schedule";
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"WARNING:" message:@"Times marked with 'X' are NOT running during finals week" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    [errorView show];
    buses = [[NSArray alloc] initWithObjects:
             @"104-College Park Metro",
             @"105-Courtyards Express",
             @"108-Adelphi",
             @"109-River Road",
             @"110-Seven Springs Apartments",
             @"111-Silver Spring",
             @"113-Hyattsville",
             @"115-Orange",
             @"116-Purple",
             @"117-Blue",
             @"118-Gold",
             @"122-Green",
             @"125-Circulator",
             @"127-Mazza Grandmarc",
             @"128-Enclave",
             @"129-Franklin Park",
             @"130-Greenbelt",
             @"131-Enclave Mazza Grandmarc",
             @"132-The Varsity",
             @"133-Mall at PG",
             nil
             ];
             
             
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [buses count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableId = @"buses";
    UITableViewCell *current_cell = [tableView dequeueReusableCellWithIdentifier:simpleTableId];
    if(current_cell == nil){
        current_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableId];
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            current_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    current_cell.backgroundColor = [UIColor clearColor];
    current_cell.textLabel.text = [buses objectAtIndex:indexPath.row];
    
    return current_cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BusViewController *controller = [[BusViewController alloc] initWithNibName:@"BusViewController" bundle:[NSBundle mainBundle]];
    
    switch (indexPath.row) {
        case 0:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/104_CPM.pdf";
            break;
        case 1:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/105_CtyExp.pdf";
            break;
        case 2:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/108_Adelphi.pdf";
            break;
        case 3:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/109_RR.pdf";
            break;
        case 4:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/110_SSApt.pdf";
            break;
        case 5:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/111_SSM.pdf";
            break;
        case 6:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/113_HYATT.pdf";
            break;
        case 7:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/115_Orange.pdf";
            break;
        case 8:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/116_Purple.pdf";
            break;
        case 9:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/117_Blue.pdf";
            break;
        case 10:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/118_Gold.pdf";
            break;
        case 11:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/122_Green.pdf";
            break;
        case 12:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/125_Circ.pdf";
            break;
        case 13:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/127_MGM.pdf";
            break;
        case 14:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/128_Enclave.pdf";
            break;
        case 15:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/129%20Franklin%20Park%20at%20Greenbelt%20Station.pdf";
            break;
        case 16:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/130_GB.pdf";
            break;
        case 17:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/131_MazzaGrandMarc_TheEnclave.pdf";
            break;
        case 18:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/132_The%20Varsity.pdf";
            break;
        case 19:
            controller.fullURL = @"http://www.transportation.umd.edu/images/Shuttle/Schedules%20pdfs/current/133_MPGs.pdf";
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
