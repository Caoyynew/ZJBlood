//
//  ZJBMyHonorViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/16.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBMyHonorViewController.h"
#import "ZJBApplicant.h"
#import "ZJBApplicationContent.h"

@interface ZJBMyHonorViewController ()
{
    ZJBApplicant * apliView;
    ZJBApplicationContent *apliContentView;
}

@end

@implementation ZJBMyHonorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView * rootView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:rootView];
    self.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    NSInteger type;
    type = 1;
    if (type == 0) {
        apliView = [[ZJBApplicant alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 125) type:0];
        apliContentView = [[ZJBApplicationContent alloc]initWithFrame:CGRectMake(0, CGRectMT(apliView, 0), zjbWindowW, zjbWindowH-125) type:0];
        [rootView addSubview:apliView];
        [rootView addSubview:apliContentView];
        rootView.contentSize = CGSizeMake(0, zjbWindowH);
    }
    if (type ==1) {
        apliView = [[ZJBApplicant alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 125) type:1];
        apliContentView = [[ZJBApplicationContent alloc]initWithFrame:CGRectMake(0, CGRectMT(apliView, 0), zjbWindowW, 520) type:1];
        [rootView addSubview:apliView];
        [rootView addSubview:apliContentView];
        rootView.contentSize = CGSizeMake(0, 650);
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
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
