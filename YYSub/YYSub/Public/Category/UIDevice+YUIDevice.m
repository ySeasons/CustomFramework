//
//  UIDevice+YUIDevice.m
//  ZXSecurity
//
//  Created by Seasons on 2018/12/11.
//  Copyright © 2018年 zhongxiao. All rights reserved.
//

#import "UIDevice+YUIDevice.h"
@implementation UIDevice (YUIDevice)
//电池电量
+ (CGFloat)deviceBarrery{
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    float deviceLevel = [UIDevice currentDevice].batteryLevel*100;
    NSString *valueStr = [NSString stringWithFormat:@"%.2f",deviceLevel];
    return [valueStr floatValue];
}
//app版本
+ (NSString *)appVerson{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString * appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}
//device信息
+ (NSString *)deviceModel{
    return [[UIDevice currentDevice] model];
}
+ (CGFloat)deviceScale{
    CGFloat scale = 1.0;
    // 6 7 8
    if (KScreenWidth == 375 && KScreenHeight == 667) {
        scale = 1.0;
    }
    // 6 7 8 ps
    if (KScreenWidth == 414 && KScreenHeight == 736) {
        scale = 1.1;
    }
    // x xs
    if (KScreenWidth == 375 && KScreenHeight == 812) {
        scale = 1.0;
    }
    // xr  xsmax
    if (KScreenWidth == 414 && KScreenHeight == 896) {
        scale = 1.1;
    }
    return scale;
}
@end
