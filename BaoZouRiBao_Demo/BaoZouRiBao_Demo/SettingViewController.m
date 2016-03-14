//
//  SettingViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/12.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
{
    UITableView * setTableView ;
    
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    UINavigationController * settingNav  = [[UINavigationController alloc]initWithRootViewController:self];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"side_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuPop:)];
    
    [CommonTool contentViewController:settingNav];

    
    setTableView  = [[UITableView alloc]initWithFrame:self.view.bounds];
    setTableView.dataSource = self ;
    setTableView.delegate = self;
    [self.view addSubview:setTableView];
    
    
}

//打开左侧菜单
- (void)menuPop:(id)sender
{
    MVYSideMenuController * liftMenuControll = [self sideMenuController];
    if (liftMenuControll)
    {
        [liftMenuControll openMenu];
    }
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 5)
    {
        return 3 ;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectMake(0, tableView.bounds.size.width, 0, 22)];
    [switchview addTarget:self action:@selector(switchAtIndexPath:) forControlEvents:UIControlEventValueChanged];
//    switchview.tag = indexPath.section ;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    switch (indexPath.section)
    {
        case 0:
        {
            cell.accessoryView = switchview;
            cell.textLabel.text = @"自动离线下载";
        }
            break;
        case 1:
        {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
            cell.textLabel.text = @"缩略图模式";
        }
            break;
        case 2:
        {
            cell.accessoryView = switchview;
            cell.textLabel.text = @"文章大号字";
        }
            break;
        case 3:
        {
            cell.detailTextLabel.text = @"已开启";
            cell.textLabel.text = @"新消息通知";
        }
            break;
        case 4:
        {
            cell.detailTextLabel.text = @"缓存数据?M";
            cell.textLabel.text = @"清空缓存";
        }
            break;
        case 5:
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    cell.textLabel.text = @"反馈和帮助";
                }
                    break;
                case 1:
                {
                    cell.textLabel.text = @"给我们评分";
                }
                    break;
                case 2:
                {
                    cell.textLabel.text = @"分享暴走日报";
                }
                    break;
                default:
                    break;
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
        }
            break;
        case 6:
        {
            cell.detailTextLabel.text = @"2.9.1.14422";
            cell.textLabel.text = @"版本信息";
        }
        default:
            break;
    }

    return cell ;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
     NSString * sectionTitle ;
    switch (section)
    {
        case 0:
        {
            sectionTitle = @"在Wi-Fi下打开暴走日报,自动下载最新内容";
        }
            break;
        case 1:
        {
            sectionTitle = @"阅读文章时高清图片和GIF动画将优先下载缩略图";
        }
            break;
        case 3:
        {
            sectionTitle = @"请在iPhone的'设置' - '通知'中进行修改";
        }
            break;

        default:
            break;
    }
    
       return sectionTitle ;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSString *sectionTitle = [self tableView:tableView titleForFooterInSection:section];
    if (sectionTitle == nil)
    {
        return nil;
    }
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(12, 0, 300, 22);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:10];
    label.text = sectionTitle;
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
    sectionView.backgroundColor  = [UIColor groupTableViewBackgroundColor];
    [sectionView addSubview:label];
    return sectionView;
}






- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    if (section == 3&&section == 5&&section == 6&&section == 7)
    {
        return 0 ;
    }
    return 22;
}

- (void)switchAtIndexPath:(id)sender
{

    UISwitch *switchView = (UISwitch *)sender;
    
    if ([switchView isOn])
    {
        NSLog(@"打开开关");
    }
    else
    {
        NSLog(@"关闭开关");
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
