//
//  ZJBloodResultViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/13.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodResultViewController.h"
#import "ZJBloodRecTableViewCell.h"
@interface ZJBloodResultViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * bloodTableView;
    UINib * nib;
}
@end

@implementation ZJBloodResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
}

-(void)createTableView
{
    bloodTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    bloodTableView.delegate = self;
    bloodTableView.dataSource = self;
    bloodTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    bloodTableView.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [self.view addSubview:bloodTableView];
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
    static NSString *identy = @"ZJBloodRecCell";
    if (!nib) {
        nib = [UINib nibWithNibName:@"ZJBloodRecTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identy];
    }
    ZJBloodRecTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:identy];
    //TODO:加载数据
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 83.0f;
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
