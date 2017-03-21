//
//  ZJBHonorAlertView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorAlertView.h"
@interface ZJBHonorAlertView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * cellTableView;
    UIButton * backView;
}
@end

@implementation ZJBHonorAlertView

-(instancetype)initWithFrame:(CGRect)frame titleArr:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titlesArr = [NSArray arrayWithArray:arr];
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    cellTableView = [[UITableView alloc]initWithFrame:self.bounds];
    cellTableView.delegate = self;
    cellTableView.dataSource =self;
    cellTableView.layer.cornerRadius = 5.0f;
    cellTableView.clipsToBounds = YES;
    cellTableView.backgroundColor = [UIColor whiteColor];
    [self addSubview:cellTableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2-75, 0, 150, 40)];
    [cell addSubview:titleLab];
    NSString *title = self.titlesArr[indexPath.row];
    titleLab.text = title;
    titleLab.font = [UIFont systemFontOfSize:17];
    titleLab.textColor = [UIColor grayColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString * str  = self.titlesArr[indexPath.row];
    self._block(str);
    [self closeAction];
    
}
-(void)ZJBHonorCellBackData:(ZJBHonorCellBackData)block
{
    self._block = block;
}
-(void)showView
{
    UIWindow * keywindow = [[UIApplication sharedApplication].windows lastObject];
    backView = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
    backView.backgroundColor = [UIColor blackColor];
    backView.alpha = 0.4;
    [backView addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [keywindow addSubview:backView];
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
//消失动画
-(void)closeAction
{
    [UIView animateWithDuration:.35 animations:^{
        [self removeFromSuperview];
        [backView removeFromSuperview];
        backView = nil;
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
