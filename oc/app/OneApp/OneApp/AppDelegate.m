//
//  AppDelegate.m
//  OneApp
//
//  Created by lijunjie on 29/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "AppDelegate.h"
#import "QuizViewController.h"
#import "RHypnosisView.h"
#import <Foundation/Foundation.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void) handleQuiz {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    QuizViewController *quizVC = [ [ QuizViewController alloc ] init ];
    self.window.rootViewController = quizVC;
    self.window.backgroundColor = [ UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

- (void) handleFirstView {
    self.window = [[ UIWindow alloc ] initWithFrame:[[UIScreen mainScreen] bounds]];
    CGRect firstFrame = CGRectMake(160,240,100,150);
    
    UIViewController *vc = [[UIViewController alloc]initWithNibName:nil
                                                             bundle:nil];
    self.window.rootViewController = vc;
    
    
    RHypnosisView *firstView = [ [ RHypnosisView alloc] initWithFrame: firstFrame];
    firstView.backgroundColor = [UIColor redColor];
    [self.window addSubview:firstView];
    CGRect secondFrame = CGRectMake(-10,-20,100,50);
    CGRect secondBound = CGRectMake(0, 0, 50, 50);

    RHypnosisView *secondView = [ [ RHypnosisView alloc] initWithFrame: secondFrame];
    secondView.backgroundColor = [UIColor blueColor];
    [secondView setBounds:secondBound];
    [firstView addSubview:secondView];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self handleFirstView];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
