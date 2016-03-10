//
//  CommonTool.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/9.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool

//根视图跳转到当前导航页
+(void)contentViewController:(UIViewController *)selfNavigationController
{
//    UINavigationController * rankingList = [[UINavigationController alloc]initWithRootViewController:self];
    
    //导航条颜色
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor colorWithRed:251/255.0 green:75/255.0 blue:85/255.0 alpha:1.0];
    //导航条字体颜色
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    
    LiftSideMenuViewController * liftMenuList = [[LiftSideMenuViewController alloc]init];
    MVYSideMenuOptions *options = [[MVYSideMenuOptions alloc] init];
    
    MVYSideMenuController * sideMenu = [[MVYSideMenuController alloc]                             initWithMenuViewController:liftMenuList
                                                                                                       contentViewController:selfNavigationController
                                                                                                                     options:options];
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController = sideMenu;

}

@end
