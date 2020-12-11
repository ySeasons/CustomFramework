//
//  YTabBar.m
//  YYMain
//
//  Created by Seasons on 2020/12/10.
//

#import "YTabBar.h"

#define Titles @[@"首页",@"消息",@"我的"]
#define Imgs @[@"tab1_nor",@"tab2_nor",@"tab3_nor"]
#define SelImgs @[@"tab1_nor",@"tab2_nor",@"tab3_nor"]

@implementation YTabBar
+ (YTabBar*)sharedInstace {
    static dispatch_once_t onceToken;
    static YTabBar* tabBar;
    dispatch_once(&onceToken, ^{
        tabBar = [[YTabBar alloc] initWithFrame:CGRectMake(0,0,KScreenWidth,TABBAR_HEIGHT)];
    });
    return tabBar;
}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupTabBarView];
    }
    return self;
}
- (void)setupTabBarView {
    self.backgroundColor=[UIColor whiteColor];

    UIImageView* line = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,self.width,0.5f)];
    line.backgroundColor = [UIColor colorWithHex:0xdadada];
    [self addSubview:line];
    self.tag = -1;
    line.tag = -2;

    CGFloat cWidth = KScreenWidth / Titles.count;

    for (int i = 0; i < Titles.count; i ++) {
        UIView *conView = [[UIView alloc] init];
        conView.frame = CGRectMake(cWidth*i, 0, cWidth, 49);
        conView.tag = i;
        [self addSubview:conView];
        conView.userInteractionEnabled = YES;

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [conView addGestureRecognizer:tap];

        UIImageView *iconImgView = [[UIImageView alloc] init];
        iconImgView.frame = CGRectMake(cWidth/2-11, 6, 22, 22);
        iconImgView.contentMode = UIViewContentModeScaleToFill;
        iconImgView.image = [UIImage imageNamed:Imgs[i]];
        iconImgView.tag = 10+i;
        [conView addSubview:iconImgView];

        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 30, cWidth, 15);
        label.textColor = [UIColor colorWithHex:0x323232];
        label.text = Titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = Font(11);
        label.tag = 20+i;
        [conView addSubview:label];
        if (i == 0) {
            [self updateState:0];
        }

    }

}
- (void)updateState:(NSInteger)index{
    CGFloat cWidth = KScreenWidth / Titles.count;
    for (NSInteger i = 0; i < Titles.count; i ++) {
        UIView *conView = [self viewWithTag:i];
        if (conView == nil) {
            return;
        }
        UIImageView *iconImgView = [conView viewWithTag:10+i];
        UILabel *label = [conView viewWithTag:20+i];

        label.frame = CGRectMake(0, 30, cWidth, 15);
        iconImgView.frame = CGRectMake(cWidth/2-11, 6, 22, 22);
        if (index == i) {
            iconImgView.image = [UIImage imageNamed:SelImgs[i]];
            label.textColor = [UIColor colorWithHex:0xC41335];
            [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                iconImgView.frame = CGRectMake(cWidth/2-12, 5, 24, 24);
                label.frame = CGRectMake(0, 31, cWidth, 15);
            } completion:nil];
        } else {
            iconImgView.image = [UIImage imageNamed:Imgs[i]];
            label.textColor = [UIColor colorWithHex:0x323232];
        }
    }
}
- (void)tapClick:(UIGestureRecognizer *)tap{
    [self updateState:tap.view.tag];
    if (_delegate && [_delegate respondsToSelector:@selector(tabBarSelectIndex:)]) {
        [_delegate tabBarSelectIndex:tap.view.tag];
    }
}
- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    [self updateState:_selectIndex];
    if (_delegate && [_delegate respondsToSelector:@selector(tabBarSelectIndex:)]) {
        [_delegate tabBarSelectIndex:_selectIndex];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
