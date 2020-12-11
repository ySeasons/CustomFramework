//
//  UIDevice+YUIDevice.h
//  ZXSecurity
//
//  Created by Seasons on 2018/12/11.
//  Copyright © 2018年 zhongxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (YUIDevice)
//电池电量
+ (CGFloat)deviceBarrery;
//app版本
+ (NSString *)appVerson;
//device信息
+ (NSString *)deviceModel;
// 获取 对角线长度比 iphone6 为基
+ (CGFloat)deviceScale;
@end

NS_ASSUME_NONNULL_END
