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
  self.window.backgroundColor = [UIColor whiteColor];
  
  MUIExampleTableViewController *vc = [[MUIExampleTableViewController alloc] init];
  self.window.rootViewController = vc;
  
  UIImage *grayBG = [[UIImage imageNamed:@"ChatBubbleGray"] resizableImageWithCapInsets:UIEdgeInsetsMake(36, 38, 28, 38)];
  UIImageView *grayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 60, 300, 80)];
  [self.window addSubview:grayImageView];
  grayImageView.image = grayBG;
  UIImage *blueBG = [[UIImage imageNamed:@"ChatBubbleBlue"] resizableImageWithCapInsets:UIEdgeInsetsMake(36, 28, 28, 38)];
  UIImageView *blueImageView = [[UIImageView alloc] initWithFrame:CGRectMake(115, 160, 200, 150)];
  blueImageView.image = blueBG;
  [self.window addSubview:blueImageView];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
