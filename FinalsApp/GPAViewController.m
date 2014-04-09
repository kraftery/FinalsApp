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
    grade1.delegate = self;
    grade2.delegate = self;
    grade3.delegate = self;
    grade4.delegate = self;
    grade5.delegate = self;
    grade6.delegate = self;
    grade7.delegate = self;
    cred1.delegate = self;
    cred2.delegate = self;
    cred3.delegate = self;
    cred4.delegate = self;
    cred5.delegate = self;
    cred6.delegate = self;
    cred7.delegate = self;
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:gestureRecognizer];
    
    hashMap = @{@"A+": [NSNumber numberWithDouble:4.0],
                @"A": [NSNumber numberWithDouble:4.0],
                @"A-": [NSNumber numberWithDouble:3.7],
                @"B+": [NSNumber numberWithDouble:3.3],
                @"B": [NSNumber numberWithDouble:3.0],
                @"B-": [NSNumber numberWithDouble:2.7],
                @"C+": [NSNumber numberWithDouble:2.3],
                @"C": [NSNumber numberWithDouble:2.0],
                @"C-": [NSNumber numberWithDouble:1.7],
                @"D+": [NSNumber numberWithDouble:1.3],
                @"D": [NSNumber numberWithDouble:1.0],
                @"D-": [NSNumber numberWithDouble:0.7],
                @"F": [NSNumber numberWithDouble:0.0],
                };
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
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) checkInputFor: (NSString *) grade and: (NSString *) credits {
    NSError *error = nil;
    NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:@"\\b(1|2|3|4|5|6|7)\\b"                                                       options:NSRegularExpressionCaseInsensitive                                                                                 error:&error];
    
    NSUInteger numberOfMatches2 = [regex2 numberOfMatchesInString:credits                                                         options:0 range:NSMakeRange(0, [credits length])];
    
    if (![[hashMap allKeys] containsObject:grade]) {
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That is not a valid grade, Try again." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return FALSE;
    }
    else if (numberOfMatches2 != 1) {
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That is not a valid credit number, Try again." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return FALSE;
    } else {
        return TRUE;
    }
}

- (IBAction)calculate:(id)sender {
    
    finalGPA = 0.00;
    creds = 0.00;
    grossGPA = 0.00;
    
    if (![grade1.text isEqualToString:@""] && ![cred1.text isEqualToString:@""]) {
        
        NSString *trimmedGrade = [grade1.text stringByReplacingOccurrencesOfString:(@" ") withString:(@"")];
        trimmedGrade = [trimmedGrade uppercaseString];
        
        if([self checkInputFor:trimmedGrade and:cred1.text]){
            double c1 = cred1.text.doubleValue;
            creds = creds + c1;
            NSDecimalNumber *grade = hashMap[trimmedGrade];
            grossGPA = grossGPA + (grade.doubleValue)*c1;
        }
    }
    if (![grade2.text isEqualToString:@""] && ![cred2.text isEqualToString:@""]) {
        
        NSString *trimmedGrade = [grade2.text stringByReplacingOccurrencesOfString:(@" ") withString:(@"")];
        trimmedGrade = [trimmedGrade uppercaseString];
        
        if([self checkInputFor:trimmedGrade and:cred2.text]){
            double c2 = cred2.text.doubleValue;
            creds = creds + c2;
            NSDecimalNumber *grade = hashMap[trimmedGrade];
            grossGPA = grossGPA + (grade.doubleValue)*c2;
        }
    }
    if (![grade3.text isEqualToString:@""] && ![cred3.text isEqualToString:@""]) {
        
        NSString *trimmedGrade = [grade3.text stringByReplacingOccurrencesOfString:(@" ") withString:(@"")];
        trimmedGrade = [trimmedGrade uppercaseString];
        
        if([self checkInputFor:trimmedGrade and:cred3.text]){
        double c3 = cred3.text.doubleValue;
        creds = creds + c3;
        NSDecimalNumber *grade = hashMap[trimmedGrade];
        grossGPA = grossGPA + (grade.doubleValue)*c3;
        }
    }
    if (![grade4.text isEqualToString:@""] && ![cred4.text isEqualToString:@""]) {
        
        NSString *trimmedGrade = [grade4.text stringByReplacingOccurrencesOfString:(@" ") withString:(@"")];
        trimmedGrade = [trimmedGrade uppercaseString];
        
        if([self checkInputFor:trimmedGrade and:cred4.text]){
        double c4 = cred4.text.doubleValue;
        creds = creds + c4;
        NSDecimalNumber *grade = hashMap[trimmedGrade];
        grossGPA = grossGPA + (grade.doubleValue)*c4;
        }
    }
    if (![grade5.text isEqualToString:@""] && ![cred5.text isEqualToString:@""]) {
        
        NSString *trimmedGrade = [grade5.text stringByReplacingOccurrencesOfString:(@" ") withString:(@"")];
        trimmedGrade = [trimmedGrade uppercaseString];
        
        if([self checkInputFor:trimmedGrade and:cred5.text]){
        double c5 = cred5.text.doubleValue;
        creds = creds + c5;
        NSDecimalNumber *grade = hashMap[trimmedGrade];
        grossGPA = grossGPA + (grade.doubleValue)*c5;
        }
    }
    if (![grade6.text isEqualToString:@""] && ![cred6.text isEqualToString:@""]) {
        
        NSString *trimmedGrade = [grade6.text stringByReplacingOccurrencesOfString:(@" ") withString:(@"")];
        trimmedGrade = [trimmedGrade uppercaseString];
        
        if([self checkInputFor:trimmedGrade and:cred6.text]){
        double c6 = cred6.text.doubleValue;
        creds = creds + c6;
        NSDecimalNumber *grade = hashMap[trimmedGrade];
        grossGPA = grossGPA + (grade.doubleValue)*c6;
        }
    }
    if (![grade7.text isEqualToString:@""] && ![cred7.text isEqualToString:@""]) {
        
        NSString *trimmedGrade = [grade7.text stringByReplacingOccurrencesOfString:(@" ") withString:(@"")];
        trimmedGrade = [trimmedGrade uppercaseString];
        
        if([self checkInputFor:trimmedGrade and:cred7.text]){
        double c7 = cred7.text.doubleValue;
        creds = creds + c7;
        NSDecimalNumber *grade = hashMap[trimmedGrade];
        grossGPA = grossGPA + (grade.doubleValue)*c7;
        }
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
