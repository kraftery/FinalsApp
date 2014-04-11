//
//  AppDelegate.m
//  FinalsApp
//
//  Created by Kieran Raftery on 3/17/14.
//  Copyright (c) 2014 Kieran Raftery. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch
    RootViewController *root = [[RootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:root];
    [[self window] setRootViewController:nav];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //nav bar appearance
    [[UINavigationBar appearance]
     setBarTintColor:[UIColor colorWithHue:0 saturation:1 brightness:.6 alpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //[[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back3.png"]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    [attributes setValue:[UIColor colorWithRed:(1.0f) green:(1.0f) blue:(1.0f) alpha:1.0f] forKey:NSForegroundColorAttributeName];
    [attributes setValue:[UIFont fontWithName:@"Avenir" size:21.0f] forKey:NSFontAttributeName];
    
    [[UINavigationBar appearance] setTitleTextAttributes: attributes];//for Title
    [[UIBarButtonItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];//for nav btn
    //If we choose to use bg img for navBar
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"emptyHeader_01_01.png"] forBarMetrics:UIBarMetricsDefault];    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

