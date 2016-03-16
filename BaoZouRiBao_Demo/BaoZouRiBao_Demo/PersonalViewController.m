//
//  PersonalViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/10.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "PersonalViewController.h"
//表头高度
#define MENUTABLEHEAD 200
@interface PersonalViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * personalTableView ;
    //任务数组
    NSArray * taskArray ;
}
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"个人";
    
    UINavigationController * personalNav = [[UINavigationController alloc]initWithRootViewController:self];
    
    [CommonTool contentViewController:personalNav];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"side_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuPop:)];
    
    personalTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    personalTableView.dataSource = self ;
    personalTableView.delegate = self ;
    
    [self.view addSubview:personalTableView];
    taskArray = @[@"每日签到",@"阅读文章",@"发表评论",@"点赞文章",@"点赞评论",@"分享评论"];
    
    
    
    //表头
    UIImageView * personalHeadView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), MENUTABLEHEAD)];
    
    
    personalHeadView.image = [UIImage imageNamed:@"bg_profile.jpg"];
    
    personalTableView.tableHeaderView = personalHeadView ;
    //头像按钮
    UIButton * pictureHead = [[UIButton alloc]init];
    //用户名
    UIButton * loginButton = [[UIButton alloc]init];
    pictureHead.center = personalTableView.tableHeaderView.center ;
    
    //登录状态
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    //登录后
    [loginButton setTitle:[NSString stringWithFormat:@"用户名"] forState:UIControlStateSelected];
    
    [pictureHead sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"avarta_l.jpg"]];
    
    
    pictureHead.bounds = CGRectMake(0, 0, CGRectGetWidth(personalTableView.tableHeaderView.bounds)/4,CGRectGetWidth(personalTableView.tableHeaderView.bounds)/4);
    
    loginButton.frame = CGRectMake(pictureHead.frame.origin.x, pictureHead.frame.origin.y + pictureHead.frame.size.height, CGRectGetWidth(pictureHead.bounds), 30);
    [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    //设置头像按钮为圆角
    pictureHead.layer.cornerRadius = CGRectGetWidth(pictureHead.bounds)/2;
    pictureHead.layer.masksToBounds = YES ;
    //点击头像和用户名
    [pictureHead addTarget:self action:@selector(tapHeadClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginButton addTarget:self action:@selector(tapHeadClick:) forControlEvents:UIControlEventTouchUpInside];
    //添加点击手势
    UITapGestureRecognizer * tapHeadGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeadClick:)];
    
    [personalTableView.tableHeaderView addGestureRecognizer:tapHeadGesture];
    [personalTableView.tableHeaderView addSubview:pictureHead];
    [personalTableView.tableHeaderView addSubview:loginButton];

    
    
    
}

#pragma mark -- UITableViewDataSource && UITableViewDelegate
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 6 ;
    }
    else
    {
        return 1 ;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectMake(0, tableView.bounds.size.width, 0, cell.bounds.size.height)];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    if (indexPath.section == 0)
    {
        cell.textLabel.text = taskArray[indexPath.row];
        cell.detailTextLabel.text = @"未完成";
        cell.detailTextLabel.textColor = [UIColor redColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:10];
    }
    else
    {
        cell.textLabel.text = @"任务完成提示";
        cell.accessoryView = switchview ;
    }
    return cell ;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width , 22)];
    sectionView.backgroundColor  = [UIColor groupTableViewBackgroundColor];
    if (section == 0)
    {
        UILabel *label1 = [[UILabel alloc] init];
        label1.frame = CGRectMake(12, 0, sectionView.bounds.size.width/2 - 12, 22);
        label1.backgroundColor = [UIColor clearColor];
        label1.textColor = [UIColor blackColor];
        label1.font = [UIFont systemFontOfSize:10];
        label1.text = @"每日任务";
        [sectionView addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc] init];
        label2.frame = CGRectMake(CGRectGetWidth(sectionView.bounds)/2, 0, sectionView.bounds.size.width /2 - 12, 22);
        label2.backgroundColor = [UIColor clearColor];
        label2.textColor = [UIColor blackColor];
        label2.font = [UIFont systemFontOfSize:10];
        label2.text = @"任务介绍 >";
        label2.textAlignment = NSTextAlignmentRight ;
        [sectionView addSubview:label2];
        //添加手势方法
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
        
        [sectionView addGestureRecognizer:tapGesture];
        
    }
    
    
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 22 ;
    }
    return 10 ;
}

- (void)menuPop:(id)sender
{
    MVYSideMenuController * liftMenuControll = [self sideMenuController];
    if (liftMenuControll)
    {
        [liftMenuControll openMenu];
    }
}
- (void)tapClick:(id)sender
{
    NSLog(@"点击了任务介绍");
}

- (void)tapHeadClick:(id)sender
{
    NSLog(@"点击登录..");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0)
    {
        
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
