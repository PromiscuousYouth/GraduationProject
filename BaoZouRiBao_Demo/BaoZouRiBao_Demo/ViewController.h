//
//  ViewController.h
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/2.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZWSViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : ZWSViewController<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>

@property (nonatomic,strong)UITableView *tableView ;
//视频播放
//@property (nonatomic,strong)MPMoviePlayerController * videoPlayer ;
////加载动画
//@property (nonatomic,strong)UIActivityIndicatorView * loadingAni ;
//@property (nonatomic,strong)NSNotificationCenter * notificationCenter ;
//@property (nonatomic,strong)UIImageView * backVideoImg ;

@end

