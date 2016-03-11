//
//  SearchViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/10.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchBarDelegate>
{
    UISearchBar * mySearchBar ;
    
    NSMutableArray * searchDataArr ;
    UISearchController * searchController ;
    
    UITableView * myTableView ;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController * searchNav  = [[UINavigationController alloc]initWithRootViewController:self];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"side_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuPop:)];
    
    [CommonTool contentViewController:searchNav];
    //    self.view.backgroundColor = [UIColor redColor];
    self.title = @"搜索";

    
    searchDataArr = [[NSMutableArray alloc]init];
    [searchDataArr addObject:@"a"];
    [searchDataArr addObject:@"abc"];
    [searchDataArr addObject:@"abcd"];
    [searchDataArr addObject:@"abcde"];
    [searchDataArr addObject:@"abcdef"];
    [searchDataArr addObject:@"abcdefg"];
    //
    searchController = [[UISearchController alloc]initWithSearchResultsController:self];
    
    searchController.searchResultsUpdater = self ;
    searchController.searchBar.delegate = self ;
    
    myTableView.dataSource = self ;
    myTableView.delegate = self ;
    
    myTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:myTableView];
    
    myTableView.tableHeaderView = searchController.searchBar ;
    
    [myTableView registerNib:[UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
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
#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchText = searchController.searchBar.text;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self CONTAINS %@",[searchText lowercaseString]];
    
    //NSArray *arr =
    [searchDataArr filteredArrayUsingPredicate:predicate];
    //NSLog(@"%@",arr);
    
    
    [myTableView reloadData];
    
}
#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    //NSLog(@"%@",searchBar.scopeButtonTitles[selectedScope]);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return searchDataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor clearColor];
    cell.titleName.textColor = [UIColor blackColor];
    cell.titleName.text = @"这是搜索";
    
    [cell.pictureImgView sd_setImageWithURL:[NSURL URLWithString:@"http://"]placeholderImage:[UIImage imageNamed:@"Dark_Image_Preview.jpg"]];
    
    return cell ;
}
//点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%ld",(long)indexPath.row);
    DetailViewController * detailVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

//返回区头高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 3.0;
//    
//}
//返回区尾高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 7.0;
//}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90 ;
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
