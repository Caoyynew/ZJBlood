//
//  ZJBAlertView.h
//  Zjblood
//
//  Created by Cao yang on 2017/3/13.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 子视图通知控制器操作代理
 */
@protocol ZJBackViewControllerDelegate<NSObject>

-(void)ZJBackViewControllerWithTitle:(NSInteger)VCTag;

@end
@interface ZJBAlertView : UIViewController
@property (nonatomic ,weak) id<ZJBackViewControllerDelegate>delegate;
///**
// *  弹出视图
// *
// *  @param view     被弹出的视图
// *  @param animated 是否需要动画
// */
//- (void)popView:(UIView *)view animated:(BOOL)animated;
//
///**
// *  关闭视图
// *
// *  @param animated 是否需要动画
// */
//- (void)closeAnimated:(BOOL)animated;
@end
