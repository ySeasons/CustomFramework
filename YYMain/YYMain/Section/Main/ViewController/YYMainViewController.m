//
//  YYMainViewController.m
//  YYMain
//
//  Created by Seasons on 2020/12/10.
//

#import "YYMainViewController.h"
@interface YYMainViewController ()
@end
@implementation YYMainViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.tabBarController.tabBar setHidden:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"首页";
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(50, 150, 200, 50);
    [button setTitle:@"跳转sub-App" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(goToSubApp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)goToSubApp{
    [self.tabBarController.tabBar setHidden:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    YYSubOpen *subApp = [[YYSubOpen alloc] init];
    [subApp configSetting];
    UITabBarController *tabVC = [subApp openSubApp];
    [self.navigationController pushViewController:tabVC animated:YES];
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
