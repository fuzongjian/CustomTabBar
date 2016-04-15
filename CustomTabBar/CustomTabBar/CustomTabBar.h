//
//  CustomTabBar.h
//  DrawerDemo
//
//  Created by 陈舒澳 on 16/3/31.
//  Copyright © 2016年 FZJ.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomTabBar;
#pragma mark --- CustomTabBar继承自UITabBar，所以CustomTabBar的代理必须遵守UITabBar的代理协议
@protocol CustomTabBarDelegate <UITabBarDelegate>
-(void)CustomTabBarButtonClicked:(CustomTabBar *)tabBar;
@end
@interface CustomTabBar : UITabBar
@property (nonatomic,weak) id<CustomTabBarDelegate>customDelegate;
@end
