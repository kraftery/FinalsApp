//
//  EventActualViewController.m
//  FinalsApp
//
//  Created by Bori on 4/2/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "EventActualViewController.h"
#import "EventsViewController.h"
#import "RootViewController.h"

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
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobileappdevelopersclub.com/shellp/events.txt"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
    days = [[NSArray alloc] initWithObjects:@"Friday, May 9",@"Saturday, May 10",@"Sunday, May 11",@"Monday, May 12", @"Tuesday, May 13", @"Wednesday, May 14", @"Thursday, May 15", @"Friday, May 16", @"Saturday, May 17", @"Sunday, May 18", @"Monday, May 19", @"Tuesday, May 20", nil];
    //returned_events = [[NSMutableArray alloc] init];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//makes the tableview only display
    myTableView.backgroundColor = [UIColor clearColor];
    //myTableView.bounces = YES;
    //[myTableView setAlwaysBounceVertical:YES];
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
    
    current_cell.backgroundColor = [UIColor clearColor];
    current_cell.textLabel.text = [days objectAtIndex:indexPath.row];
    
    return current_cell;
}

-(void) sendRequest{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobileappdevelopersclub.com/shellp/events.txt"] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([returned_events isEqual:[NSNull null]] || returned_events == nil || [returned_events count] == 0 || returned_events == Nil) {
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"WARNING:" message:@"Internet connection is bad. Please retry" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return;
        //[self sendRequest];
    }
    EventsViewController *eventView = [[EventsViewController alloc] initWithNibName:@"EventsViewController" bundle:[NSBundle mainBundle]];
    switch (indexPath.row) {
        case 0:
            eventView.labelText = @"Friday May 9th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:0]];
            break;
        case 1:
            eventView.labelText = @"Saturday May 10th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:1]];
            break;
        case 2:
            eventView.labelText = @"Sunday May 11th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:2]];
            break;
        case 3:
            eventView.labelText = @"Monday May 12th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:3]];
            break;
        case 4:
            eventView.labelText = @"Tuesday May 13th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:4]];
            break;
        case 5:
            eventView.labelText = @"Wednesday May 14th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:5]];
            break;
        case 6:
            eventView.labelText = @"Thursday May 15th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:6]];
            break;
        case 7:
            eventView.labelText = @"Friday May 16th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:7]];
            break;
        case 8:
            eventView.labelText = @"Saturday May 17th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:8]];
            break;
        case 9:
            eventView.labelText = @"Sunday May 18th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:9]];
            break;
        case 10:
            eventView.labelText = @"Monday May 19th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:10]];
            break;
        case 11:
            eventView.labelText = @"Tuesday May 20th";
            eventView.textViewText = [[NSString alloc] initWithString:[returned_events  objectAtIndex:11]];
            break;
        default:
            [returned_events removeAllObjects];
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:eventView animated:YES];
}

-(NSArray *) parse: (NSMutableData *) response{
    NSString * strData1= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]; //This is going to convert the data we get from the server into a large string, preserving all the new line characters.
    NSArray *to_return = [strData1 componentsSeparatedByString:@"***"]; //this is going to put each section between "---" in the text file downloaded into an index in this array. Each section is info of a particular library info
    return to_return;
    
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return cachedResponse;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    returned_events = [[NSMutableArray alloc] initWithArray:[self parse: responseData]];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backToRoot:(id)sender{
    RootViewController *viewController = [[RootViewController alloc] init];
    [[self navigationController] pushViewController:viewController animated:YES];
}


@end
