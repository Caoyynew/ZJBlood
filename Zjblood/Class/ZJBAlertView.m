//
//  ZJBAlertView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/13.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBAlertView.h"

@interface ZJBAlertView ()
{
    UIView * showView;
    UIButton * signRecordBtn;
    UIButton * closeBtn;
    
    UIView * greyView;
}

@end

@implementation ZJBAlertView


//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self createUI];
//    }
//    return self;
//}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self createUI];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.view.alpha = 0.8;
}


-(void)createUI
{
    showView = [[UIView alloc]initWithFrame:CGRectMake(zjbWindowW*0.1, zjbWindowH*0.28, zjbWindowW*0.8, zjbWindowH*0.45)];
    showView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:showView];
    
    closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(showView.frame.size.width-45, 15, 30, 30)];
    [closeBtn setImage:[UIImage imageNamed:@"scloseBtn"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [showView addSubview:closeBtn];
    
    UIImageView * signIV = [[UIImageView alloc]initWithFrame:CGRectMake((showView.frame.size.width-80)/2, 40,80,80)];
    signIV.image = [UIImage imageNamed:@"serviceSign"];
    [signIV setContentMode:UIViewContentModeScaleAspectFill];
    [showView addSubview:signIV];
    
    UILabel * signLab = [[UILabel alloc]initWithFrame:CGRectMake((showView.frame.size.width-200)/2, CGRectMT(signIV, 0), 200, 50)];
    signLab.text = @"今日已签到!";
    signLab.textAlignment = NSTextAlignmentCenter;
    [showView addSubview:signLab];
    
    UILabel * signDayLab = [[UILabel alloc]initWithFrame:CGRectMake((showView.frame.size.width-200)/2, CGRectMT(signLab, 0), 200, 30)];
    signDayLab.text = @"您已连续签到15天啦~";
    signDayLab.textAlignment = NSTextAlignmentCenter;
    [showView addSubview:signDayLab];
    
    signRecordBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, CGRectMT(signDayLab, 0), showView.frame.size.width-100, 40)];
    [signRecordBtn addTarget:self action:@selector(lookSignRecord) forControlEvents:UIControlEventTouchUpInside];
    signRecordBtn.backgroundColor = tabarColor;
    signRecordBtn.clipsToBounds = YES;
    signRecordBtn.layer.cornerRadius = 5.0f;
    [signRecordBtn setTitle:@"查看历史签到记录" forState:UIControlStateNormal];
    [showView addSubview:signRecordBtn];
}

-(void)lookSignRecord
{
    NSLog(@"查看签到历史记录");
}

-(void)closeAction
{
    NSLog(@"关闭");
    [showView removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [showView removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//- (void)popView:(UIView *)view animated:(BOOL)animated {
//    // 保存当前弹出的视图
//    CGFloat halfScreenWidth = [[UIScreen mainScreen] bounds].size.width * 0.5;
//    CGFloat halfScreenHeight = [[UIScreen mainScreen] bounds].size.height * 0.5;
//    // 屏幕中心
//    CGPoint screenCenter = CGPointMake(halfScreenWidth, halfScreenHeight);
//    view.center = screenCenter;
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    [keyWindow addSubview:view];
//    
//    if (animated) {
//        // 第一步：将view宽高缩至无限小（点）
//        view.transform = CGAffineTransformScale(CGAffineTransformIdentity,
//                                                CGFLOAT_MIN, CGFLOAT_MIN);
//        [UIView animateWithDuration:0.3
//                         animations:^{
//                             // 第二步： 以动画的形式将view慢慢放大至原始大小的1.2倍
//                             view.transform =
//                             CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
//                         }
//                         completion:^(BOOL finished) {
//                             [UIView animateWithDuration:0.2
//                                              animations:^{
//                                                  // 第三步： 以动画的形式将view恢复至原始大小
//                                                  view.transform = CGAffineTransformIdentity;
//                                              }];
//                         }];
//    }
//}
//
//- (void)closeAnimated:(BOOL)animated {
//    if (animated) {
//        [UIView animateWithDuration:0.2
//                         animations:^{
//                             // 第一步： 以动画的形式将view慢慢放大至原始大小的1.2倍
//                             self.transform =
//                             CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
//                         }
//                         completion:^(BOOL finished) {
//                             [UIView animateWithDuration:0.3
//                                              animations:^{
//                                                  // 第二步： 以动画的形式将view缩小至原来的1/1000分之1倍
//                                                  self.transform = CGAffineTransformScale(
//                                                                                                  CGAffineTransformIdentity, 0.001, 0.001);
//                                              }
//                                              completion:^(BOOL finished) {
//                                                  // 第三步： 移除
//                                                  [self removeFromSuperview];
//                                              }];
//                         }];
//    } else {
//        [self removeFromSuperview];
//    }
//}
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *view = [super hitTest:point withEvent:event];
//    if (view == nil) {
//        for (UIView *subView in self.subviews) {
//            CGPoint tp = [subView convertPoint:point fromView:self];
//            if (CGRectContainsPoint(subView.bounds, tp)) {
//                view = subView;
//            }
//        }
//    }
//    return view;
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
