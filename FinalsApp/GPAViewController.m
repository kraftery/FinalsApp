//
//  GPAViewController.m
//  FinalsApp
//
//  Created by Connor Nelson on 3/29/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "GPAViewController.h"

@interface GPAViewController ()

@end

@implementation GPAViewController

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

    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
}

- (void) hideKeyboard {
    [grade1 resignFirstResponder];
    [cred1 resignFirstResponder];
    [grade2 resignFirstResponder];
    [cred2 resignFirstResponder];
    [grade3 resignFirstResponder];
    [cred3 resignFirstResponder];
    [grade4 resignFirstResponder];
    [cred4 resignFirstResponder];
    [grade5 resignFirstResponder];
    [cred5 resignFirstResponder];
    [grade6 resignFirstResponder];
    [cred6 resignFirstResponder];
    [grade7 resignFirstResponder];
    [cred7 resignFirstResponder];
    [grade8 resignFirstResponder];
    [cred8 resignFirstResponder];
    [grade9 resignFirstResponder];
    [cred9 resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(id)sender {
    
    finalGPA = 0.00;
    creds = 0.00;
    grossGPA = 0.00;
    
    if (grade1.text != nil && cred1.text != nil) {
        
        double c1 = cred1.text.doubleValue;
        creds = creds + c1;
        grossGPA = grossGPA + (grade1.text.doubleValue)*c1;
        
    }
    if (grade2.text != nil && cred2.text != nil) {
        
        double c2 = cred2.text.doubleValue;
        creds = creds + c2;
        grossGPA = grossGPA + (grade2.text.doubleValue)*c2;
        
    }
    if (grade3.text != nil && cred3.text != nil) {
        
        double c3 = cred3.text.doubleValue;
        creds = creds + c3;
        grossGPA = grossGPA + (grade3.text.doubleValue)*c3;
        
    }
    if (grade4.text != nil && cred4.text != nil) {
        
        double c4 = cred4.text.doubleValue;
        creds = creds + c4;
        grossGPA = grossGPA + (grade4.text.doubleValue)*c4;
        
    }
    if (grade5.text != nil && cred5.text != nil) {
        
        double c5 = cred5.text.doubleValue;
        creds = creds + c5;
        grossGPA = grossGPA + (grade5.text.doubleValue)*c5;
        
    }
    if (grade6.text != nil && cred6.text != nil) {
        
        double c6 = cred6.text.doubleValue;
        creds = creds + c6;
        grossGPA = grossGPA + (grade6.text.doubleValue)*c6;
        
    }
    if (grade7.text != nil && cred7.text != nil) {
        
        double c7 = cred7.text.doubleValue;
        creds = creds + c7;
        grossGPA = grossGPA + (grade7.text.doubleValue)*c7;
        
    }
    if (grade8.text != nil && cred8.text != nil) {
        
        double c8 = cred8.text.doubleValue;
        creds = creds + c8;
        grossGPA = grossGPA + (grade8.text.doubleValue)*c8;
        
    }
    if (grade8.text != nil & cred9.text != nil) {
        
        double c9 = cred9.text.doubleValue;
        creds = creds + c9;
        grossGPA = grossGPA + (grade8.text.doubleValue)*c9;
        
    }
    
    if (creds > 0) {
        finalGPA = grossGPA/creds;
    }
    
    NSNumber *gpa = [NSNumber numberWithDouble:finalGPA];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    
    [formatter setRoundingMode: NSNumberFormatterRoundUp];
    
    NSString *display = [formatter stringFromNumber:gpa];
    
    gpaLabel.text = display;

    
}
@end
