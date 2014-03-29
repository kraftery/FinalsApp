//
//  GPAViewController.h
//  FinalsApp
//
//  Created by Connor Nelson on 3/29/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPAViewController : UIViewController{

    
    IBOutlet UILabel *gpaLabel;
    IBOutlet UITextField *grade1;
    IBOutlet UITextField *grade2;
    IBOutlet UITextField *grade3;
    IBOutlet UITextField *grade4;
    IBOutlet UITextField *grade5;
    IBOutlet UITextField *grade6;
    IBOutlet UITextField *grade7;
    IBOutlet UITextField *grade8;
    IBOutlet UITextField *grade9;
    IBOutlet UITextField *cred1;
    IBOutlet UITextField *cred2;
    IBOutlet UITextField *cred3;
    IBOutlet UITextField *cred4;
    IBOutlet UITextField *cred5;
    IBOutlet UITextField *cred6;
    IBOutlet UITextField *cred7;
    IBOutlet UITextField *cred8;
    IBOutlet UITextField *cred9;
    double grossGPA;
    double creds;
    double finalGPA;
}

- (IBAction)calculate:(id)sender;

@end
