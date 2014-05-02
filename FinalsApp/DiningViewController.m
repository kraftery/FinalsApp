//
//  DiningViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 4/6/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "DiningViewController.h"

@interface DiningViewController ()

@end

@implementation DiningViewController {
    
    NSMutableArray *hours;
}
@synthesize northTextView, southTextView, indicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Diner Hours"];
         [tbi setImage:[UIImage imageNamed:@"din.png"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobileappdevelopersclub.com/shellp/diner.txt"] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [conn start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *) parse: (NSMutableData *) response{
    NSString * strData1= [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]; //This is going to convert the data we get from the server into a large string, preserving all the new line characters.
    NSArray *to_return = [strData1 componentsSeparatedByString:@"---"]; //this is going to put each section between "---" in the text file downloaded into an index in this array. Each section is info of a particular library info
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
    NSArray *file_to_array = [self parse: responseData];
    hours = [[NSMutableArray alloc] initWithArray:file_to_array];
    northTextView.text = [hours objectAtIndex:0];
    southTextView.text = [hours objectAtIndex:1];
    northTextView.font = [UIFont fontWithName:@"Verdana" size:12.0f];
    southTextView.font = [UIFont fontWithName:@"Verdana" size:12.0f];
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

@end
