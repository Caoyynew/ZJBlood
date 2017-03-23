//
//  ZJBFeedBackViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/8.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBFeedBackViewController.h"
#import "CustomTextView.h"
@interface ZJBFeedBackViewController ()
{
    UIView * companyView;
    UIView * adviceTextView;
    
    CustomTextView *cTextView1;
    CustomTextView *cTextView2;

}

@end

@implementation ZJBFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCompanyView];
    [self createAdviceTextView];
    [self drawAdviceButton];
    // Do any additional setup after loading the view.
}


-(void)createCompanyView
{
    companyView = [[UIView alloc]initWithFrame:CGRectMake(0.05*zjbWindowW, 10, 0.9*zjbWindowW, 0.224*zjbWindowH)];
    [self.view addSubview:companyView];
    
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
    UILabel *callNumber1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(phoneNoLab, 0), CGRectMT(emailAddressLab, 0), 180, y)];
    callNumber1.text = @"0571-85167819";
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
    
    UIView *greyLineView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(companyView, 0), zjbWindowW, 20)];
    greyLineView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [self.view addSubview:greyLineView];
    
}

-(void)createAdviceTextView
{
    adviceTextView = [[UIView alloc]initWithFrame:CGRectMake(0.05*zjbWindowW, CGRectMT(companyView, 15), 0.9*zjbWindowW, zjbWindowH*0.48)];
    [self.view addSubview:adviceTextView];
    
    UIImageView *logoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 20, 20)];
    logoImgView.image = [UIImage imageNamed:@"aboutapp"];
    
    UILabel *logoLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logoImgView, 20), 0, 200, 60)];
    logoLab.text = @"意见与建议";
    logoLab.font = [UIFont systemFontOfSize:17];
    [adviceTextView addSubview:logoImgView];
    [adviceTextView addSubview:logoLab];
    
    cTextView1 = [[CustomTextView alloc]initWithFrame:CGRectMake(0, CGRectMT(logoLab, 0), 0.9*zjbWindowW, 130) withType:200];
    cTextView1.zjbPlaceHolderLabel.text = @"你的意见让我们成长!";
    [adviceTextView addSubview:cTextView1];
    
//    cTextView2 = [[CustomTextView alloc]initWithFrame:CGRectMake(0, CGRectMT(cTextView1, 15), 0.9*zjbWindowW, 130) withType:200];
//    cTextView2.zjbPlaceHolderLabel.text = @"如果有不足之处,请一定指出";
//    [adviceTextView addSubview:cTextView2];
    
}

#pragma mark - 打电话
-(void)openPhone1
{
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"run on simulator");
#define SIMULATOR_TEST
#else
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://0571-85167819"]];
#endif
}
//-(void)openPhone2
//{
//#if TARGET_IPHONE_SIMULATOR
//    NSLog(@"run on simulator");
//#define SIMULATOR_TEST
//#else
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://85167819"]];
//#endif
//}
#pragma mark - 建议按钮
-(void)drawAdviceButton
{
    UIButton * adviceBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW/2-100, CGRectMT(adviceTextView, 40), 200, 40)];
    adviceBtn.backgroundColor = buttonColor;
    adviceBtn.clipsToBounds=YES;
    adviceBtn.layer.cornerRadius=5;
    [adviceBtn setTitle:@"提交建议" forState:UIControlStateNormal];
    [adviceBtn addTarget:self action:@selector(adviceAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:adviceBtn];
}

-(void)adviceAction
{
    NSLog(@"点击了提交建议!");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [cTextView1.zjbTextView resignFirstResponder];
    [cTextView2.zjbTextView resignFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
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
