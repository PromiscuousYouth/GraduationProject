//
//  LiftSideMenuViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/8.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//


#import "LiftSideMenuViewController.h"
#import "MVYSideMenuController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "RankingListViewController.h"
//表头高度
#define MENUTABLEHEAD 200
@interface LiftSideMenuViewController ()



@end

@implementation LiftSideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //左侧菜单的数组
    self.menuList = @[@"首页",@"排行榜",@"栏目",@"搜索",@"设置",@"离线下载"];
    self.imgMenu = @[@"side_setting_icon.png",@"forward_copy.png",@"forward_mail.png",@"row_password.png",@"row_username.png",@"set_ico_safe.png"];
    //夜间模式单独写
    
    
    menuTableView = [[UITableView alloc]init];
    //菜单frame
    menuTableView.frame = CGRectMake(0, 0,self.view.bounds.size.width - self.view.bounds.size.width/8-10 , self.view.bounds.size.height);
    
    menuTableView.dataSource = self;
    menuTableView.delegate = self ;
    

    //表头
    UIView * menuTableHeadV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), MENUTABLEHEAD)];
    menuTableHeadV.backgroundColor = [UIColor colorWithRed:251/255.0 green:75/255.0 blue:85/255.0 alpha:1.0];
    
     menuTableView.tableHeaderView = menuTableHeadV ;
    //头像按钮
    UIButton * pictureHead = [[UIButton alloc]init];
    
    pictureHead.center = menuTableView.tableHeaderView.center ;
    
//    pictureHead.bounds = CGRectMake(0, 0, CGRectGetWidth(menuTableView.tableHeaderView.bounds)/4,CGRectGetHeight(menuTableView.tableHeaderView.bounds)/3);
    pictureHead.bounds = CGRectMake(0, 0, CGRectGetWidth(menuTableView.tableHeaderView.bounds)/4,CGRectGetWidth(menuTableView.tableHeaderView.bounds)/4);
    
    pictureHead.backgroundColor = [UIColor blackColor];
    
    pictureHead.layer.cornerRadius = CGRectGetWidth(pictureHead.bounds)/2;
    pictureHead.layer.masksToBounds = YES ;
    
    
    
    [menuTableView.tableHeaderView addSubview:pictureHead];
    
   
    
    
    //左侧菜单的背景
    UIImageView * menuBG = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"buy_cheers.png"]];

    menuTableView.backgroundView = menuBG ;
    
    
    [self.view addSubview:menuTableView];
    
    
    //注册menutable
    [menuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"menuCell"];
    
    [menuTableView reloadData];

}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuList.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"menuCell" forIndexPath:indexPath];
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"menuCell"];
//    }
    cell.backgroundColor = [UIColor clearColor];
    NSString * item = [self.menuList objectAtIndex:indexPath.row];
    NSString * img = [self.imgMenu objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.text = item ;
    cell.imageView.image = [UIImage imageNamed:img];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
    
    return cell ;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    //跳转
    
    switch (indexPath.row)
    {
        case 0:
        {
//            //首页
            ViewController * vc = [[ViewController alloc]init];
             UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
            [[self sideMenuController] changeContentViewController:nav closeMenu:YES];
        }
            break;
        case 1:
        {
            RankingListViewController * rankingListVC = [[RankingListViewController alloc]init];
            [[self sideMenuController] changeContentViewController:rankingListVC closeMenu:YES];
        }
            break;
        case 2:
        {
            ColumnViewController * columnVC = [[ColumnViewController alloc]init];
            [[self sideMenuController] changeContentViewController:columnVC closeMenu:YES];
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
        case 6:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    
    
    
    
    NSLog(@"%ld",(long)indexPath.row);
}

//表尾不动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0)
    {
        scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
