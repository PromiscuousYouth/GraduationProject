//
//  ZWSMenuLabel.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ZWSMenuLabel : UILabel

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, strong) UIFont *selectedFont;

- (void)transformColor:(float)progress;

- (void)transformFont:(float)progress;

@end
