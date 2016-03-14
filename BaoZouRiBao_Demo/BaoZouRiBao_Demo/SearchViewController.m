//
//  SearchViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/10.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
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
    
    
    myTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    
    myTableView.dataSource = self ;
    myTableView.delegate = self ;
    
    
    [myTableView registerNib:[UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    
    [self.view addSubview:myTableView];
    
    
    //SearchBar
    
    mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    //搜索框的风格
    mySearchBar.barStyle = UIBarStyleDefault ;
    mySearchBar.placeholder = @"搜点什么捏?";
    mySearchBar.delegate = self ;
    
//    searchController = [[UISearchController alloc]init];
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    [headView addSubview:mySearchBar];
    myTableView.tableHeaderView = headView ;


    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return searchDataArr.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor clearColor];
    cell.titleName.textColor = [UIColor blackColor];
    cell.titleName.text = searchDataArr[indexPath.section];
    
    [cell.pictureImgView sd_setImageWithURL:[NSURL URLWithString:@"http://"]placeholderImage:[UIImage imageNamed:@"Dark_Image_Preview.jpg"]];
    
    return cell ;
}
//点击Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    NSLog(@"%ld",(long)indexPath.row);
    DetailViewController * detailVC = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
    [mySearchBar resignFirstResponder];
    
    
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




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90 ;
}


//取消键盘第一响应
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [mySearchBar endEditing:YES];
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"点击了搜索按钮");
    //取消键盘第一响应
    [searchBar resignFirstResponder];
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"开始编辑");
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"结束编辑");
    NSLog(@"%@",searchBar.text);
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"正在输入...");
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"点击返回");
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
