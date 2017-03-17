//
//  ZJBloodHomeViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/14.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodHomeViewController.h"
#import "ZJBloodHomeTableViewCell.h"
@interface ZJBloodHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView * rootSV;
    UINib * nib;
    UIImageView * backTopView;
}
@property (nonatomic, strong) UITableView * homeTableView;

@end

@implementation ZJBloodHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建导航右侧按钮
    [self createRightButton];
    rootSV = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    rootSV.scrollEnabled = NO;
    [self.view addSubview:rootSV];
    [self createHeadUI];
    [self createTableView];
    [self createBacktoTopView];
//    rootSV.contentSize = CGSizeMake(0, 70+ _homeTableView.frame.size.height+44);
    
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


-(void)createHeadUI
{
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 70)];
//    headView.backgroundColor = [UIColor orangeColor];
    [rootSV addSubview:headView];
    //头像
    UIImageView * headIV = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 50, 50)];
    headIV.image = [UIImage imageNamed:@"icondefault"];
    headIV.layer.cornerRadius = 25.0f;
    headIV.clipsToBounds = YES;
    [headView addSubview:headIV];
    //姓名
    UILabel * nameLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(headIV, 10), 15, 100, 20)];
    nameLab.text = @"丁丁订";
    [headView addSubview:nameLab];
    //发帖数
    UILabel * cardLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(headIV, 10), CGRectMT(nameLab, 00), 100, 20)];
    cardLab.text = @"发帖 0";
    cardLab.font = [UIFont systemFontOfSize:12];
    cardLab.textColor = [UIColor grayColor];
    [headView addSubview:cardLab];

    UIView * sendCardV = [[UIView alloc]initWithFrame:CGRectMake(0.7*zjbWindowW, 15, 30, 40)];
    UIImageView * cardIV = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, 5, 15, 15)];
    cardIV.image = [UIImage imageNamed:@"fabu"];
    [cardIV setContentMode:UIViewContentModeScaleAspectFit];
    UILabel * sendCardLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 30, 20)];
    sendCardLab.text = @"发帖";
    sendCardLab.textAlignment = NSTextAlignmentCenter;
    sendCardLab.font = [UIFont systemFontOfSize:12];
    sendCardLab.textColor = [UIColor grayColor];
    [sendCardV addSubview:cardIV];
    [sendCardV addSubview:sendCardLab];
    [headView addSubview:sendCardV];
    //添加点击事件
    UITapGestureRecognizer *clickTouch1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    sendCardV.tag = 101;
    sendCardV.userInteractionEnabled= YES;
    [sendCardV addGestureRecognizer:clickTouch1];
    
    UIView * replyV = [[UIView alloc]initWithFrame:CGRectMake(CGRectML(sendCardV, 30), 15, 30, 40)];
    UIImageView * replyIV = [[UIImageView alloc]initWithFrame:CGRectMake(7.5, 5, 15, 15)];
    replyIV.image = [UIImage imageNamed:@"huifu"];
    [replyIV setContentMode:UIViewContentModeScaleAspectFit];
    UILabel * replyCardLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 30, 20)];
    replyCardLab.text = @"回复";
    replyCardLab.textAlignment = NSTextAlignmentCenter;
    replyCardLab.textColor = [UIColor grayColor];
    replyCardLab.font = [UIFont systemFontOfSize:12];
    [replyV addSubview:replyIV];
    [replyV addSubview:replyCardLab];
    [headView addSubview:replyV];
    //添加点击事件
    UITapGestureRecognizer *clickTouch2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction:)];
    replyV.tag = 102;
    replyV.userInteractionEnabled= YES;
    [replyV addGestureRecognizer:clickTouch2];
}

-(void)createTableView
{
    _homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 70, zjbWindowW, zjbWindowH-70-66)];
    _homeTableView.delegate = self;
    _homeTableView.dataSource = self;
    _homeTableView.tableFooterView = [[UIView alloc]init];
//    _homeTableView.scrollEnabled = NO;
    _homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [rootSV addSubview:_homeTableView];
}
#pragma mark 创建backtop
-(void)createBacktoTopView
{
    CGRect rx = [UIScreen mainScreen ].bounds;
    backTopView = [[UIImageView alloc]initWithFrame:CGRectMake(rx.size.width*0.78,rx.size.height*0.88, 50, 50)];
    backTopView.image = [UIImage imageNamed:@"backtotop"];
    [backTopView setContentMode:UIViewContentModeScaleAspectFill];
    backTopView.layer.cornerRadius = 25.0f;
    backTopView.clipsToBounds = YES;
    backTopView.backgroundColor = RGB_COLOR(242, 242, 242, 0.3);
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:backTopView];
    backTopView.hidden = YES;
    
    UITapGestureRecognizer *clickTouch=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backtoTopAction)];
    backTopView.userInteractionEnabled= YES;
    [backTopView addGestureRecognizer:clickTouch];

}

#pragma mark - 发帖和回复按钮
-(void)clickAction:(UITapGestureRecognizer *)sender
{
    //101:发帖 102:回复
    NSLog(@"click tag=%ld",[sender view].tag);
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 380.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identy = @"ZJBloodHomeCell";
    if (!nib) {
        nib = [UINib nibWithNibName:@"ZJBloodHomeTableViewCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identy];
    }
    ZJBloodHomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identy];
    return cell;
}
#pragma mark - 下滑显示backtop按钮
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    float y = scrollView.contentOffset.y;
    if (y>=2*zjbWindowH) {
        backTopView.hidden = NO;
    }else{
        backTopView.hidden = YES;
    }
}
-(void)backtoTopAction
{
    //返回顶部代码
    [_homeTableView setContentOffset:CGPointMake(0, 0) animated:YES];
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
