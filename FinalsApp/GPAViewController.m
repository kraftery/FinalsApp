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

-(NSInteger) checkInput: (UITextField *) grade second: (UITextField *) credit{
    NSString *trimmedGrade = [([grade text]) stringByReplacingOccurrencesOfString:@" " withString:@""];
    [trimmedGrade uppercaseString];
    NSString *trimmedCredit = [([credit text]) stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSError *error = nil;
    NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:@"^(A|B|C|D)(+|-)"                                                                               options:NSRegularExpressionCaseInsensitive                                                                                 error:&error];
    NSRegularExpression *regex2 = [NSRegularExpression regularExpressionWithPattern:@"^[1-6]"                                                                               options:NSRegularExpressionCaseInsensitive                                                                                 error:&error];
    NSUInteger numberOfMatches = [regex1 numberOfMatchesInString:trimmedGrade                                                         options:0 range:NSMakeRange(0, [trimmedGrade length])];
    NSUInteger numberOfMatches2 = [regex2 numberOfMatchesInString:trimmedCredit                                                         options:0 range:NSMakeRange(0, [trimmedCredit length])];
    if (numberOfMatches != 2 || numberOfMatches == 0) {
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That is not a valid grade, Try again." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return 0;
    }
    if (numberOfMatches2 == 0) {
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That is not a valid credit number, Try again." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return 0;
    }
    return 1;
}

- (IBAction)calculate:(id)sender {
    
    finalGPA = 0.00;
    creds = 0.00;
    grossGPA = 0.00;
    
    if (grade1.text != nil && cred1.text != nil) {
        if([self checkInput:grade1 second:cred1] == 0){
        double c1 = cred1.text.doubleValue;
        creds = creds + c1;
        NSDecimalNumber *grade = hashMap[grade1.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c1;
        }
    }
    if (grade2.text != nil && cred2.text != nil) {
        if([self checkInput:grade2 second:cred2] == 0){
        double c2 = cred2.text.doubleValue;
        creds = creds + c2;
        NSDecimalNumber *grade = hashMap[grade2.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c2;
        }
    }
    if (grade3.text != nil && cred3.text != nil) {
        if([self checkInput:grade3 second:cred3] == 0){
        double c3 = cred3.text.doubleValue;
        creds = creds + c3;
        NSDecimalNumber *grade = hashMap[grade3.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c3;
        }
    }
    if (grade4.text != nil && cred4.text != nil) {
        if([self checkInput:grade4 second:cred4] == 0){
        double c4 = cred4.text.doubleValue;
        creds = creds + c4;
        NSDecimalNumber *grade = hashMap[grade4.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c4;
        }
    }
    if (grade5.text != nil && cred5.text != nil) {
        if([self checkInput:grade5 second:cred5] == 0){
        double c5 = cred5.text.doubleValue;
        creds = creds + c5;
        NSDecimalNumber *grade = hashMap[grade5.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c5;
        }
    }
    if (grade6.text != nil && cred6.text != nil) {
        if([self checkInput:grade6 second:cred6] == 0){
        double c6 = cred6.text.doubleValue;
        creds = creds + c6;
        NSDecimalNumber *grade = hashMap[grade6.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c6;
        }
    }
    if (grade7.text != nil && cred7.text != nil) {
        if([self checkInput:grade7 second:cred7] == 0){
        double c7 = cred7.text.doubleValue;
        creds = creds + c7;
        NSDecimalNumber *grade = hashMap[grade7.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c7;
        }
    }
    if (grade8.text != nil && cred8.text != nil) {
        if([self checkInput:grade8 second:cred8] == 0){
        double c8 = cred8.text.doubleValue;
        creds = creds + c8;
        NSDecimalNumber *grade = hashMap[grade8.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c8;
        }
    }
    if (grade9.text != nil & cred9.text != nil) {
        if([self checkInput:grade9 second:cred9] == 0){
        double c9 = cred9.text.doubleValue;
        creds = creds + c9;
        NSDecimalNumber *grade = hashMap[grade9.text.capitalizedString];
        grossGPA = grossGPA + (grade.doubleValue)*c9;
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
