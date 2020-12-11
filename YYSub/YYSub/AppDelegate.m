//
//  AppDelegate.m
//  YYSub
//
//  Created by Seasons on 2020/12/10.
//

#import "AppDelegate.h"

#import "YYTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initRootVC];
    [self initSVP];
    return YES;
}
- (void)initRootVC {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    YYTabBarViewController *tabbar = [[YYTabBarViewController alloc] init];
    self.window.rootViewController = tabbar;
}
- (void)initSVP {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setBackgroundLayerColor:[UIColor blackColor]];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0f];
    [SVProgressHUD setMaximumDismissTimeInterval:1.0f];
    [SVProgressHUD setCornerRadius:6.0f];
    [SVProgressHUD setErrorImage:[UIImage imageNamed:@""]];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@""]];
}



@end
