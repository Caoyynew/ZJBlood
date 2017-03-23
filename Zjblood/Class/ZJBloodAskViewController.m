//
//  ZJBloodAskViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/14.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodAskViewController.h"
#import "ZJBMapView.h"
#import "ZJBMapTableViewCell.h"
@interface ZJBloodAskViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * resultTableView;
}
@end

@implementation ZJBloodAskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRightButton];
    ZJBMapView * map = [[ZJBMapView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, zjbWindowH*0.35)];
    [self.view addSubview:map];
    
    resultTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectMT(map, 0), zjbWindowW, zjbWindowH*0.65-44-22)];
    [self.view addSubview:resultTableView];
    resultTableView.delegate = self;
    resultTableView.dataSource = self;
    resultTableView.tableFooterView = [[UIView alloc]init];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 33.0f;
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        return 145.0f;
    }
    return 65.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 15.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[[UITableViewCell alloc]init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0 && indexPath.row == 0) {
        UILabel * searchLab = [[UILabel alloc]initWithFrame:CGRectMake(0,0, zjbWindowW, 33)];
        [self.view addSubview:searchLab];
        searchLab.text = @"共找到2个献血屋";
        searchLab.textAlignment = NSTextAlignmentCenter;
        searchLab.textColor = [UIColor grayColor];
        searchLab.font = [UIFont systemFontOfSize:14];
        [cell addSubview:searchLab];
    }else
        if (indexPath.section == 1 && indexPath.row == 0) {
            UIView * companyView = [[UIView alloc]initWithFrame:CGRectMake(0.05*zjbWindowW, 10, 0.9*zjbWindowW, 145)];
            [cell addSubview:companyView];
            
            UIImageView * feedImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12.5, 15, 20)];
            feedImageView.image = [UIImage imageNamed:@"companyphone"];
            UILabel *feedCompanyLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(feedImageView, 10), 0, 200, 45)];
            feedCompanyLable.text = @"浙江省献血管理中心";
            feedCompanyLable.font = [UIFont systemFontOfSize:17];
            [companyView addSubview:feedImageView];
            [companyView addSubview:feedCompanyLable];
            
            UILabel *lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, 0.9*zjbWindowW, 0.5)];
            lineLab.backgroundColor = [UIColor grayColor];
            [companyView addSubview:lineLab];
            CGFloat y = (0.224*zjbWindowH - 45)/3;
            
            UILabel *emailAddressLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(lineLab, 0), 80, y)];
            emailAddressLab.text = @"电子邮件:";
            emailAddressLab.font = [UIFont systemFontOfSize:15];
            emailAddressLab.textColor = [UIColor grayColor];
            
            UILabel *emailNo =[[UILabel alloc]initWithFrame:CGRectMake(CGRectML(emailAddressLab, 0), CGRectMT(lineLab, 0), 180, y)];
            emailNo.text = @"zjxxgl@163.com";
            emailNo.font = [UIFont systemFontOfSize:15];
            emailNo.textColor = [UIColor grayColor];
            
            UILabel *phoneNoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(emailAddressLab, 0), 80, y)];
            phoneNoLab.text = @"联系电话:";
            phoneNoLab.font = [UIFont systemFontOfSize:15];
            phoneNoLab.textColor = [UIColor grayColor];
            UILabel *callNumber1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(phoneNoLab, 0), CGRectMT(emailAddressLab, 0), zjbWindowW - 100, y)];
            callNumber1.text = @"0571-85167813";
            callNumber1.textColor = [UIColor redColor];
            callNumber1.font = [UIFont systemFontOfSize:15];
            callNumber1.textAlignment = NSTextAlignmentLeft;
            //加下划线
            NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
            NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:callNumber1.text attributes:attribtDic];
            callNumber1.attributedText = attribtStr;
            [companyView addSubview:callNumber1];
            //给label添加手势
            UITapGestureRecognizer *tapCallPhone1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPhone1)];
            callNumber1.userInteractionEnabled= YES;
            [callNumber1 addGestureRecognizer:tapCallPhone1];
            
            UILabel *faxNoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(phoneNoLab, 0), 80, y)];
            faxNoLab.text = @"传真号码:";
            faxNoLab.font = [UIFont systemFontOfSize:15];
            faxNoLab.textColor = [UIColor grayColor];
            
            UILabel *faxNo = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(faxNoLab, 0), CGRectMT(phoneNoLab, 0), 100, y)];
            faxNo.text = @"85179369";
            faxNo.font = [UIFont systemFontOfSize:15];
            faxNo.textColor = [UIColor grayColor];
            
            [companyView addSubview:emailAddressLab];
            [companyView addSubview:emailNo];
            [companyView addSubview:phoneNoLab];
            [companyView addSubview:faxNoLab];
            [companyView addSubview:faxNo];
        }
        else{
            static NSString *identy = @"zjbMapCell";
            UINib * nib;
            if (!nib) {
                nib = [UINib nibWithNibName:@"ZJBMapTableViewCell" bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:identy];
            }
            ZJBMapTableViewCell * cell1 = [tableView dequeueReusableCellWithIdentifier:identy];
            cell = cell1;
        }
    return cell;
}
#pragma mark - 打电话
-(void)openPhone1
{
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"run on simulator");
#define SIMULATOR_TEST
#else
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://0571-85167813"]];
#endif
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
