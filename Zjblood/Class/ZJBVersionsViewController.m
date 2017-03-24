//
//  ZJBVersionsViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/24.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBVersionsViewController.h"

@interface ZJBVersionsViewController ()

@end

@implementation ZJBVersionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    // Do any additional setup after loading the view.
}

-(void)createUI
{
    UIImageView * logo = [[UIImageView alloc]initWithFrame:CGRectMake(zjbWindowW/2-30, 40, 60, 60)];
    logo.layer.cornerRadius = 5.0f;
    logo.clipsToBounds = YES;
    logo.image = [UIImage imageNamed:@"version"];
    [self.view addSubview:logo];
    
    UILabel * versionsTitle = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(logo, 20), 200, 20)];
    versionsTitle.font = [UIFont systemFontOfSize:17];
    versionsTitle.textAlignment = NSTextAlignmentCenter;
    versionsTitle.text = @"版本号:V2.0.0.1";
    versionsTitle.textColor = [UIColor grayColor];
    [self.view addSubview:versionsTitle];
    
    UILabel *detail = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW*0.1, CGRectMT(versionsTitle, 20), zjbWindowW*0.8, 60)];
    detail.textAlignment = NSTextAlignmentCenter;
    detail.text = @"主要提供荣誉证查询、荣誉证申领、献血服务、日常签到积分、资料查询等。";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 5;    //行间距
//    paragraphStyle.maximumLineHeight = 60;   /**最大行高*/
//    paragraphStyle.firstLineHeadIndent = 33.f;    /**首行缩进宽度*/
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:16],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    detail.attributedText = [[NSAttributedString alloc] initWithString:detail.text attributes:attributes];
    detail.numberOfLines =  2;
    detail.textColor = [UIColor grayColor];
    [self.view addSubview:detail];
    
    UILabel * company = [[UILabel alloc]initWithFrame:CGRectMake(0, zjbWindowH*0.8, zjbWindowW, 15)];
    company.text = @"浙江红康互联网科技有限公司";
    company.textAlignment = NSTextAlignmentCenter;
    company.textColor = [UIColor grayColor];
    company.font = [UIFont systemFontOfSize:14];
    
    [self.view addSubview:company];
    
    UILabel *copyLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(company, 10), zjbWindowW, 15)];
    copyLab.textColor = [UIColor grayColor];
    copyLab.textAlignment = NSTextAlignmentCenter;
    copyLab.text = @"Copyright©2016-2017";
    copyLab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:copyLab];
    
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
