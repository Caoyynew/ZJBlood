//
//  ZJBServiceTableView.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/10.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBServiceTableView.h"
#import "ZJBAlertView.h"
@interface ZJBServiceTableView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * zJBtabview;
    ZJBAlertView * alertView;
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
        return 1;
    }else if (section == 2){
        return 1;
    }else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.textLabel.text = @"签到有积分";
        cell.imageView.image = [UIImage imageNamed:@"serviceasign"];
    }else if (indexPath.section == 1){
        cell.textLabel.text = @"hello";
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"hello";
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
    UILabel * rightLine = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(titleLab,0), 19.25, (self.frame.size.width-140)/2, 0.5)];
    leftLine.backgroundColor = [UIColor grayColor];
    rightLine.backgroundColor = [UIColor grayColor];
    [headView addSubview:leftLine];
    [headView addSubview:titleLab];
    [headView addSubview:rightLine];
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
//        CGRect rx = [ UIScreen mainScreen ].bounds;
        alertView = [[ZJBAlertView alloc]init];
//        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//        [keyWindow addSubview:alertView];
        [[self viewController]presentViewController:alertView animated:YES completion:nil];
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
