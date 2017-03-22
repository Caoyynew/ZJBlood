//
//  ZJBHonorThreeViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/21.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBHonorThreeViewController.h"

@interface ZJBHonorThreeViewController ()

@end

@implementation ZJBHonorThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    // Do any additional setup after loading the view.
}

-(void)createUI
{
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, zjbWindowW, 53)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    
    UIImageView * dataLogoImg = [[UIImageView alloc]initWithFrame:CGRectMake(15, 16.5, 23, 20)];
    dataLogoImg.image = [UIImage imageNamed:@"ziliaozhaopian"];
    [dataLogoImg setContentMode:UIViewContentModeScaleAspectFill];
    
    UILabel * titleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(dataLogoImg, 10), 15, 100, 23)];
    titleLab.text = @"资料照片";
    titleLab.font = [UIFont systemFontOfSize:17];
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(15, CGRectMT(titleView, 1), zjbWindowW-30, 1)];
    line.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    
    [titleView addSubview:dataLogoImg];
    [titleView addSubview:titleLab];
    [self.view addSubview:line];
    //照片
    UIView * picView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(line, 0), zjbWindowW, 400)];
//    picView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:picView];
    
    UILabel * picLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 180, 20)];
    picLab.text = @"本人一寸照(背景须为红色)";
    picLab.font = [UIFont systemFontOfSize:15];
    
    UIImageView * picTip = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(picLab, 5), 12.5, 15, 15)];
    picTip.image = [UIImage imageNamed:@"tishi"];
    
    UIImageView * uploadPic1 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectMT(picLab, 10), 62, 62)];
    uploadPic1.image = [UIImage imageNamed:@"uploadpic_def"];
    [uploadPic1 setContentMode:UIViewContentModeScaleAspectFill];
    
    UILabel * idLab = [[UILabel alloc]initWithFrame:CGRectMake(15, CGRectMT(uploadPic1, 10), 100, 20)];
    idLab.text = @"身份证复印件";
    idLab.font = [UIFont systemFontOfSize:15];
    
    UIImageView * picTip2 = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectML(idLab, 0), CGRectMT(uploadPic1, 12.5), 15, 15)];
    picTip2.image = [UIImage imageNamed:@"tishi"];
   
    UIImageView * uploadPic2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, CGRectMT(idLab, 10), 62, 62)];
    uploadPic2.image = [UIImage imageNamed:@"uploadpic_def"];
    [uploadPic2 setContentMode:UIViewContentModeScaleAspectFill];
    
    [picView addSubview:picLab];
    [picView addSubview:picTip];
    [picView addSubview:uploadPic1];
    [picView addSubview:idLab];
    [picView addSubview:picTip2];
    [picView addSubview:uploadPic2];
    
    //按钮
    UIButton * nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100,CGRectMT(uploadPic2, 20),200,40)];
    nextBtn.backgroundColor = buttonColor;
    nextBtn.clipsToBounds=YES;
    nextBtn.layer.cornerRadius=5;
    nextBtn.tag = 30;
    [nextBtn setTitle:@"提交申请" forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(nextBtn, 20), 200, 40)];
    backBtn.backgroundColor = [UIColor grayColor];
    backBtn.clipsToBounds=YES;
    backBtn.layer.cornerRadius=5;
    backBtn.tag = 31;
    [backBtn setTitle:@"上一步" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(adviceAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [picView addSubview:nextBtn];
    [picView addSubview:backBtn];
}

-(void)ZJBActionBlock3:(ZJBActionBlock3)block
{
    self._block = block;
}

-(void)adviceAction:(UIButton *)sender
{
    if (sender.tag == 30) {
        NSLog(@"下一项");
        self._block(3);
    }else if (sender.tag == 31){
        NSLog(@"上一步");
        self._block(4);
    }
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
