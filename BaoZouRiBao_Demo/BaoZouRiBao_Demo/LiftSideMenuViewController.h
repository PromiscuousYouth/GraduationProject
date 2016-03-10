//
//  LiftSideMenuViewController.h
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/8.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiftSideMenuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    UITableView * menuTableView;
}
@property (nonatomic,strong)NSArray * menuList;
@property (nonatomic,strong)NSArray * imgMenu ;
@end
