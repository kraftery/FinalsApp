//
//  BusViewController.h
//  FinalsApp
//
//  Created by Bori on 3/23/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusViewController : UIViewController{

}

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property(nonatomic, strong) NSString *fullURL;
@end
