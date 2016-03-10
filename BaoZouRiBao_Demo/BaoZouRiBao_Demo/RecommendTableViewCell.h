//
//  RecommendTableViewCell.h
//  BaoZouRiBao_Demo
//
//  Created by 花落丶微凉 on 16/3/6.
//  Copyright © 2016年 花落丶微凉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *sourceName;
@property (weak, nonatomic) IBOutlet UILabel *readingNum;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImgView;

@end
