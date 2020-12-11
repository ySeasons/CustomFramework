//
//  YTabBar.h
//  YYMain
//
//  Created by Seasons on 2020/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YTabBarDelegate <NSObject>
@optional
- (void)tabBarSelectIndex:(NSInteger)index;
@end

@interface YTabBar : UIView
+ (YTabBar*)sharedInstace;

@property (nonatomic,assign)id<YTabBarDelegate> delegate;
@property (nonatomic,assign)NSInteger selectIndex;

@end

NS_ASSUME_NONNULL_END
