//
//  UIColor+YUIColor.h
//  ZXOnline
//
//  Created by Seasons on 2018/7/4.
//  Copyright © 2018年 zhongxiao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    ChangingColorLeftRight = 0, //左右
    ChangingColorUpDown,        //上下
    ChangingColorLeftUp,        //左上
    ChangingColorLeftDown,      //左下

}ChangingColorType;

@interface UIColor (YUIColor)
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (CAGradientLayer *)setChangingColor:(UIView *)view fromColor:(NSInteger)fromHexValue toColor:(NSInteger)toHexValue alpha:(CGFloat)alpha type:(ChangingColorType)type;
@end
