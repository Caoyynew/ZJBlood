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
    
    UIWindow * keywindow;
    UIButton * backViewBtn;
}

@end

@implementation ZJBAlertView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)showView
{
    keywindow = [[UIApplication sharedApplication].windows lastObject];
    backViewBtn = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
    backViewBtn.backgroundColor = [UIColor blackColor];
    backViewBtn.alpha = 0.4;
    [backViewBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [keywindow addSubview:backViewBtn];
    [keywindow addSubview:self];
    [self animatedIn];
}

//显示动画
- (void)animatedIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

-(void)createUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 2.0f;
    self.clipsToBounds = YES;
    closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-45, 15, 30, 30)];
    [closeBtn setImage:[UIImage imageNamed:@"scloseBtn"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    
    showView = [[UIView alloc]initWithFrame:CGRectMake(0, 45, self.frame.size.width, self.frame.size.height-45)];
    
    [self addSubview:showView];
    
    UIImageView * signIV = [[UIImageView alloc]initWithFrame:CGRectMake((showView.frame.size.width-80)/2, 0,80,80)];
    signIV.image = [UIImage imageNamed:@"serviceSign"];
    [signIV setContentMode:UIViewContentModeScaleAspectFit];
    [showView addSubview:signIV];
    
    UILabel * signLab = [[UILabel alloc]initWithFrame:CGRectMake((showView.frame.size.width-200)/2, CGRectMT(signIV, 10), 200, 20)];
    signLab.text = @"今日已签到!";
    signLab.font = [UIFont systemFontOfSize:17];
    signLab.textAlignment = NSTextAlignmentCenter;
    [showView addSubview:signLab];
    
    UILabel * signDayLab = [[UILabel alloc]initWithFrame:CGRectMake((showView.frame.size.width-200)/2, CGRectMT(signLab, 0), 200, 20)];
    
    signDayLab.font = [UIFont systemFontOfSize:14];
    signDayLab.textColor = [UIColor grayColor];
    signDayLab.textAlignment = NSTextAlignmentCenter;
    NSString * signStr = @"15";
    NSString * dataStr = [NSString stringWithFormat:@"您已连续签到%@天啦~",signStr];
    NSAttributedString * muStr = [self setLabelColor:dataStr];
    signDayLab.attributedText = muStr;
    [showView addSubview:signDayLab];
    
    signRecordBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, CGRectMT(signDayLab,20), showView.frame.size.width-100, 40)];
    [signRecordBtn addTarget:self action:@selector(lookSignRecord) forControlEvents:UIControlEventTouchUpInside];
    signRecordBtn.backgroundColor = tabarColor;
    signRecordBtn.clipsToBounds = YES;
    signRecordBtn.layer.cornerRadius = 5.0f;
    [signRecordBtn setTitle:@"查看历史签到记录" forState:UIControlStateNormal];
    [showView addSubview:signRecordBtn];
}
#pragma mark - 设置label颜色
-(NSAttributedString *)setLabelColor:(NSString *)lab
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:lab];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6, lab.length-9)];
    NSAttributedString * mString = attributedString;
    return mString;
}

-(void)lookSignRecord
{
    NSLog(@"查看签到历史记录");
    
}

-(void)closeAction
{
    [UIView animateWithDuration:.35 animations:^{
        [self removeFromSuperview];
        [backViewBtn removeFromSuperview];
        backViewBtn = nil;
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
