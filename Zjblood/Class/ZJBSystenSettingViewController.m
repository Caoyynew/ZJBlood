//
//  ZJBSystenSettingViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBSystenSettingViewController.h"
#import "ZJBLoginViewController.h"
#import "ZJBPrivacyViewController.h"
#import "ZJBVersionsViewController.h"
#import "ZJBAboutOursViewController.h"
@interface ZJBSystenSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *systemSetTableView;
}
@property (nonatomic ,strong) NSArray * titleArr;

@end

@implementation ZJBSystenSettingViewController

-(NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = [[NSArray alloc]init];
    }
    return _titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArr = @[@"隐私",@"清理缓存",@"版本信息",@"关于我们"];
    
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
    UIButton * logoutBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, zjbWindowH*0.75, 200, 40)];
    logoutBtn.backgroundColor = buttonColor;
    logoutBtn.clipsToBounds=YES;
    logoutBtn.layer.cornerRadius=5;
    [logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logoutBtn addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutBtn];
}

-(void)logoutAction
{
//    NSLog(@"点击了退出登录!");
    ZJBLoginViewController * logo = [[ZJBLoginViewController alloc]init];
    logo.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:logo animated:YES];
    
//    [self presentViewController:logo animated:YES completion:nil];
    
    
}
#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndetifier = @"systemSetcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIndetifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"第%ld行 touch me!",(long)indexPath.row+1);
    if (indexPath.row == 0) {
        ZJBPrivacyViewController * pr = [[ZJBPrivacyViewController alloc]init];
        pr.title = @"隐私";
        pr.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:pr animated:YES];
    }else if (indexPath.row == 1){
        
        [self clearCache];
    }else if (indexPath.row == 2){
        ZJBVersionsViewController * versions = [[ZJBVersionsViewController alloc]init];
        versions.title = @"版本信息";
        versions.view.backgroundColor = backColor;
        [self.navigationController pushViewController:versions animated:YES];
    }else if (indexPath.row == 3){
        ZJBAboutOursViewController * ours = [[ZJBAboutOursViewController alloc]init];
        ours.title = @"关于我们";
        ours.view.backgroundColor = backColor;
        [self.navigationController pushViewController:ours animated:YES];
    }
}
//清除缓存按钮的点击事件
- (void)clearCache{
    CGFloat size = [self folderSizeAtPath:NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject] + [self folderSizeAtPath:NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject] + [self folderSizeAtPath:NSTemporaryDirectory()];
    
    NSString *message = size > 1 ? [NSString stringWithFormat:@"缓存%.2fM, 清理缓存", size] : [NSString stringWithFormat:@"缓存%.2fK,清理缓存?", size * 1024.0];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self cleanCaches:@""];            }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
    [alert addAction:action];
    [alert addAction:cancel];
    [self showDetailViewController:alert sender:nil];
}

// 计算目录大小
- (CGFloat)folderSizeAtPath:(NSString *)path{
    // 利用NSFileManager实现对文件的管理
    NSFileManager *manager = [NSFileManager defaultManager];
    CGFloat size = 0;
    if ([manager fileExistsAtPath:path]) {
        // 获取该目录下的文件，计算其大小
        NSArray *childrenFile = [manager subpathsAtPath:path];
        for (NSString *fileName in childrenFile) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            size += [manager attributesOfItemAtPath:absolutePath error:nil].fileSize;
        }
        // 将大小转化为M
        return size / 1024.0 / 1024.0;
    }
    return 0;
}
// 根据路径删除文件
- (void)cleanCaches:(NSString *)path{
    // 利用NSFileManager实现对文件的管理
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *folderPath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    if ([fileManager fileExistsAtPath:folderPath]) {
        // 获取该路径下面的文件名
        NSArray *childrenFiles = [fileManager subpathsAtPath:folderPath];
        for (NSString *fileName in childrenFiles) {
            // 拼接路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            // 将文件删除
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
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
