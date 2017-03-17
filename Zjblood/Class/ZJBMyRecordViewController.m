//
//  ZJBMyRecordViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/17.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBMyRecordViewController.h"

@interface ZJBMyRecordViewController ()
{
    UIScrollView * headScroll;
    UIScrollView * contentScroll;
}
@end

@implementation ZJBMyRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);

    [self createHeadView];
    [self createContentView];
    // Do any additional setup after loading the view.
}
#pragma mark - 顶部View
-(void)createHeadView
{
    headScroll =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 40)];
    [self.view addSubview:headScroll];
    
}
#pragma mark - 内容展示View
-(void)createContentView
{
    
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
