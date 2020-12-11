//
//  YYTabBar.h
//  YYSub
//
//  Created by Seasons on 2020/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YYTabBarDelegate <NSObject>
@optional
- (void)tabBarSelectIndex:(NSInteger)index;
@end

@interface YYTabBar : UIView
+ (YYTabBar*)sharedInstace;

@property (nonatomic,assign)id<YYTabBarDelegate> delegate;
@property (nonatomic,assign)NSInteger selectIndex;

@end


NS_ASSUME_NONNULL_END
