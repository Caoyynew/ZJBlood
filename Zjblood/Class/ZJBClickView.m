//
//  ZJBClickView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/10.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBClickView.h"
#import "ZJBloodRecordViewController.h"
#import "ZJBloodHomeViewController.h"
#import "ZJBloodAskViewController.h"
#import "ZJBloodSearchViewController.h"
@interface ZJBClickView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * serviceTableView;
    UILabel * selectLab;
    UIImageView * asignlogo;
    
    NSInteger selectTag;
    
    UIView * recordView;
    UIView * homeView;
    UIView * askView;
    UIView *searchView;
}

@end

@implementation ZJBClickView

-(instancetype)initWithFrame:(CGRect)frame
{
    self =  [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);

        [self createTableView];
        [self createClickView];
    }
    return self;
}
#pragma mark - 创建tableview
-(void)createTableView
{
    selectTag = 1;
    serviceTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width, 240)];
    serviceTableView.delegate = self;
    serviceTableView.dataSource = self;
    serviceTableView.scrollEnabled = NO;
    [self addSubview:serviceTableView];
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIView * cellView = [self drawTableViewCellWithTag:indexPath.row];
    [cell addSubview:cellView];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        selectTag = 1;
    }else if (indexPath.row == 1){
        selectTag = 2;
    }else if (indexPath.row ==2){
        selectTag = 3;
    }
    [serviceTableView reloadData];
}
//自定义tableviewcell
-(UIView *)drawTableViewCellWithTag:(NSInteger)index
{
    UIView * view = [[UIView alloc]init];
    UIImageView * logoView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 30, 40)];
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logoView, 20), 15, 150, 30)];
    titleLabel.font = [UIFont systemFontOfSize:18];
    UILabel * detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logoView, 20), 45, 200, 20)];
    detailLabel.font = [UIFont systemFontOfSize:14];
    selectLab = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-120, 25, 80, 30)];
    selectLab.font = [UIFont systemFontOfSize:18];
    asignlogo = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-40, 27.5, 20, 25)];
    [asignlogo setContentMode:UIViewContentModeScaleAspectFill];
    asignlogo.image = [UIImage imageNamed:@"servicegrey"];
    if (selectTag == 0) {
        selectTag =1;
    }
    if (selectTag == (index+1)) {
        selectLab.textColor = [UIColor redColor];
        asignlogo.image = [UIImage imageNamed:@"servicered"];
    }
    if (index == 0) {
        logoView.image = [UIImage imageNamed:@"serviceblood"];
        titleLabel.text = @"还血报销";
        detailLabel.text = @"还血须知相关事项";
        selectLab.text = @"立刻申报";
    }else if(index == 1){
        logoView.image = [UIImage imageNamed:@"servicehonor"];
        titleLabel.text = @"荣誉证申领";
        detailLabel.text = @"荣誉证申领须知相关事项";
        selectLab.text = @"立刻申领";
    }else if (index == 2){
        logoView.image = [UIImage imageNamed:@"servicerecognition"];
        titleLabel.text = @"表彰查询";
        detailLabel.text = @"表彰查询须知相关事项";
        selectLab.text = @"立刻查看";
    }else{
        logoView.image = [UIImage imageNamed:@""];
        titleLabel.text = @"";
        detailLabel.text = @"";
        selectLab.text = @"";
    }
    [view addSubview:logoView];
    [view addSubview:titleLabel];
    [view addSubview:detailLabel];
    [view addSubview:selectLab];
    [view addSubview:asignlogo];
    return view;
}
#pragma mark - 创建4个button按钮
-(void)createClickView
{
    UIView * clickView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectMT(serviceTableView, 15), self.frame.size.width, 80)];
    clickView.backgroundColor = [UIColor whiteColor];
    [self addSubview:clickView];
    CGFloat x = (self.frame.size.width - 320)/4;
    recordView = [[UIView alloc]initWithFrame:CGRectMake(x/2, 10, 80, 60)];
    recordView = [self createButtonWithFrame:recordView.frame Title:@"献血记录" imageNmae:@"srecord"];
    [clickView addSubview:recordView];
    UITapGestureRecognizer *clickTouch1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    recordView.tag = 1000;
    recordView.userInteractionEnabled= YES;
    [recordView addGestureRecognizer:clickTouch1];
    
    
    homeView = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(recordView, x), 10, 80, 60)];
    homeView = [self createButtonWithFrame:homeView.frame Title:@"献血者之家" imageNmae:@"shome"];
    [clickView addSubview:homeView];
    UITapGestureRecognizer *clickTouch2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    homeView.tag = 1001;
    homeView.userInteractionEnabled= YES;
    [homeView addGestureRecognizer:clickTouch2];
    
    askView = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(homeView, x), 10, 80, 60)];
    askView = [self createButtonWithFrame:askView.frame Title:@"献血咨询" imageNmae:@"sask"];
    [clickView addSubview:askView];
    UITapGestureRecognizer *clickTouch3=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    askView.tag = 1002;
    askView.userInteractionEnabled= YES;
    [askView addGestureRecognizer:clickTouch3];
    
    searchView = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(askView, x), 10, 80, 60)];
    searchView = [self createButtonWithFrame:searchView.frame Title:@"资料查找" imageNmae:@"ssearch"];
    [clickView addSubview:searchView];
    UITapGestureRecognizer *clickTouch4=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    searchView.tag = 1003;
    searchView.userInteractionEnabled= YES;
    [searchView addGestureRecognizer:clickTouch4];
}

//创建点击按钮视图
-(UIView *)createButtonWithFrame:(CGRect)rect Title:(NSString *)str imageNmae:(NSString *)img
{
    UIView * btnView = [[UIView alloc]initWithFrame:rect];
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(27.5, 0, 25, 30)];
    imageV.image = [UIImage imageNamed:img];
    [imageV setContentMode:UIViewContentModeScaleAspectFill];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, 80, 20)];
    title.font = [UIFont systemFontOfSize:14];
    title.text = str;
    title.textAlignment = NSTextAlignmentCenter;
    [btnView addSubview:imageV];
    [btnView addSubview:title];
    return btnView;
}

-(void)clickAction:(UITapGestureRecognizer *)touch
{
    long tag = [touch view].tag;
    if (tag == 1000) {
        ZJBloodRecordViewController * bloodRecord = [[ZJBloodRecordViewController alloc]init];
        bloodRecord.title = @"献血记录";
        bloodRecord.view.backgroundColor = [UIColor whiteColor];
        //隐藏底部tabar
//        [self viewController].hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:bloodRecord animated:YES];
    }else if (tag ==1001){
        ZJBloodHomeViewController * home = [[ZJBloodHomeViewController alloc]init];
        home.title = @"献血者之家";
        home.view.backgroundColor = [UIColor whiteColor];
        [[self viewController].navigationController pushViewController:home animated:YES];
    }else if (tag == 1002){
        ZJBloodAskViewController * ask = [[ZJBloodAskViewController alloc]init];
        ask.title = @"献血咨询";
        ask.view.backgroundColor = [UIColor whiteColor];
        [[self viewController].navigationController pushViewController:ask animated:YES];
    }else if (tag == 1003){
        ZJBloodSearchViewController * search = [[ZJBloodSearchViewController alloc]init];
        search.title = @"资料查询";
        search.view.backgroundColor = [UIColor whiteColor];
        [[self viewController].navigationController pushViewController:search animated:YES];
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
