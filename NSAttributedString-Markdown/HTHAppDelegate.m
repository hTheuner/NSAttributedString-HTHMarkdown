//
//  HTHAppDelegate.m
//  NSAttributedString-Markdown
//
//  Created by Theuner, Heiko on 12/10/14.
//  Copyright (c) 2014 Theuner, Heiko. All rights reserved.
//

#import "HTHAppDelegate.h"
#import "HTHViewController.h"

@implementation HTHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[HTHViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
