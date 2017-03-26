//
//  ZJBRegisterViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/24.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBRegisterViewController.h"

@interface ZJBRegisterViewController ()
{
    UITextField * phoneNum;
    UITextField * passwordNum;
    UITextField * securityNum;
    UIButton * loginBtn;
    //获取验证码按钮
    UIButton * securtyBtn;
    
    UIImageView *img;
    UIButton * agreenBtn;
    int touch;
}

@end

@implementation ZJBRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置页面背景和导航栏颜色
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ditu"]];
    [self.navigationController.navigationBar setBarTintColor:RGB_COLOR(253, 91, 88, 1.0)];
    
    [self createUI];
    // Do any additional setup after loading the view.
}
#pragma mark - UI界面
-(void)createUI
{
    UIImageView *logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(zjbWindowW*0.38, zjbWindowH*0.19-44-22, zjbWindowW*0.24, zjbWindowW*0.24*1.35)];
    logoIV.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logoIV];
    
    UIView * phoneView = [[UIView alloc]initWithFrame:CGRectMake(zjbWindowW*0.1, CGRectMT(logoIV, zjbWindowH*0.13/1.35),zjbWindowW*0.8,45)];
    phoneView.layer.cornerRadius = 5.0f;
    phoneView.clipsToBounds = YES;
    phoneView.backgroundColor = [UIColor whiteColor];
    UIImageView * phoneLogo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 12.5, 15,20)];
    phoneLogo.image = [UIImage imageNamed:@"shouji"];
    [phoneLogo setContentMode:UIViewContentModeScaleAspectFill];
    phoneNum = [[UITextField alloc]initWithFrame:CGRectMake(45, 0,zjbWindowW*0.8-45, 45)];
    phoneNum.placeholder = @"请输入手机号码";
    phoneNum.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [phoneView addSubview:phoneLogo];
    [phoneView addSubview:phoneNum];
    
    UIView * pwdView = [[UIView alloc]initWithFrame:CGRectMake(zjbWindowW*0.1,CGRectMT(phoneView, 12.5), zjbWindowW*0.8,45)];
    pwdView.layer.cornerRadius = 5.0f;
    pwdView.clipsToBounds = YES;
    pwdView.backgroundColor = [UIColor whiteColor];
    UIImageView * pwdLogo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 12.5, 15,20)];
    pwdLogo.image = [UIImage imageNamed:@"suo"];
    [pwdLogo setContentMode:UIViewContentModeScaleAspectFill];
    passwordNum = [[UITextField alloc]initWithFrame:CGRectMake(45, 0, zjbWindowW*0.8-45, 45)];
    passwordNum.placeholder = @"请输入密码";
    passwordNum.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [pwdView addSubview:pwdLogo];
    [pwdView addSubview:passwordNum];
    
    UIView * securityView = [[UIView alloc]initWithFrame:CGRectMake(zjbWindowW*0.1,CGRectMT(pwdView, 12.5), zjbWindowW*0.8,45)];
    securityView.layer.cornerRadius = 5.0f;
    securityView.clipsToBounds = YES;
    securityView.backgroundColor = [UIColor whiteColor];
    UIImageView * securityLogo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 12.5, 15,20)];
    securityLogo.image = [UIImage imageNamed:@"yanzhengma"];
    [securityLogo setContentMode:UIViewContentModeScaleAspectFill];
    securityNum = [[UITextField alloc]initWithFrame:CGRectMake(45, 0, zjbWindowW*0.8-145, 45)];
    securityNum.placeholder = @"请输入验证码";
    securityNum.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [securityView addSubview:securityLogo];
    [securityView addSubview:securityNum];
    securtyBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW*0.8-100, 0, 100, 45)];
    [securtyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    securtyBtn.layer.cornerRadius = 5.0f;
    securtyBtn.clipsToBounds = YES;
    securtyBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [securtyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    securtyBtn.backgroundColor = RGB_COLOR(242, 242, 242, 1.0);
    [securtyBtn addTarget:self action:@selector(clickSecurty) forControlEvents:UIControlEventTouchUpInside];
    [securityView addSubview:securtyBtn];
    
    loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW*0.1, CGRectMT(securityView, 30), zjbWindowW*0.8, 45)];
    loginBtn.backgroundColor = [UIColor whiteColor];
    loginBtn.layer.cornerRadius = 5.0f;
    loginBtn.clipsToBounds = YES;
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [loginBtn addTarget: self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:phoneView];
    [self.view addSubview:pwdView];
    [self.view addSubview:securityView];
    [self.view addSubview:loginBtn];
    
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(zjbWindowW*0.1, zjbWindowH-120, zjbWindowW*0.8, 20)];
    
    UIView * agreenV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    touch = 1;
    img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 10, 10)];
    img.image = [UIImage imageNamed:@"renke"];
    [agreenV addSubview:img];
    UILabel *agreenLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 180, 20)];
    agreenLab.text = @"我已阅读并认可";
    agreenLab.font = [UIFont systemFontOfSize:16];
    agreenLab.textColor = [UIColor whiteColor];
    [agreenV addSubview:agreenLab];
    
    agreenBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 20)];
    [agreenBtn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
    [agreenV addSubview:agreenBtn];
    [bottomView addSubview:agreenV];
    [self.view addSubview:bottomView];
}

-(void)clickAction
{
    touch = touch +1;
    if (touch%2 == 0) {
        img.image = [UIImage imageNamed:@""];
    }else{
        img.image = [UIImage imageNamed:@"renke"];
    }
}

#pragma mark - 注册
-(void)registerAction
{
    NSLog(@"快速注册!!!!!!!");
}
#pragma mark - 获取验证码
-(void)clickSecurty
{
    //TODO:短信验证
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [phoneNum resignFirstResponder];
    [passwordNum resignFirstResponder];
    [securityNum resignFirstResponder];
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
