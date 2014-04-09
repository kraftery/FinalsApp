//
//  MyScheduleViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "MyScheduleViewController.h"

@interface MyScheduleViewController ()

@end

@implementation MyScheduleViewController

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
    self.title = @"My Schedule";
    myExams = [[NSMutableArray alloc] init];
    add = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addButtonClick)];
    self.navigationItem.rightBarButtonItem = add;
    finalData = [[NSMutableData alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addButtonClick{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add A Class"
                                                    message:@"Enter a class to get its exam time"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Save", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [[alert textFieldAtIndex:1] setSecureTextEntry:NO];
    [[alert textFieldAtIndex:0] setPlaceholder:@"Class Name"];
    [[alert textFieldAtIndex:1] setPlaceholder:@"Section Number"];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex != [alertView cancelButtonIndex]) {
        NSString *className = [([[alertView textFieldAtIndex:0] text]) stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *sectionNumber = [([[alertView textFieldAtIndex:1] text]) stringByReplacingOccurrencesOfString:@" " withString:@""]; //this gets rid of spaces in between the string
        NSString *expression = @"^[0-9]{4}$";
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression                                                                               options:NSRegularExpressionCaseInsensitive                                                                                 error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:sectionNumber                                                         options:0 range:NSMakeRange(0, [sectionNumber length])];
        if (numberOfMatches == 0){
            UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That is not a valid section number, Try again." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
            [errorView show];
            return;
        }
        NSString *url_string = [NSString stringWithFormat:@"http://mobileappdevelopersclub.com/shellp/ShelLp_Final/%@",className];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url_string] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        if (finalData == nil) {
            UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Something Went wrong with the data." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
            [errorView show];
            return;
        }
        NSMutableArray *examInfo = [self parse:className second:sectionNumber data:finalData];
        if (examInfo != nil) {
            [myExams addObject:examInfo];
        }
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *exams = [[NSArray alloc] initWithArray:myExams];
        [defaults setObject:exams forKey:@"exams"];
        [defaults synchronize];
        [myTableView reloadData];
    }
}

-(NSMutableArray *) parse: (NSString *) className second: (NSString *) sectionNumber data: (NSMutableData *) jsonFile{
    NSMutableArray *final;
    NSMutableArray *to_return = nil;
    if(className == nil || [className length] == 0 || sectionNumber == nil || [sectionNumber length] == 0){
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You did not enter a class name or section number."
                                                           delegate:self
                                                  cancelButtonTitle:@"Dismiss"
                                                  otherButtonTitles:nil, nil];
        errorView.alertViewStyle = UIAlertViewStyleDefault;
        [errorView show];
        return nil;
    }
    NSString *section, *day, *time, *location, *instructor;
    
    NSError *error = nil;
    NSLog(@"%@",jsonFile);
    //this is an array of dictionaries aka hashes
    NSMutableArray *classArray = [NSJSONSerialization
                                  JSONObjectWithData: jsonFile
                                  options: NSJSONReadingMutableContainers
                                  error: &error
                                  ];
    //NSLog(@"%@",error);
    if(error){
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error getting your class. Please try again later" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return nil;
    }
    else{
        if(classArray == nil || [classArray count] == 0){
            UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The class is wrong or is not offered this semester" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
            [errorView show];
            return nil;
        }
        else{
            //we will return a 2D arrray
            final = [[NSMutableArray alloc] init]; //this will contain arrays as in it's indexes => it's gonna be a 2d array
            for (NSDictionary *dictionary in classArray){
                section = [dictionary objectForKey:@"section"];
                day = [dictionary objectForKey:@"day"];
                time = [dictionary objectForKey:@"time"];
                location = [dictionary objectForKey:@"location"];
                instructor = [dictionary objectForKey:@"instructor"];
                
                //Put all the above strings in an array
                NSArray *final_object = [[NSArray alloc] initWithObjects:section, day, time, location, instructor, nil];
                [final addObject:final_object];
                
            }
        }
    }
    for (NSArray *current_class in final) {
        if([sectionNumber isEqualToString:[current_class objectAtIndex:0]]){
            to_return = [[NSMutableArray alloc] initWithObjects:className, [current_class objectAtIndex:1], [current_class objectAtIndex:2], [current_class objectAtIndex:3], nil];
            break;
        }
    }
    if(to_return == nil || [to_return count] == 0){
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The class or section number you entered is wrong" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return nil;
    }
    return to_return;
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    responseData = [[NSMutableData alloc] init];
    NSLog(@"I'M ACTUALLY RUNNING DOWN HERE");
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
   // NSArray *file_to_array = [self parse: responseData];
//    library_hours = [[NSMutableArray alloc] initWithArray:file_to_array];
    finalData = responseData;
    NSLog(@"I'M ACTUALLY RUNNING DOWN HERE");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}
           
@end
