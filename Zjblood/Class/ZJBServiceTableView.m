//
//  ZJBServiceTableView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/10.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBServiceTableView.h"
#import "ZJBAlertView.h"
#import "ZJBloodLoveTableViewCell.h"
@interface ZJBServiceTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * zJBtabview;
    ZJBAlertView * alertView;
    UINib * nib;
    UIWindow *keyWindow;
}

@end

@implementation ZJBServiceTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
        [self createTable];
    }
    return self;
}

-(void)createTable
{
    zJBtabview = [[UITableView alloc]initWithFrame:self.bounds];
    zJBtabview.delegate = self;
    zJBtabview.dataSource = self;
    zJBtabview.scrollEnabled  = NO;
    //取消cell下划线
    zJBtabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:zJBtabview];
}
#pragma mark -UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if ( section == 1){
        return 2;
    }else if (section == 2){
        return 2;
    }else{
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        if (indexPath.row != 0) {
            return 350.0f;
        }else{
            return 45.0f;
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row !=0) {
            return 145.0f;
        }else{
            return 45.0f;
        }
    }
    return 45.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        cell.textLabel.text = @"签到有积分";
        cell.imageView.image = [UIImage imageNamed:@"serviceasign"];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"无偿献血,有奖竞答";
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.imageView.image = [UIImage imageNamed:@"huodong"];
        }else{
            UIImageView * huodongView = [[UIImageView alloc]initWithFrame:CGRectMake(15, 0,self.frame.size.width-30 ,130)];
            huodongView.image = [UIImage imageNamed:@"jiashujutu"];
            [huodongView setContentMode:UIViewContentModeScaleToFill];
            [cell addSubview:huodongView];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"爱心汇";
            cell.imageView.image = [UIImage imageNamed:@"aixinhui"];
        }else{
            static NSString *identy = @"ZJBloodLoveShowCell";
            if (!nib) {
                nib = [UINib nibWithNibName:@"ZJBloodLoveTableViewCell" bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:identy];
            }
            ZJBloodLoveTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identy];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, 40)];
    headView.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    UILabel * leftLine = [[UILabel alloc]initWithFrame:CGRectMake(20, 19.25, (self.frame.size.width-140)/2, 0.5)];
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(leftLine,0), 0, 100, 40)];
    if(section == 0){
        titleLab.text =@"恒心 · 收获";
    }else if (section == 1){
        titleLab.text = @"热心 · 公益";
    }else if (section ==2 ){
        titleLab.text = @"爱心 · 共享";
    }
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.textColor = [UIColor grayColor];
    titleLab.font = [UIFont systemFontOfSize:14];
    UILabel * rightLine = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(titleLab,0), 19.25, (self.frame.size.width-140)/2, 0.5)];
    leftLine.backgroundColor = [UIColor grayColor];
    rightLine.backgroundColor = [UIColor grayColor];
    leftLine.alpha = 0.3;
    rightLine.alpha = 0.3;
    [headView addSubview:leftLine];
    [headView addSubview:titleLab];
    [headView addSubview:rightLine];
    return headView;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        CGFloat h = [UIScreen mainScreen].bounds.size.height;
        alertView = [[ZJBAlertView alloc]initWithFrame:CGRectMake(w*0.1, h*0.3, w*0.8, h*0.4)];
        [alertView showView];
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
