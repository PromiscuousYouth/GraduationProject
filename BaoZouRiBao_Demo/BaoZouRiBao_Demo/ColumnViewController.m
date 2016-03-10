//
//  ColumnViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/9.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "ColumnViewController.h"

@interface ColumnViewController ()

@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    UINavigationController *
    UINavigationController * columnNav  = [[UINavigationController alloc]initWithRootViewController:self];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"side_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuPop:)];
    
    [CommonTool contentViewController:columnNav];
//    self.view.backgroundColor = [UIColor redColor];
    self.title = @"栏目";
    
    UITableView * columnTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    
    columnTableView.dataSource = self ;
    columnTableView.delegate = self ;
    
    [columnTableView registerNib:[UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    columnTableView.rowHeight = 90 ;
    
    [self.view addSubview:columnTableView];
    
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
    return 36 ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor clearColor];
    cell.titleName.textColor = [UIColor blackColor];
    cell.titleName.text = @"栏目.....";
    
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
