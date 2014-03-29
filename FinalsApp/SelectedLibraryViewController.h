//
//  SelectedLibraryViewController.h
//  FinalsApp
//
//  Created by Bori on 3/23/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedLibraryViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property(nonatomic, strong) NSString *labelText;
@property(nonatomic, strong) NSString *imageName;
@property(nonatomic, strong) NSString *textViewText;

@end
