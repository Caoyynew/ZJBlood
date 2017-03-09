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
    
    CustomTextView *cTextView;

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
    companyView = [[UIView alloc]initWithFrame:CGRectMake(0.05*zjbWindowW, 10, 0.9*zjbWindowW, 0.3*zjbWindowH)];
    [self.view addSubview:companyView];
    
    UIImageView * feedImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 15, 20, 30)];
    feedImageView.image = [UIImage imageNamed:@"phone"];
    UILabel *feedCompanyLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(feedImageView, 10), 0, 200, 60)];
    feedCompanyLable.text = @"浙江省献血管理中心";
    [companyView addSubview:feedImageView];
    [companyView addSubview:feedCompanyLable];
    
    UILabel *lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, 0.9*zjbWindowW, 0.5)];
    lineLab.backgroundColor = [UIColor grayColor];
    [companyView addSubview:lineLab];
    CGFloat y = (0.3*zjbWindowH - 60)/3;
    
    UILabel *emailAddressLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(lineLab, 0), 300, y)];
    emailAddressLab.text = @"电子邮件:    xxfwb@zjb.org.cn";
    
    UILabel *phoneNoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(emailAddressLab, 0), 80, y)];
    phoneNoLab.text = @"联系电话:";
    
    UILabel *callNumber1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(phoneNoLab, 10), CGRectMT(emailAddressLab, 0), 90, y)];
    callNumber1.text = @"85167833";
    callNumber1.textColor = [UIColor redColor];
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
    
    UILabel *callNumber2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(callNumber1, 0), CGRectMT(emailAddressLab, 0), 90, y)];
    callNumber2.text = @"85167833";
    callNumber2.textColor = [UIColor redColor];
    callNumber2.textAlignment = NSTextAlignmentLeft;
    //加下划线
    NSDictionary *attribtDic2 = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr2 = [[NSMutableAttributedString alloc]initWithString:callNumber2.text attributes:attribtDic2];
    callNumber2.attributedText = attribtStr2;
    [companyView addSubview:callNumber2];
    
    UITapGestureRecognizer *tapCallPhone2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openPhone2)];
    
    callNumber2.userInteractionEnabled= YES;
    [callNumber2 addGestureRecognizer:tapCallPhone2];
    
    UILabel *faxNoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectMT(phoneNoLab, 0), 300, y)];
    faxNoLab.text = @"传真号码:    85179913";
    
    [companyView addSubview:emailAddressLab];
    [companyView addSubview:phoneNoLab];
    [companyView addSubview:faxNoLab];
    
    UIView *greyLineView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectMT(companyView, 0), zjbWindowW, 20)];
    greyLineView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [self.view addSubview:greyLineView];
    
}

-(void)createAdviceTextView
{
    adviceTextView = [[UIView alloc]initWithFrame:CGRectMake(0.05*zjbWindowW, CGRectMT(companyView, 25), 0.9*zjbWindowW, zjbWindowH*0.4)];
    [self.view addSubview:adviceTextView];
    
    UIImageView *logoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 20, 20)];
    logoImgView.image = [UIImage imageNamed:@"ic_about_app"];
    
    UILabel *logoLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(logoImgView, 20), 0, 200, 60)];
    logoLab.text = @"关于APP";
    
    [adviceTextView addSubview:logoImgView];
    [adviceTextView addSubview:logoLab];
    
    cTextView = [[CustomTextView alloc]initWithFrame:CGRectMake(0, CGRectMT(logoLab, 0), 0.9*zjbWindowW, zjbWindowH*0.4-60)];
    cTextView.strCount = 200;
    cTextView.zjbPlaceHolderLabel.text = @"如果符合您的心意,请不要吝啬您的赞美";
    [adviceTextView addSubview:cTextView];
    
}

#pragma mark - 打电话
-(void)openPhone1
{
    NSLog(@"1");
    //    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://85167833"]];
}

-(void)openPhone2
{
    NSLog(@"2");
    //    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://85167833"]];
}
#pragma mark - 建议按钮
-(void)drawAdviceButton
{
    UIButton * adviceBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.1*zjbWindowW, zjbWindowH*0.8, zjbWindowW*0.8, 50)];
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
    [cTextView.zjbTextView resignFirstResponder];
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
