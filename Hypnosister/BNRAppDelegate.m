//
//  BNRAppDelegate.m
//  Hypnosister
//
//  Created by Matthew Linaberry on 8/30/14.
//  Copyright (c) 2014 Matthew Linaberry. All rights reserved.
//

#import "BNRAppDelegate.h"
#import "BNRHypnosisView.h"

@interface BNRAppDelegate () <UIScrollViewDelegate>
@property (strong, nonatomic) BNRHypnosisView *outView;
@end

@implementation BNRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    
    // create some rects for frames
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    
    bigRect.size.width *= 2.0;  // double me!
    bigRect.size.height *= 2.0;
    
    UIScrollView *_scrollView = [[UIScrollView alloc] initWithFrame:screenRect];

    [self.window addSubview:_scrollView];
    
    self.outView = [[BNRHypnosisView alloc ] initWithFrame:bigRect];
    [_scrollView addSubview:self.outView];
    
    screenRect.origin.x += screenRect.size.width;
        _scrollView.pagingEnabled = NO;
        _scrollView.delegate = self;
        _scrollView.minimumZoomScale = 0.5;
        _scrollView.maximumZoomScale = 3.0;
    _scrollView.contentSize = bigRect.size;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)aView
{
    return self.outView;
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
