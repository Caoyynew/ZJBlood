//
//  ZJBInformationViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/7.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBInformationViewController.h"
#import "ZLNavTabBarController.h"
@interface ZJBInformationViewController ()

@end

@implementation ZJBInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableViewController *oneViewController = [[UITableViewController alloc] init];
    oneViewController.title = @"资讯";
    oneViewController.view.backgroundColor = [UIColor whiteColor];
    
    UITableViewController *twoViewController = [[UITableViewController alloc] init];
    twoViewController.title = @"政策";
    twoViewController.view.backgroundColor = [UIColor whiteColor];
    
    UITableViewController *threeViewController = [[UITableViewController alloc] init];
    threeViewController.title = @"爱心汇";
    threeViewController.view.backgroundColor = [UIColor whiteColor];
    
    ZLNavTabBarController *navTabBarController = [[ZLNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[oneViewController, twoViewController, threeViewController, ];
    navTabBarController.mainViewBounces = YES;
    navTabBarController.selectedToIndex = 3;
    [navTabBarController addParentController:self];
    // Do any additional setup after loading the view.
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
