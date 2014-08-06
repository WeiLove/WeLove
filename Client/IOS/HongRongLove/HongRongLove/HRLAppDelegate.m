//
//  HRLAppDelegate.m
//  HongRongLove
//
//  Created by chenwenhong on 14-7-5.
//  Copyright (c) 2014年 wenpkpk. All rights reserved.
//

#import "HRLAppDelegate.h"
#import "HRLLauncherViewController.h"
#import "Reachability.h"
#import "HRLNetWorkService.h"
#import "HRLUserLoginService.h"

@interface HRLAppDelegate()

@property(nonatomic, strong) Reachability *reachability;

@end

@implementation HRLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    HRLLauncherViewController *launcherVC = [[HRLLauncherViewController alloc] init];
    
    self.window.rootViewController = launcherVC;

    [self.window makeKeyAndVisible];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:@"MODIFYNETWORKSTATUS"
                                               object:nil];
    if (!self.reachability)
    {
        self.reachability = [Reachability reachabilityWithHostname:@"www.apple.com"];
        
        [self.reachability startNotifier];
    }
    
    return YES;
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
    [[HRLUserLoginService shareInstance] login];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)reachabilityChanged:(NSNotification*)notify
{
    if (self.reachability.isReachable)
    {
        //连接网络
        [HRLNetWorkService shareInstance].isReachable = YES;
        
        if (ReachableViaWiFi == [self.reachability currentReachabilityStatus])
        {
            //连接Wifi
            [HRLNetWorkService shareInstance].isWifi = YES;
            [HRLNetWorkService shareInstance].is3G = NO;
        }
        else
        {
            //连接3g
            [HRLNetWorkService shareInstance].isWifi = NO;
            [HRLNetWorkService shareInstance].is3G = YES;
        }
    }
    else
    {
        [HRLNetWorkService shareInstance].isReachable = NO;
        [HRLNetWorkService shareInstance].isWifi = NO;
        [HRLNetWorkService shareInstance].is3G = NO;
    }
}

@end
