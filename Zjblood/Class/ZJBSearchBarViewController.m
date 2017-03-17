//
//  ZJBSearchBarViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/15.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBSearchBarViewController.h"

@interface ZJBSearchBarViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UISearchBar *customSearchBar;
    UITableView *showHistory;
    NSArray * historyArr;
}
@end

@implementation ZJBSearchBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    historyArr = [[NSArray alloc]initWithObjects:@"献血的好处",@"献血表彰",@"献血站位置",@"表彰须知",@"还血须知",@"荣誉证须知", nil];
    self.navigationItem.hidesBackButton = YES;
    //搜索栏
    customSearchBar = [[UISearchBar alloc]init];
    customSearchBar.delegate = self;
    customSearchBar.placeholder = @"搜索";
    customSearchBar.searchBarStyle = UISearchBarStyleProminent;
    self.navigationItem.titleView = customSearchBar;
    // Do any additional setup after loading the view.
    
    //显示默认搜索内容
    showHistory = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:showHistory];
    showHistory.tableFooterView = [[UIView alloc]init];
    showHistory.delegate = self ;
    showHistory.dataSource = self;
}
#pragma mark - UISearchBarDelegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    customSearchBar.showsCancelButton = YES;
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
//            cancel.titleLabel.font = [UIFont systemFontOfSize:14];
            cancel.tintColor = [UIColor whiteColor];
        }
    }
    return YES;
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //TODO:返回数据给前个页面
    NSLog(@"search click!!!!!!");
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return historyArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    NSString * his = historyArr [indexPath.row];
    cell.textLabel.text = his;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //TODO:默认选项操作
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
