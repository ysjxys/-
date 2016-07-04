//
//  AppDelegate.m
//  LDZMoviewPlayer_Xib
//
//  Created by rongxun02 on 15/11/24.
//  Copyright © 2015年 DongZe. All rights reserved.
//

#import "AppDelegate.h"
#import "LDZMoviePlayerController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    LDZMoviePlayerController *moviewPlayerVC = [[LDZMoviePlayerController alloc] init];
//    self.window.rootViewController = moviewPlayerVC;
//    /*
//    //  播放本地
//    moviewPlayerVC.movieURL = [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"5540385469401b10912f7a24-6.mp4"]];
//    */
//    
//    //  播放网络
//    NSString *urlString = @"http://mw5.dwstatic.com/2/4/1529/134981-99-1436844583.mp4";
//    NSURL *URL = [NSURL URLWithString: urlString];
//    moviewPlayerVC.movieURL = URL;
    
    UIWindow *window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    
    ViewController *vc= [[ViewController alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
    window.rootViewController = nvc;
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com