//
//  ZJBServiceViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBServiceViewController.h"
#import "ZJBClickView.h"
#import "ZJBServiceTableView.h"
#import "ZJBMyMessageViewController.h"

@interface ZJBServiceViewController ()<UIScrollViewDelegate>
{
    ZJBClickView * clickView;
    ZJBServiceTableView * serviceView;
}
@end

@implementation ZJBServiceViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createLeftButton];
    [self createUI];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 消息推送
-(void)createLeftButton
{
    UIBarButtonItem * leftBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"xiaoxi"] style:UIBarButtonItemStyleDone target:self action:@selector(clickAction)];
    leftBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftBtn;
}
-(void)clickAction
{
    ZJBMyMessageViewController *messge = [[ZJBMyMessageViewController alloc]init];
    messge.title = @"我的消息";
    [self.navigationController pushViewController:messge animated:YES];
    
}
#pragma mark - UI
-(void)createUI
{
    UIScrollView * rootScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    rootScrollView.delegate = self;
    rootScrollView.contentSize = CGSizeMake(0, 1150);
    [self.view addSubview:rootScrollView];
    clickView = [[ZJBClickView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 335)];
    [rootScrollView addSubview:clickView];
    
    serviceView = [[ZJBServiceTableView alloc]initWithFrame:CGRectMake(0, CGRectMT(clickView,0), zjbWindowW, 750)];
    serviceView.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [rootScrollView addSubview:serviceView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
