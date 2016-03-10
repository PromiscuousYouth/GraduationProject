//
//  AppDelegate.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/2.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MVYSideMenuController.h"
#import "LiftSideMenuViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //
     self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   
    ViewController * vc = [[ViewController alloc]init];

   UINavigationController * mainNav = [[UINavigationController alloc]initWithRootViewController:vc] ;
    //导航条颜色
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithRed:251/255.0 green:75/255.0 blue:85/255.0 alpha:1.0];
    //导航条字体颜色
    bar.tintColor = [UIColor whiteColor];
    
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    LiftSideMenuViewController * liftMenuList = [[LiftSideMenuViewController alloc]init];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    MVYSideMenuOptions *options = [[MVYSideMenuOptions alloc] init];
    MVYSideMenuController * sideMenu = [[MVYSideMenuController alloc]                             initWithMenuViewController:liftMenuList
                                                                                         contentViewController:mainNav
                                                                                                  options:options];
    
    
    
    
    self.window.rootViewController = sideMenu ;
    [self.window makeKeyAndVisible];
    
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
