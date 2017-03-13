//
//  ZJBLoginViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/13.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBLoginViewController.h"

@interface ZJBLoginViewController ()
{
    UITextField * phoneNum;
    UITextField * passwordNum;
    UIButton * loginBtn;
    
    UIButton * forgetPwdBtn;
    UIButton * registerBtn;
}

@end

@implementation ZJBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view .backgroundColor = RGB_COLOR(249, 82, 88, 1.0);
    [self createUI];
    
}

-(void)createUI
{
    UIImageView *logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(zjbWindowW*0.38, zjbWindowH*0.09, zjbWindowW*0.24, zjbWindowW*0.24)];
    logoIV.image = [UIImage imageNamed:@"loginlogo"];
    [self.view addSubview:logoIV];
    
    UIView * phoneView = [[UIView alloc]initWithFrame:CGRectMake(zjbWindowW*0.1, CGRectMT(logoIV, zjbWindowH*0.13),zjbWindowW*0.8,45)];
    phoneView.layer.cornerRadius = 5.0f;
    phoneView.clipsToBounds = YES;
    phoneView.backgroundColor = [UIColor whiteColor];
    UIImageView * phoneLogo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 12.5, 15,20)];
    phoneLogo.image = [UIImage imageNamed:@"shouji"];
    [phoneLogo setContentMode:UIViewContentModeScaleAspectFill];

    phoneNum = [[UITextField alloc]initWithFrame:CGRectMake(45, 0,zjbWindowW*0.8-45, 45)];
    phoneNum.placeholder = @"请输入手机号码";
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
    [pwdView addSubview:pwdLogo];
    [pwdView addSubview:passwordNum];
    
    [self.view addSubview:phoneView];
    [self.view addSubview:pwdView];
    
    loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW*0.1, CGRectMT(pwdView, 30), zjbWindowW*0.8, 45)];
    loginBtn.backgroundColor = [UIColor whiteColor];
    loginBtn.layer.cornerRadius = 5.0f;
    loginBtn.clipsToBounds = YES;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [loginBtn addTarget: self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    forgetPwdBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW*0.094, CGRectMT(loginBtn, zjbWindowH*0.2), 100, 30)];
    forgetPwdBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPwdBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [forgetPwdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:forgetPwdBtn];
    [forgetPwdBtn addTarget:self action:@selector(forgetAction) forControlEvents:UIControlEventTouchUpInside];
    
    registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(zjbWindowW*0.906-100, CGRectMT(loginBtn, zjbWindowH*0.2), 100, 30)];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [registerBtn setTitle:@"快速注册" forState:UIControlStateNormal];
    registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    [registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)loginAction
{
    NSLog(@"登录!!!!!!!");
}
-(void)forgetAction
{
    NSLog(@"忘记密码!!!!!!!");
}
-(void)registerAction
{
    NSLog(@"快速注册!!!!!!!");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [phoneNum resignFirstResponder];
    [passwordNum resignFirstResponder];
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
