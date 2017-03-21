//
//  ZJBMyCommendViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/20.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBMyCommendViewController.h"
#import "ZJBCommendView.h"
#import "ZJBComShowTableViewCell.h"

@interface ZJBMyCommendViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel * leftLab;
    UIImageView * leftImg;
    UILabel * rightLab;
    UIImageView * rightImg;
    
    UIView * headView;
    NSArray * rightArr;
    NSArray * leftArr;
    
    BOOL isSelect;
    
    ZJBCommendView * view1;
//    ZJBCommendView * view2;
    UITableView * commendTableView;
}

@end

@implementation ZJBMyCommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isSelect = NO;
    self.view.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    leftArr = [[NSArray alloc]initWithObjects:@"全部",@"省级表彰",@"国家级表彰", nil];
    rightArr = [[NSArray alloc]initWithObjects:@"全部",@"2015~2016",@"2014~2015", nil];
    
    [self createRightButton];
    [self createcommendTableView];
    [self createHeadView];
//    CGRect rect = CGRectMake(0, CGRectMT(headView, 10), zjbWindowW, zjbWindowH-50);
//    view1 = [[ZJBCommendView alloc]initWithFrame:rect nowTitle:@"全部" type:0 titleArr:leftArr];
//    view2 = [[ZJBCommendView alloc]initWithFrame:rect nowTitle:@"全部" type:1 titleArr:rightArr];
    
}
#pragma mark - 导航栏右搜索按钮
-(void)createRightButton
{
    UIBarButtonItem * leftTabarBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"serviceSearch"] style:UIBarButtonItemStyleDone target:self action:@selector(searchAction)];
    leftTabarBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = leftTabarBtn;
}
-(void)searchAction
{
    NSLog(@"待定!");
}
#pragma mark - 页面顶部视图
-(void)createHeadView
{
    headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 40)];
//    [self.view addSubview:headView];
    headView.backgroundColor = [UIColor whiteColor];
    
    //左按钮
    leftLab = [[UILabel alloc]init];
    leftLab.font = [UIFont systemFontOfSize:14];
    leftLab.textColor = [UIColor grayColor];
    leftLab.text = @"省级表彰";
    CGSize rect1 = [self setLabelSize:leftLab];
    leftLab.frame = CGRectMake(zjbWindowW/4 - rect1.width/2, 20-rect1.height/2, rect1.width, rect1.height);
    leftImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(leftLab, 5), 17.5, 5, 5)];
    [leftImg setContentMode:UIViewContentModeScaleAspectFill];
    leftImg.image = [UIImage imageNamed:@"xiasanjiao"];
    //添加点击事件
    leftLab.tag = 40;
    UITapGestureRecognizer * click1 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    leftLab.userInteractionEnabled= YES;
    [leftLab addGestureRecognizer:click1];
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(zjbWindowW/2-0.5, 13, 1, 14)];
    line.backgroundColor = [UIColor grayColor];
    
    [headView addSubview:leftLab];
    [headView addSubview:leftImg];
    [headView addSubview:line];
    
    //右按钮
    rightLab = [[UILabel alloc]init];
    rightLab.text = @"全部";
    rightLab.textColor = [UIColor grayColor];
    rightLab.font = [UIFont systemFontOfSize:14];
    CGSize rect2 = [self setLabelSize:rightLab];
    rightLab.frame = CGRectMake(0.75*zjbWindowW - rect2.width/2, 20-rect2.height/2,rect2.width, rect2.height);
    rightImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(rightLab, 5), 17.5, 5, 5)];
    rightImg.image = [UIImage imageNamed:@"xiasanjiao"];
    [rightImg setContentMode:UIViewContentModeScaleAspectFill];
    //添加点击事件
    rightLab.tag = 41;
    UITapGestureRecognizer * click2 =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    rightLab.userInteractionEnabled= YES;
    [rightLab addGestureRecognizer:click2];
    
    
    [headView addSubview:rightLab];
    [headView addSubview:rightImg];
    
    commendTableView.tableHeaderView  = headView;
    
}

#pragma mark 点击事件
-(void)clickAction:(UITapGestureRecognizer *)sender
{
    if ([sender view].tag == 40) {
        //左按钮
        leftLab.textColor = [UIColor redColor];
        leftImg.image = [UIImage imageNamed:@"red_sanjiao"];
        rightLab.textColor = [UIColor grayColor];
        rightImg.image = [UIImage imageNamed:@"xiasanjiao"];
//        [view1 showView];
    }else if ([sender view].tag == 41){
        //右按钮
        rightLab.textColor = [UIColor redColor];
        rightImg.image = [UIImage imageNamed:@"red_sanjiao"];
        leftLab.textColor = [UIColor grayColor];
        leftImg.image = [UIImage imageNamed:@"xiasanjiao"];
//        [view2 showView];

    }else{
        
    }
}

#pragma mark - Label自适应宽高
-(CGSize)setLabelSize:(UILabel *)label
{
    label.numberOfLines = 1;//根据最大行数需求来设置
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
    CGSize expectSize = [label sizeThatFits:maximumLabelSize];
    return expectSize;
}
#pragma mark - 创建数据显示tableview
-(void)createcommendTableView
{
    commendTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, zjbWindowH)];
    commendTableView.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    commendTableView.delegate = self;
    commendTableView.dataSource = self;
    commendTableView.tableFooterView = [[UIView alloc]init];
    commendTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:commendTableView];
}
#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * head = [[UIView alloc]init];
    head.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    return head;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifer = @"commendcell";
    ZJBComShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (cell == nil) {
        cell = [[ZJBComShowTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    return cell;
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
