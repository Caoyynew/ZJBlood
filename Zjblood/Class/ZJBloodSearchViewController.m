//
//  ZJBloodSearchViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/14.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodSearchViewController.h"
#import "ZJBloodSearchTableViewCell.h"
@interface ZJBloodSearchViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * searchTV;
    UINib * nib;
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
    searchTV.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [self.view addSubview:searchTV];
    searchTV.delegate = self;
    searchTV.dataSource = self;
    //去掉分割线
    searchTV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identy = @"ZJBloodSeaCell";
    if (!nib) {
        nib = [UINib nibWithNibName:@"ZJBloodSearchTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identy];
    }
    ZJBloodSearchTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:identy];
    //TODO:加载数据
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160.0f;
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
