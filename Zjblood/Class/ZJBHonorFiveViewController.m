//
//  ZJBHonorFiveViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorFiveViewController.h"

@interface ZJBHonorFiveViewController ()

@end

@implementation ZJBHonorFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView * commendLogo = [[UIImageView alloc]initWithFrame:CGRectMake(zjbWindowW/2-50, 100, 100, 100)];
    commendLogo.image = [UIImage imageNamed:@"daishenhe"];
    [commendLogo setContentMode:UIViewContentModeScaleAspectFill];
    
    UILabel * message = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW/2-80, CGRectMT(commendLogo, 10), 160, 60)];
    message.text = @"您的信息已成功提交,审核通过后领取!";
    message.numberOfLines = 2;
    message.textAlignment = NSTextAlignmentCenter;
    message.font = [UIFont systemFontOfSize:16];
    
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(message, 30), 200, 40)];
    backBtn.backgroundColor = buttonColor;
    backBtn.clipsToBounds=YES;
    backBtn.layer.cornerRadius=5;
    [backBtn setTitle:@"返回首页" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:commendLogo];
    [self.view addSubview:message];
    [self.view addSubview:backBtn];
    
    UIView * tipsView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(backBtn, 120), zjbWindowW, 40)];
    
    [self.view addSubview:tipsView];
    
    UILabel * tips1 = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW/2-70, 0, 140, 20)];
    tips1.text = @"想要了解申请进度?";
    tips1.textColor = [UIColor grayColor];
    tips1.textAlignment = NSTextAlignmentCenter;
    tips1.font = [UIFont systemFontOfSize:13];
    [tipsView addSubview:tips1];
    
    UILabel * tips2 = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW/2-125, CGRectMT(tips1, 0), 250, 20)];
    tips2.text = @"点击首页右下角'我',在我的荣誉证中查看";
    tips2.font = [UIFont systemFontOfSize:13];
    tips2.textColor = [UIColor grayColor];
    tips2.textAlignment = NSTextAlignmentCenter;
    [tipsView addSubview:tips2];

}
-(void)adviceAction:(UIButton *)sender
{
    self._block(7);
}

-(void)ZJBActionBlock5:(ZJBActionBlock5)block
{
    self._block = block;
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
