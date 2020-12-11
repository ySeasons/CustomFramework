//
//  YYSubOpen.h
//  YYSubFramework
//
//  Created by Seasons on 2020/12/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYSubOpen : NSObject

//跳转视图
- (UITabBarController *)openSubApp;

//配置内容
- (void)configSetting;

@end

NS_ASSUME_NONNULL_END
