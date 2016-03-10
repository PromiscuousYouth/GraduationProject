//
//  VideoTableViewCell.h
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/6.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *videoImgView;
//播放数量
@property (weak, nonatomic) IBOutlet UILabel *playNum;
//赞
@property (weak, nonatomic) IBOutlet UIButton *praiseButton;
//评论
@property (weak, nonatomic) IBOutlet UIButton *commentsButton;

@end
