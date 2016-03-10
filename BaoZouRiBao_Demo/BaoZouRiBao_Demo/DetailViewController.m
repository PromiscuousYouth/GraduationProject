//
//  DetailViewController.m
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/7.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"改变" style:UIBarButtonItemStyleDone target:self action:@selector()];
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    webView.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:webView];
    
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
