//
//  RankingListViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/9.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "RankingListViewController.h"

@interface RankingListViewController ()
{
    NSInteger buttonIndex ;
}
@end

@implementation RankingListViewController


//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:YES];
//    
//    
//}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"排行榜";
    
    //根视图跳转当前页
    UINavigationController * rankingList = [[UINavigationController alloc]initWithRootViewController:self];
    
    [CommonTool contentViewController:rankingList];

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"side_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuPop:)];
    
}


- (void)loadData
{
    self.menuTitles = @[@"阅读", @"赞", @"评论"];
    
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

#pragma mark - push
//

#pragma mark - ZWSPagingViewDataSource

- (ZWSPage *)pagingView:(ZWSPagingView *)pagingView pageForIndex:(NSUInteger)index
{
    ZWSPage *page = [super pagingView:pagingView pageForIndex:index];
    
    buttonIndex = index ;
    
    return page;
}

- (UIView *)contentViewForPage:(ZWSPage *)page atIndex:(NSInteger)index
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:page.bounds];
    tableView.dataSource = self;
    tableView.delegate = self ;
    
    [tableView registerNib:[UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    tableView.rowHeight = 90 ;
    
    return tableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 12;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor clearColor];
    cell.titleName.textColor = [UIColor blackColor];
    cell.titleName.text = @"排行榜......";
    
    [cell.pictureImgView sd_setImageWithURL:[NSURL URLWithString:@"http://"]placeholderImage:[UIImage imageNamed:@"Dark_Image_Preview.jpg"]];
    
    return cell;
}

//点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%ld",(long)indexPath.row);
    if (buttonIndex == 0)
    {
        DetailViewController * detailVC = [[DetailViewController alloc]init];
        [self.navigationController pushViewController:detailVC animated:YES];
        
    }
    
}
//返回区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3.0;
    
}
//返回区尾高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 7.0;
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
