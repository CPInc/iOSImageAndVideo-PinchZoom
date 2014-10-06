//
//  AppDelegate.m
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#define viewItemSize CGSizeMake(120.0f, 150.0f)
#define padding UIEdgeInsetsMake(25.0f, 25.0f, 25.0f, 25.0f);

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.sectionInset = padding;
    flowLayout.itemSize = viewItemSize;

    MainViewController *mainVC = [[MainViewController alloc] initWithCollectionViewLayout:flowLayout];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainVC];

    [self.window setRootViewController:navController];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
