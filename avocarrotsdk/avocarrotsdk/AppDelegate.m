//
//  AppDelegate.m
//  avocarrotsdk
//
//  Created by Ajeet Singh on 5/24/13.
//  Copyright (c) 2013 Ajeet Singh. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate
@synthesize strDeviceToken;


- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge
     |UIRemoteNotificationTypeAlert
     |UIRemoteNotificationTypeSound];

    
    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.viewController = [[[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil] autorelease];
    }
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}



#pragma mark - didRegisterForRemoteNotificationsWithDeviceToken
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
	// You can send here, for example, an asynchronous HTTP request to your web-server to store this deviceToken remotely.
    
	NSLog(@"Did register for remote notifications: %@", deviceToken);
    
    //   strDeviceToken = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    //   strDeviceToken = [strDeviceToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //   strDeviceToken=[@"" stringByAppendingFormat:@"%@",strDeviceToken];
    
    [self setStrDeviceToken: [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]]];
    [self setStrDeviceToken:[strDeviceToken stringByReplacingOccurrencesOfString:@" " withString:@""]];
    //
    //
    //    strDeviceUDID=[@"" stringByAppendingFormat:@"%@",[[UIDevice currentDevice] uniqueIdentifier]];
    //
    //
    //
    NSLog(@"strDeviceToken %@",strDeviceToken);
    //    NSLog(@"strDeviceUDID %@",strDeviceUDID);

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
