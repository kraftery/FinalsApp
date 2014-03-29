//
//  LibraryHoursViewController.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "LibraryHoursViewController.h"
#import "SelectedLibraryViewController.h"

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
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobileappdevelopersclub.com/shellp/library.txt"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SelectedLibraryViewController *libraryScreen = [[SelectedLibraryViewController alloc] initWithNibName:@"SelectedLibraryViewController" bundle:[NSBundle mainBundle]];
    //NSLog(@"I RAN HERE CHECK ME PLEASE");
    if([library_hours count] != 0 && library_hours != nil){
        //NSLog(@"I RAN HERE CHECK ME PLEASE2");
        //NSArray *arch, *art, *chem, *cspac, *engr, *horn, *mck;
    switch (indexPath.row) {
        case 0:
            libraryScreen.title = @"Architecture";
            libraryScreen.labelText = @"Architecture";
            libraryScreen.imageName = @"Architecture.jpg";
            libraryScreen.textViewText = [[NSString alloc] initWithString:[library_hours objectAtIndex:0]];
            break;
        case 1:
            libraryScreen.title = @"Art";
            libraryScreen.labelText = @"Art";
            libraryScreen.imageName = @"Art.jpg";
            libraryScreen.textViewText = [[NSString alloc] initWithString:[library_hours objectAtIndex:1]];
            break;
        case 2:
            libraryScreen.title = @"Chemistry";
            libraryScreen.labelText = @"Chemistry";
            libraryScreen.imageName = @"Chemistry.jpg";
            libraryScreen.textViewText = [[NSString alloc] initWithString:[library_hours objectAtIndex:2]];
            break;
        case 3:
            libraryScreen.title = @"CSPAC";
            libraryScreen.labelText = @"CSPAC";
            libraryScreen.imageName = @"CSPAC.jpg";
            libraryScreen.textViewText = [[NSString alloc] initWithString:[library_hours objectAtIndex:3]];
            break;
        case 4:
            libraryScreen.title = @"Engineering";
            libraryScreen.labelText = @"Engineering";
            libraryScreen.imageName = @"Engineering.jpg";
            libraryScreen.textViewText = [[NSString alloc] initWithString:[library_hours objectAtIndex:4]];
            break;
        case 5:
            libraryScreen.title = @"Hornbake";
            libraryScreen.labelText = @"Hornbake";
            libraryScreen.imageName = @"Hornbake.jpg";
            libraryScreen.textViewText = [[NSString alloc] initWithString:[library_hours objectAtIndex:5]];
            break;
        case 6:
            libraryScreen.title = @"McKeldin";
            libraryScreen.labelText = @"McKeldin";
            libraryScreen.imageName = @"McKeldin.jpg";
            libraryScreen.textViewText = [[NSString alloc] initWithString:[library_hours objectAtIndex:6]];
            break;
            default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:libraryScreen animated:YES];
    }
    else{
        // network problem, we should handle what we'll do here
    }
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
    //NSArray *keys = [NSArray arrayWithArray:library]; //this is keys which are pretty much the library names
    //NSArray *values = [NSArray arrayWithObjects:[[file_to_array objectAtIndex:0] componentsSeparatedByString:@"\n"], [[file_to_array objectAtIndex:1] componentsSeparatedByString:@"\n"], [[file_to_array objectAtIndex:2] componentsSeparatedByString:@"\n"], [[file_to_array objectAtIndex:3] componentsSeparatedByString:@"\n"], [[file_to_array objectAtIndex:4] componentsSeparatedByString:@"\n"], [[file_to_array objectAtIndex:5] componentsSeparatedByString:@"\n"], [[file_to_array objectAtIndex:6] componentsSeparatedByString:@"\n"], nil]; //values takes each index in file_to_array and further splits the current index by new line.
    //library_info = [[NSDictionary alloc] initWithObjects:file_to_array forKeys:keys]; //our dictionary :)
    library_hours = [[NSMutableArray alloc] initWithArray:file_to_array];
    
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

@end
