//
//  YTabViewController.m
//  YYMain
//
//  Created by Seasons on 2020/12/10.
//

#import "YTabViewController.h"
#import "YYMainViewController.h"
#import "YYMineViewController.h"
#import "YYMessageViewController.h"
#import "YTabBar.h"
@interface YTabViewController ()<YTabBarDelegate>

@end

@implementation YTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initTabBarDefault];
    [self initControllers];
    [self addTabBar];

}
- (void)initTabBarDefault{
    if (@available(iOS 13.0, *)) {
        UITabBarAppearance *appearance = [UITabBarAppearance new];
        appearance.backgroundColor = [UIColor whiteColor];
        appearance.backgroundImage = [UIImage new];
        appearance.shadowImage = [UIImage new];
        appearance.shadowColor = [UIColor clearColor];
        self.tabBar.standardAppearance = appearance;
    } else {
        // Fallback on earlier versions
        self.tabBar.shadowImage = [UIImage new];
        self.tabBar.backgroundImage = [UIImage new];
    }
}
- (void)addTabBar{

    [self.tabBar addSubview:[YTabBar sharedInstace]];
    [YTabBar sharedInstace].delegate = self;

    self.selectedIndex = 0;
}
- (void)initControllers{
    YYMainViewController *homeVC = [[YYMainViewController alloc] init];
    YYMessageViewController *messageVC = [[YYMessageViewController alloc] init];
    YYMineViewController *mineVC = [[YYMineViewController alloc] init];

    UINavigationController *homeNaviVC = [[UINavigationController  alloc] initWithRootViewController: homeVC];
    UINavigationController *messageNaviVC = [[UINavigationController  alloc] initWithRootViewController: messageVC];
    UINavigationController *mineNaviVC = [[UINavigationController  alloc] initWithRootViewController: mineVC];

    self.viewControllers = @[homeNaviVC,messageNaviVC,mineNaviVC];

}

#pragma mark - YTabBarDelegate
- (void)tabBarSelectIndex:(NSInteger)index{
    if (self.selectedIndex != index) {
        self.selectedIndex = index;
    }else{

    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
