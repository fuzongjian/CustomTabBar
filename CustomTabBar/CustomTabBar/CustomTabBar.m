//
//  CustomTabBar.m
//  DrawerDemo
//
//  Created by 陈舒澳 on 16/3/31.
//  Copyright © 2016年 FZJ.com. All rights reserved.
//

#import "CustomTabBar.h"
@interface CustomTabBar ()
@property (nonatomic,strong) UIButton * Button;
@end
@implementation CustomTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIButton * button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
        [button addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.Button = button;
    }
    return self;
}
#pragma mark --- 按钮点击事件的代理
- (void)ButtonClicked:(UIButton *)sender{
    if ([self.customDelegate conformsToProtocol:@protocol(CustomTabBarDelegate)] && [self.customDelegate respondsToSelector:@selector(CustomTabBarButtonClicked:)]) {
        [self.customDelegate CustomTabBarButtonClicked:self];
    }
}
#pragma mark --- 调用父类 重新布局
-(void)layoutSubviews{
    [super layoutSubviews];
    //按钮的位置
    self.Button.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    //设置其他按钮的的frame
    CGFloat tabBarW = self.frame.size.width / 5;
    CGFloat tabBarIndex = 0;
    for (UIView * view in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.frame = CGRectMake(tabBarIndex * tabBarW, view.frame.origin.y, tabBarW, view.frame.size.height);
            tabBarIndex ++;
            if (tabBarIndex == 2) {
                tabBarIndex ++;
            }
        }
    }
}
@end
