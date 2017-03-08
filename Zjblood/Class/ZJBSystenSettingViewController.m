//
//  ZJBSystenSettingViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBSystenSettingViewController.h"

@interface ZJBSystenSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *systemSetTableView;
}
@end

@implementation ZJBSystenSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    systemSetTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:systemSetTableView];
    systemSetTableView.delegate = self;
    systemSetTableView.dataSource = self;
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
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
