//
//  YYTabBarViewController.m
//  YYSub
//
//  Created by Seasons on 2020/12/10.
//

#import "YYTabBarViewController.h"

#import "YYHomeViewController.h"
#import "YYMineViewController.h"
#import "YYTabBar.h"

@interface YYTabBarViewController ()<YYTabBarDelegate>

@end

@implementation YYTabBarViewController

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

    [self.tabBar addSubview:[YYTabBar sharedInstace]];
    [YYTabBar sharedInstace].delegate = self;

    self.selectedIndex = 0;
}
- (void)initControllers{
    YYHomeViewController *homeVC = [[YYHomeViewController alloc] init];
    YYMineViewController *mineVC = [[YYMineViewController alloc] init];

    UINavigationController *homeNaviVC = [[UINavigationController  alloc] initWithRootViewController: homeVC];
    UINavigationController *mineNaviVC = [[UINavigationController  alloc] initWithRootViewController: mineVC];

    self.viewControllers = @[homeNaviVC,mineNaviVC];

}

#pragma mark - YYTabBarDelegate
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
