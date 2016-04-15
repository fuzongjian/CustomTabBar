//
//  HomeTabBarController.m
//  CustomTabBar
//
//  Created by 陈舒澳 on 16/4/15.
//  Copyright © 2016年 xingbida. All rights reserved.
//

#import "HomeTabBarController.h"
#import "CustomTabBar.h"
@interface HomeTabBarController ()<CustomTabBarDelegate>
@end
@implementation HomeTabBarController

- (void)viewDidLoad{
    NSLog(@"2");
    CustomTabBar * tabBar = [[CustomTabBar alloc] init];
    tabBar.customDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
}
-(void)CustomTabBarButtonClicked:(CustomTabBar *)tabBar{
    NSLog(@"CustomTabBarButtonClicked");
}
- (void)awakeFromNib{
    NSLog(@"1");
}
@end
