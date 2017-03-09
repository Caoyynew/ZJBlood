//
//  ZJBAddressViewController.m
//  Zjblood
//
//  Created by Cao yang on 2017/3/9.
//  Copyright © 2017年 Zjblood. All rights reserved.
//

#import "ZJBAddressViewController.h"
#import "CustomTextView.h"
@interface ZJBAddressViewController ()
{
    CustomTextView * custTextView;
    
    NSString * locationAddress;
    NSString * inputAddress;
}
@end

@implementation ZJBAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏右按钮
    [self createRightButton];
    [self createAddressView];
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    custTextView.zjbTextView.text = _zjbAddress;
}

-(void)createRightButton
{
    UIBarButtonItem * rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction)];
    rightBtn.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)createAddressView
{
    UIView * addressView = [[UIView alloc]initWithFrame:CGRectMake(0, 15, zjbWindowW, 60)];
    addressView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:addressView];
    
    UILabel * addressLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 60)];
    addressLab.text = @"所在地区";
    [addressView addSubview:addressLab];
    
    UIImageView * jiantou = [[UIImageView alloc]initWithFrame:CGRectMake(zjbWindowW-20, 20, 10, 20)];
    jiantou.image = [UIImage imageNamed:@"xiangyou-1"];
    [addressView addSubview:jiantou];
    
    UILabel * addressLabel =[[UILabel alloc]initWithFrame:CGRectMake(120, 0, zjbWindowW-150, 60)];
    //TODO:定位
    locationAddress = @"杭州市下城区";
    addressLabel.text = locationAddress;
    addressLabel.textAlignment = NSTextAlignmentRight;
    [addressView addSubview:addressLabel];
    
    
    custTextView = [[CustomTextView alloc]initWithFrame:CGRectMake(0, 76, zjbWindowW, 100)withType:50];
    custTextView.zjbPlaceHolderLabel.text = @"请输入您的详细地址";
    
    custTextView.zjbTextView.text = _zjbAddress;
    [self.view addSubview:custTextView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [custTextView.zjbTextView resignFirstResponder];
}

-(void)saveAction
{
    inputAddress = custTextView.zjbTextView.text;
    self._block(locationAddress,inputAddress);
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)ZJBAddressBlock:(ZJBAddressBlock)block
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
