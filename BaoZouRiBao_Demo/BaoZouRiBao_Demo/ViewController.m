//
//  ViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/2.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import "RecommendTableViewCell.h"
#import "VideoTableViewCell.h"

#import "UIImageView+WebCache.h"
#import "SDCycleScrollView.h"
#import "DetailViewController.h"
#import "MVYSideMenuController.h"

#define SCWIDTH  self.view.bounds.size.width
@interface ViewController ()
{
    UIScrollView * scrollView ;
    
    NSInteger buttonIndex ;
    //图片配文字
    NSArray *titles ;
    //网络请求图片URL数组
    NSArray *imagesURLStrings ;
}

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
    
//    self.title = @"暴走日报";
    
    if (buttonIndex == 0)
    {
        self.title = @"推荐";
    }
    else
    {
        self.title = @"视频";
    }
    
    
    //隐藏Nav
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//#warning Appdelegate 更改
    //右侧按钮
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"改变" style:UIBarButtonItemStylePlain target:self action:@selector(switchStyle:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_fav_enable.png"] style:UIBarButtonItemStyleDone target:self action:@selector(switchStyle:)];
    
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"side_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(liftMenuPop:)];

    
    
    //网络请求图片URL数组
    imagesURLStrings = @[@"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                         @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                         @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg",
                         @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                         @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                         @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    //图片配文字
    titles = @[@"新建交流QQ群：185534916 ",
               @"感谢您的支持，如果下载的",
               @"如果代码在使用过程中出现问题",
               @"您可以发邮件到gsdios@126.com",
               @"如果代码在使用过程中出现问题",
               @"您可以发邮件到gsdios@126.com"
               ];
                        
    
    
}
//ScrollView标题
- (void)loadData
{        
    self.menuTitles = @[@"推荐", @"视频"];
    
}

#pragma mark - Events

- (void)switchStyle:(id)sender
{
    // if you have a asynchronous loading requests data to refresh the slide page
    //    self.menuTitles = @[@"Drama", @"Family", @"Fantasy", @"Thriller", @"Horror", @"Comedy"];
    
    self.sectionBar.selectedTextColor = [UIColor blueColor];
    self.sectionBar.nomarlTextColor = [UIColor redColor];
    self.sectionBar.backgroundColor = [UIColor blackColor];
//    self.menuHeight = 64.0f;
    
    self.useTransform3DEffects = YES;
    
    self.view.backgroundColor = [UIColor blackColor];
    [self refreshViews];
}
//打开左侧菜单
- (void)liftMenuPop:(id)sender
{
    MVYSideMenuController * liftMenuControll = [self sideMenuController];
    if (liftMenuControll)
    {
        [liftMenuControll openMenu];
    }
}
//打开右侧视图
- (void)rightMenuPop:(id)sender
{
    NSLog(@"点击了按钮");
}

//- (void)moveManually:(id)sender
//{
//    [self.pagingView moveToPageAtFloatIndex:arc4random() % (self.menuTitles.count - 1) animated:YES];
//}

#pragma mark - ZWSPagingViewDataSource

- (ZWSPage *)pagingView:(ZWSPagingView *)pagingView pageForIndex:(NSUInteger)index
{
    ZWSPage *page = [super pagingView:pagingView pageForIndex:index];
    
    NSLog(@"%ld",(long)index);
    
    buttonIndex = index ;
    
    return page;
}

- (UIView *)contentViewForPage:(ZWSPage *)page atIndex:(NSInteger)index
{
//    UITableView *
    _tableView = [[UITableView alloc] initWithFrame:page.bounds];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];

    _tableView.dataSource = self;
    _tableView.delegate = self ;
    
    //判断是第几个视图
    switch (index)
    {
        case 0:
        {
            [_tableView registerNib:[UINib nibWithNibName:@"RecommendTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
            
            _tableView.rowHeight = 90 ;
            
            //自定义scrollView表头
            SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 280, SCWIDTH, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
            //Page居中
            cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
            cycleScrollView.titlesGroup = titles;
            cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
            //设置时间
            cycleScrollView.autoScrollTimeInterval = 2;
            
            //--- 模拟加载延迟
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                cycleScrollView.imageURLStringsGroup = imagesURLStrings;
            });
            //设置表头
            _tableView.tableHeaderView = cycleScrollView ;
            self.title = @"推荐";
            
        }
            break;
         case 1:
        {
            [_tableView registerNib:[UINib nibWithNibName:@"VideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
            
            _tableView.rowHeight = 280 ;
            
            self.title = @"视频";
            
        }
            break;
            
        default:
            break;
    }
    
//    tableView.backgroundColor = [UIColor colorWithRed:0.5 green:0.1*index blue:0.2*index alpha:1];
    
    
    
    return _tableView;
}


#pragma mark - UITableViewDataSource
//区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 36;
}
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //推荐
    if (buttonIndex == 0)
    {
        RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        //    cell.backgroundColor = [UIColor clearColor];
        cell.titleName.textColor = [UIColor blackColor];
        cell.titleName.text = @"For Test......";
        
        [cell.pictureImgView sd_setImageWithURL:[NSURL URLWithString:@"http://"]placeholderImage:[UIImage imageNamed:@"Dark_Image_Preview.jpg"]];
        
        return cell;
    }
    //视频
    else
    {
        
        VideoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.playNum.text = @"23333";
        cell.playNum.textColor = [UIColor blackColor];
        [cell.videoImgView sd_setImageWithURL:[NSURL URLWithString:@"http://"]placeholderImage:[UIImage imageNamed:@"placeholder_Image.png"]];
        
#warning -- 视频
        
//        cell.imageButton.tag = indexPath.row ;
        
        
        
        return cell;
    }
   
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//
//}

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


#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);

}

//视频播放
//支持横竖屏显示
 - (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll ;
}

- (void)videoPlaying:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
