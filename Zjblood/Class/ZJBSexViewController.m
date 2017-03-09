//
//  ZJBSexViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBSexViewController.h"

@interface ZJBSexViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * sexTableView;
    UIImageView * selectManView;
    UIImageView * selectWomenView;
}

@end

@implementation ZJBSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    [self createRightButton];
    
}

-(void)createTableView
{
    sexTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, zjbWindowW, 120)];
    [self.view addSubview:sexTableView];
    sexTableView.delegate = self;
    sexTableView.dataSource = self;
    
    
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]init];
 
    if (indexPath.row == 0) {
        UIView * sexCellView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 60)];
        UILabel * man = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100,sexCellView.frame.size.height)];
        man.text = @"男";
        [sexCellView addSubview:man];
        
        selectManView = [[UIImageView alloc]initWithFrame:CGRectMake(sexCellView.frame.size.width-40,20, 20, 20)];
        selectManView.image = [UIImage imageNamed:@"select"];
        [sexCellView addSubview:selectManView];
        [cell addSubview:sexCellView];
    }else{
        UIView * sexCellView = [[UIView alloc]initWithFrame:CGRectMake(0,0, zjbWindowW, 60)];
        UILabel * man = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100,sexCellView.frame.size.height)];
        man.text = @"女";
        [sexCellView addSubview:man];
        selectWomenView = [[UIImageView alloc]initWithFrame:CGRectMake(sexCellView.frame.size.width-40, 20, 20, 20)];
        selectWomenView.image = [UIImage imageNamed:@"select"];
        [sexCellView addSubview:selectWomenView];
        [cell addSubview:sexCellView];
    }
    if (_sexStr == nil) {
        _sexStr = @"男";
    }
    if ([_sexStr isEqualToString:@"男"]) {
        selectWomenView.hidden = YES;
        selectManView.hidden = NO;
    }else{
        selectManView.hidden = YES;
        selectWomenView.hidden = NO;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        _sexStr = @"男" ;
    }else{
        _sexStr = @"女";
    }
    [sexTableView reloadData];
}

-(void)createRightButton
{
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)ZJBSexBlock:(ZJBSexBlock)block
{
    self._block = block;
}

-(void)saveAction
{
    self._block(_sexStr);
    [self.navigationController popViewControllerAnimated:YES];
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
