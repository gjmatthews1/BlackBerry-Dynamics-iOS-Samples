//////////////////////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2020 BlackBerry Limited. All Rights Reserved.
// Some modifications to the original from https://github.com/acmacalister/jetfire
//
//  AppDelegate.m
//  WebSocket
//
//  Created by Austin and Dalton Cherry on on 2/24/15.
//  Copyright (c) 2014-2017 Austin Cherry.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//////////////////////////////////////////////////////////////////////////////////////////////////

#import "AppDelegate.h"
#import "WebSocketGDiOSDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



/**
    Remember to change the application ID and version on Info.plist
*/

                        
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [WebSocketGDiOSDelegate sharedInstance].appDelegate = self;
    [[GDiOS sharedInstance] authorize:[WebSocketGDiOSDelegate sharedInstance]];
                                
                            

     return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)didAuthorize {

    NSLog(@"%s", __FUNCTION__);					
                            
}


@end
