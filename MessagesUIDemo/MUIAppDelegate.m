//
//  MUIAppDelegate.m
//  MessagesUIDemo
//
//  Created by Atsushi Nagase on 7/3/12.
//  Copyright (c) 2012 LittleApps Inc. All rights reserved.
//

#import "MUIAppDelegate.h"
#import "MUIExampleTableViewController.h"

@implementation MUIAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  MUIExampleTableViewController *vc = [[MUIExampleTableViewController alloc] init];
  self.window.rootViewController = vc;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
