//
//  UIColor+YUIColor.m
//  ZXOnline
//
//  Created by Seasons on 2018/7/4.
//  Copyright © 2018年 zhongxiao. All rights reserved.
//

#import "UIColor+YUIColor.h"

@implementation UIColor (YUIColor)
+ (UIColor*) colorWithHex:(NSInteger)hexValue{
    return [UIColor colorWithHex:hexValue alpha:1.0f];
}

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}
+ (CAGradientLayer *)setChangingColor:(UIView *)view fromColor:(NSInteger)fromHexValue toColor:(NSInteger)toHexValue alpha:(CGFloat)alpha type:(ChangingColorType)type{
    // CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds; // 创建渐变色数组，需要转换为CGColor颜色
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithHex:fromHexValue alpha:alpha].CGColor,(__bridge id)[UIColor colorWithHex:toHexValue alpha:alpha].CGColor];
    // 设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    CGFloat s_x = 0,s_y = 0,e_x = 0,e_y = 0;
    switch (type) {
        case ChangingColorLeftRight:{
            s_x = 0;s_y = 0;e_x = 1;e_y = 0;
        }
            break;
        case ChangingColorUpDown:{
            s_x = 0;s_y = 0;e_x = 0;e_y = 1;
        }
            break;
        case ChangingColorLeftUp:{
            s_x = 0;s_y = 0;e_x = 1;e_y = 1;
        }
            break;
        case ChangingColorLeftDown:{
            s_x = 0;s_y = 1;e_x = 1;e_y = 0;
        }
            break;

        default:
            break;
    }
    gradientLayer.startPoint = CGPointMake(s_x, s_y);
    gradientLayer.endPoint = CGPointMake(e_x, e_y);
    // 设置颜色变化点，取值范围 0.0~1.0
    gradientLayer.locations = @[@0,@1];
    return gradientLayer;

}
@end
