//
//  YYSubOpen.m
//  YYSubFramework
//
//  Created by Seasons on 2020/12/10.
//

#import "YYSubOpen.h"
#import "YYTabBarViewController.h"

@implementation YYSubOpen

//跳转视图
- (UITabBarController *)openSubApp {
    return (UITabBarController *)[[YYTabBarViewController alloc] init];
}

//配置内容
- (void)configSetting {
    // 配置一些三方设置
    // 账号是否连通
    // 。。。。
}
@end
