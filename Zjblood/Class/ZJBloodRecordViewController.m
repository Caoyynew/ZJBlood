//
//  ZJBloodRecordViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/13.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBloodRecordViewController.h"
#import "ZJBloodResultViewController.h"
@interface ZJBloodRecordViewController ()<UITextFieldDelegate>
{
    UITextField * idTextField;
    UIButton * searchBtn;
}

@end

@implementation ZJBloodRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [idTextField resignFirstResponder];
}


-(void)createUI
{
    UIImageView * searchIV = [[UIImageView alloc]initWithFrame:CGRectMake(zjbWindowW*0.33, zjbWindowH*0.127, zjbWindowW*0.34, zjbWindowH*0.15)];
    searchIV.image = [UIImage imageNamed:@"chaxundatu"];
    [searchIV setContentMode:UIViewContentModeScaleAspectFit];

    [self.view addSubview:searchIV];
    
    UIView * idTextView = [[UIView alloc]initWithFrame:CGRectMake(0.13*zjbWindowW, CGRectMT(searchIV, zjbWindowH*0.09), 0.74*zjbWindowW, 45)];
    idTextView.layer.cornerRadius = 5.0f;
    idTextView.clipsToBounds = YES;
    idTextView.layer.borderWidth = 0.5f;
    idTextView.layer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor blackColor]);
    [self.view addSubview:idTextView];
    //idlogo
    UIImageView *idlogo = [[UIImageView alloc]initWithFrame:CGRectMake(15, 14, 17, 17)];
    idlogo.image = [UIImage imageNamed:@"serviceidlogo"];
    [idlogo setContentMode:UIViewContentModeScaleAspectFit];

    [idTextView addSubview:idlogo];
    
    idTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectML(idlogo, 15), 0, 0.74*zjbWindowW, 45)];
    idTextField.placeholder = @"请输入身份证号";
    [idTextView addSubview:idTextField];
    idTextField.delegate = self;
    idTextField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    //设置键盘return类型
//    idTextField.returnKeyType = UIReturnKeySearch;
    
    searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0.13*zjbWindowW, CGRectMT(idTextView, zjbWindowH*0.045), 0.74*zjbWindowW, 45)];
    [searchBtn setBackgroundColor:tabarColor];
    searchBtn.layer.cornerRadius = 5.0f;
    searchBtn.clipsToBounds = YES;
    [searchBtn setTitle:@"查询" forState:UIControlStateNormal];
    [self.view addSubview:searchBtn];
    [searchBtn addTarget:self action:@selector(searchIdAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * messageLab = [[UILabel alloc]initWithFrame:CGRectMake(zjbWindowW/3, CGRectMT(searchBtn, 0.24*zjbWindowH), zjbWindowW/3, 20)];
    messageLab.text = @"献血从我做起!";
    messageLab.textColor = [UIColor grayColor];
    messageLab.textAlignment = NSTextAlignmentCenter;
    messageLab.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:messageLab];
    
    UIImageView *tishiView = [[UIImageView alloc]initWithFrame:CGRectMake(0.24*zjbWindowW, CGRectMT(messageLab, 5), 10, 10)];
    [tishiView setContentMode:UIViewContentModeScaleAspectFit];
    tishiView.image = [UIImage imageNamed:@"tishi2"];
    [self.view addSubview:tishiView];
    UILabel * tishiLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectML(tishiView, 5), CGRectMT(messageLab, 0), 0.52*zjbWindowW, 20)];
    tishiLab.textAlignment = NSTextAlignmentLeft;
    tishiLab.font = [UIFont systemFontOfSize:13];
    tishiLab.text = @"请认真核对您的身份证信息!";
    tishiLab.textColor = [UIColor grayColor];
    [self.view addSubview:tishiLab];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [idTextField resignFirstResponder];
    return YES;
}


-(void)searchIdAction
{
    NSLog(@"------查询献血记录");
    ZJBloodResultViewController * result = [[ZJBloodResultViewController alloc]init];
    result.title = @"献血记录";
    result.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:result animated:YES];

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
