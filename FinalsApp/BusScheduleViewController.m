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
@synthesize indicator;
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
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobileappdevelopersclub.com/shellp/busurls.txt"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
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
    myTableView.dataSource = self;
    myTableView.delegate = self;
    myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//makes the tableview only display
    myTableView.backgroundColor = [UIColor clearColor];
}

-(NSArray *) parse: (NSMutableData *) response{
    NSString * strData1= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]; //This is going to convert the data we get from the server into a large string, preserving all the new line characters.
    NSArray *to_return = [strData1 componentsSeparatedByString:@"****"]; //this is going to put each section between "---" in the text file downloaded into an index in this array. Each section is info of a particular library info
    return to_return;
    
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    [indicator startAnimating];
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
    //NSArray *ret = [self parse:responseData];
    urls = [[NSArray alloc] initWithArray:[self parse:responseData]];
    [indicator stopAnimating];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Looks like your connection to the internet is too slow, Try again"
                                                       delegate:self
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil, nil];
    errorView.alertViewStyle = UIAlertViewStyleDefault;
    [errorView show];
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
            controller.fullURL = [urls objectAtIndex:0];
            break;
        case 1:
            controller.fullURL = [urls objectAtIndex:1];
            break;
        case 2:
            controller.fullURL = [urls objectAtIndex:2];
            break;
        case 3:
            controller.fullURL = [urls objectAtIndex:3];
            break;
        case 4:
            controller.fullURL = [urls objectAtIndex:4];
            break;
        case 5:
            controller.fullURL = [urls objectAtIndex:5];
            break;
        case 6:
            controller.fullURL = [urls objectAtIndex:6];
            break;
        case 7:
            controller.fullURL = [urls objectAtIndex:7];
            break;
        case 8:
            controller.fullURL = [urls objectAtIndex:8];
            break;
        case 9:
            controller.fullURL = [urls objectAtIndex:9];
            break;
        case 10:
            controller.fullURL = [urls objectAtIndex:10];
            break;
        case 11:
            controller.fullURL = [urls objectAtIndex:11];
            break;
        case 12:
            controller.fullURL = [urls objectAtIndex:12];
            break;
        case 13:
            controller.fullURL = [urls objectAtIndex:13];
            break;
        case 14:
            controller.fullURL = [urls objectAtIndex:14];
            break;
        case 15:
            controller.fullURL = [urls objectAtIndex:15];
            break;
        case 16:
            controller.fullURL = [urls objectAtIndex:16];
            break;
        case 17:
            controller.fullURL = [urls objectAtIndex:17];
            break;
        case 18:
            controller.fullURL = [urls objectAtIndex:18];
            break;
        case 19:
            controller.fullURL = [urls objectAtIndex:19];
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
