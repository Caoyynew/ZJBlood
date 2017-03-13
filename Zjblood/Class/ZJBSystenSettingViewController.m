//
//  ZJBSystenSettingViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBSystenSettingViewController.h"
#import "ZJBLoginViewController.h"
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
    systemSetTableView.tableFooterView = [[UIView alloc]init];
    
    [self drawLogoutButton];
    // Do any additional setup after loading the view.
}
#pragma mark - 登出按钮
-(void)drawLogoutButton
{
    UIButton * logoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*zjbWindowW, zjbWindowH*0.8, zjbWindowW*0.8, 50)];
    logoutBtn.backgroundColor = buttonColor;
    logoutBtn.clipsToBounds=YES;
    logoutBtn.layer.cornerRadius=5;
    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoutBtn addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutBtn];
}

-(void)logoutAction
{
    NSLog(@"点击了退出登录!");
    ZJBLoginViewController * logo = [[ZJBLoginViewController alloc]init];
    
    [self.navigationController pushViewController:logo animated:YES];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier = @"systemSetcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndetifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 0) {
        cell.textLabel.text = @"使用帮助";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"隐私";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"清理缓存";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"关于我们";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"版本信息";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"申明";
    }
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"第%ld行 touch me!",(long)indexPath.row+1);
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
