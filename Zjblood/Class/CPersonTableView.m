//
//  CPersonTableView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "CPersonTableView.h"
#import "ZJBMyMessageViewController.h"
#import "ZJBMyDataTableViewController.h"
#import "ZJBSystenSettingViewController.h"
#import "ZJBFeedBackViewController.h"
@implementation CPersonTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTableViewData];
    }
    return self;
}

-(void)createTableViewData
{
    _CPersonDataArray = [[NSMutableArray alloc]init];
    
    _CPersontableView = [[UITableView alloc]initWithFrame:self.bounds];
    _CPersontableView.dataSource = self;
    _CPersontableView.delegate = self;
    [self addSubview:_CPersontableView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 2;
    }else if (section==1){
        return 1;
    }else if (section ==2){
        return 2;
    }else{
        return 0;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}
#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier = @"cpercell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndetifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        if (indexPath.row ==0) {
            cell.imageView.image = [UIImage imageNamed:@"wodexiaoxi-2"];
            cell.textLabel.text = @"我的消息";
        }else{
            cell.imageView.image = [UIImage imageNamed:@"wodeziliao-2"];
            cell.textLabel.text = @"我的资料";
        }
    }else if (indexPath.section ==1){
        cell.imageView.image = [UIImage imageNamed:@"shezhi-2"];
        cell.textLabel.text = @"系统设置";
    }else if (indexPath.section ==2){
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"tuijian-2"];
            cell.textLabel.text = @"推荐给好友";
        }else{
            cell.imageView.image = [UIImage imageNamed:@"yijian-2"];
            cell.textLabel.text = @"意见反馈";
        }
    }else{
        cell.textLabel.text = @"";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row ==0) {
            ZJBMyMessageViewController *myMessage = [[ZJBMyMessageViewController alloc]init];
            myMessage.view.backgroundColor = [UIColor whiteColor];
            myMessage.title = @"动态";
            //设置跳转页面tabbar隐藏
            myMessage.hidesBottomBarWhenPushed = YES;
            [[self viewController].navigationController pushViewController:myMessage animated:YES];
        }else{
            ZJBMyDataTableViewController *myData = [[ZJBMyDataTableViewController alloc]init];
            myData.view.backgroundColor = [UIColor whiteColor];
            myData.title = @"我的资料";
            myData.hidesBottomBarWhenPushed = YES;
            [[self viewController].navigationController pushViewController:myData animated:YES];
        }
    }else if (indexPath.section ==1){
        ZJBSystenSettingViewController * systemSet = [[ZJBSystenSettingViewController alloc]init];
        systemSet.title = @"设置";
        systemSet.hidesBottomBarWhenPushed = YES;
        systemSet.view.backgroundColor = [UIColor whiteColor];
        [[self viewController].navigationController pushViewController:systemSet animated:YES];
    }else if (indexPath.section ==2){
        if (indexPath.row == 0) {
            
        }else{
            ZJBFeedBackViewController * feedBack = [[ZJBFeedBackViewController alloc]init];
            feedBack.title = @"意见反馈";
            feedBack.hidesBottomBarWhenPushed = YES;
            feedBack.view.backgroundColor = [UIColor whiteColor];
            [[self viewController].navigationController pushViewController:feedBack animated:YES ];
        }
    }else{
       
    }
}
#pragma mark - 获取当前视图的视图控制器
- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next != nil; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
