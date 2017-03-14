//
//  ZJBloodSearchViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/14.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodSearchViewController.h"

@interface ZJBloodSearchViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * searchTV;
}

@end

@implementation ZJBloodSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRightButton];
    [self createsearchTV];
    // Do any additional setup after loading the view.
}

-(void)createRightButton
{
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"serviceSearch"] style:UIBarButtonItemStyleDone target:self action:@selector(searchAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}
-(void)searchAction
{
    NSLog(@"点击了search!!");
}

-(void)createsearchTV
{
    searchTV = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:searchTV];
    searchTV.delegate = self;
    searchTV.dataSource = self;
    
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[[UITableViewCell alloc]init];
    cell.textLabel.text = @"hahhahahahaah";
    return cell;
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
