//
//  CouponsViewController.h
//  FinalsApp
//
//  Created by Kieran Raftery on 3/18/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CouponsViewController : UIViewController<NSURLConnectionDelegate>{
    //UIImage *coupon;
    NSMutableData *responseData;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, strong) UIImage *c_image;
@property (nonatomic, strong) NSString *url;
@end
